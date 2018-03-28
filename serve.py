import tensorflow as tf
import os, numpy, json


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
        r_json['predict'] = str(label_index)
        r_json['accuracy'] = str(output_dict['scores'][0][label_index])
        r_json['type'] = "ssh_tensorflow"
        return r_json


def predict_nginx(r_json):
    with tf.Session() as sess:
        # load the model
        tf.saved_model.loader.load(sess, [tf.saved_model.tag_constants.SERVING], NGINX_MODEL_PATH)
        # get the predictor
        predictor = tf.contrib.predictor.from_saved_model(NGINX_MODEL_PATH)
        # prepare the inputs
        feature_dict = {
            'ip': _bytes_feature( r_json['headers.http_x_real_ip'].encode() ),
            'country': _bytes_feature( r_json[''].encode() ),
            'provider': _bytes_feature( r_json[''].encode() ),
            'user_agent': _bytes_feature( r_json[''].encode() ),
            'method': _bytes_feature( r_json[''].encode() ),
            'url': _bytes_feature( r_json[''].encode() ),
            'get_query': _bytes_feature( r_json[''].encode() ),
            'post_query': _bytes_feature( r_json[''].encode() ),
            'post_length': _bytes_feature( r_json[''].encode() )
        }
        # Prepare model input
        model_input = tf.train.Example(features=tf.train.Features(feature=feature_dict))
        model_input = model_input.SerializeToString()
        # do the prediction
        output_dict = predictor({"inputs": [model_input]})
        # predict -> 0 = bad-hack / 1 = good
        label_index = numpy.argmax(output_dict['scores'])
        r_json['predict'] = str(label_index)
        r_json['accuracy'] = str(output_dict['scores'][0][label_index])
        r_json["type"] = "nginx_tensorflow"
        return r_json


def _bytes_feature(value):
    return tf.train.Feature(bytes_list=tf.train.BytesList(value=[value]))
