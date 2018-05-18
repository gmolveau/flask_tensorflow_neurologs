import tensorflow as tf
import os, numpy, json

from collections import namedtuple

Prediction = namedtuple('Prediction', ['prediction', 'accuracy', 'type'])

SSH_MODEL_PATH = './models/ssh'
NGINX_MODEL_PATH = './models/nginx'


def predict_ssh(r_json):
    with tf.Session() as sess:
        # load the model
        tf.saved_model.loader.load(sess, [tf.saved_model.tag_constants.SERVING], SSH_MODEL_PATH)
        # get the predictor
        predictor = tf.contrib.predictor.from_saved_model(SSH_MODEL_PATH)
        # prepare the inputs
        feature_dict = {
            'ip': _bytes_feature( r_json["ip"].encode() ),
            'country': _bytes_feature( r_json["country"].encode() ),
            'provider': _bytes_feature( r_json["provider"].encode() ),
            'invalid_user': _bytes_feature( r_json["invalid_user"].encode() ),
            'username': _bytes_feature( r_json["username"].encode() ),
            'auth_method': _bytes_feature( r_json["auth_method"].encode() ),
            'success': _bytes_feature( r_json["success"].encode() ),
        }
        # Prepare model input
        model_input = tf.train.Example(features=tf.train.Features(feature=feature_dict))
        model_input = model_input.SerializeToString()
        # do the prediction
        output_dict = predictor({"inputs": [model_input]})
        # predict -> 0 = bad-hack / 1 = good
        label_index = numpy.argmax(output_dict['scores'])
        return Prediction(
            prediction = str(numpy.argmax(output_dict['scores'])),
            accuracy = str(output_dict['scores'][0][label_index]),
            type = "ssh_tensorflow")


def predict_nginx(r_json):
    with tf.Session() as sess:
        # load the model
        tf.saved_model.loader.load(sess, [tf.saved_model.tag_constants.SERVING], NGINX_MODEL_PATH)
        # get the predictor
        predictor = tf.contrib.predictor.from_saved_model(NGINX_MODEL_PATH)
        # prepare the inputs
        feature_dict = {
            'ip': _bytes_feature( r_json['ip'].encode() ),
            'country': _bytes_feature( r_json['country'].encode() ),
            'provider': _bytes_feature( r_json['provider'].encode() ),
            'user_agent': _bytes_feature( r_json['user_agent'].encode() ),
            'method': _bytes_feature( r_json['method'].encode() ),
            'url': _bytes_feature( r_json['url'].encode() ),
            'get_query': _bytes_feature( r_json['get_query'].encode() ),
            'post_query': _bytes_feature( r_json['post_query'].encode() ),
            'post_length': _bytes_feature( r_json['post_length'].encode() )
        }
        # Prepare model input
        model_input = tf.train.Example(features=tf.train.Features(feature=feature_dict))
        model_input = model_input.SerializeToString()
        # do the prediction
        output_dict = predictor({"inputs": [model_input]})
        # predict -> 0 = bad-hack / 1 = good
        label_index = numpy.argmax(output_dict['scores'])
        return Prediction(
            prediction = str(label_index),
            accuracy = str(output_dict['scores'][0][label_index]),
            type = "nginx_tensorflow")


def _float_feature(value):
    return tf.train.Feature(cate=tf.train.FloatList(value=[value]))


def _bytes_feature(value):
    return tf.train.Feature(bytes_list=tf.train.BytesList(value=[value]))


def _int64_feature(value):
    return tf.train.Feature(int64_list=tf.train.Int64List(value=[value]))
