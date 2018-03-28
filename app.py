import os, sys, re
from flask import Flask, request, jsonify, abort
from flask_cors import CORS

from serve import predict_ssh, predict_nginx

app = Flask(__name__)
CORS(app)

@app.route('/predict/ssh', methods=['POST'])
def r_predict_ssh():
    input_data = request.json
    print(input_data)
    # TODO : gérer les champs non-présents
    try:
        r_json = {
            'ip': str(input_data["_source"]["int_ip"]),
            'country': input_data["_source"]["geoip"]["country_code3"],
            'provider': input_data["_source"]["geoip"]["as_org"],
            'invalid_user': input_data["_source"]["invalid_user"],
            'username': input_data["_source"]["username"],
            'auth_method': input_data["_source"]["type_auth"],
            'success': input_data["_source"]["result"]
        }
    except:
        print("json illegal")
        abort(500)
    # check that input_data is complete
    output_data = predict_ssh(r_json)
    return jsonify(output_data)

@app.route('/predict/nginx', methods=['POST'])
def r_predict_nginx():
    input_data = request.json
    print(input_data)
    # TODO : gérer les champs non-présents
    try:
        r_json = {
            'ip': input_data["_source"]["headers"]["http_x_real_ip"],
            'country': input_data["_source"]["geoip"]["country_code3"],
            'provider': str(input_data["_source"]["geoip"]["asn"]),
            'user_agent': input_data["_source"]["headers"]["http_user_agent"],
            'method': input_data["_source"]["headers"]["request_method"],
            'url': re.sub("^http://electropose.fr","",input_data["_source"]["headers"]["http_referer"]),
            'get_query': re.sub("^/mirror","",input_data["_source"]["headers"]["request_uri"]),
            'post_query': input_data["_source"]["message"],
            'post_length': str(input_data["_source"]["message_length"])
        }
    except:
        print("json illegal")
        abort(500)
    # check that input_data is complete
    output_data = predict_nginx(r_json)
    return jsonify(output_data)


@app.route('/')
def index():
    return "Index API"

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000, debug=True)
