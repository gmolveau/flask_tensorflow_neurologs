import os, sys, re, requests
from flask import Flask, request, jsonify, abort
from flask_cors import CORS

from serve import predict_ssh, predict_nginx

app = Flask(__name__)
CORS(app)

@app.route('/predict/ssh', methods=['POST'])
def r_predict_ssh():
    """gets a custom SSH log and sends back a predicted one

    gets a enriched SSH log from logstash, slice the json to get the needed part
    give it to the tensorflow model, then sends the original log + prediction

    Decorators:
        app.route
    """
    input_data = request.json

    _ip = input_data.get("int_ip", -1)

    _geoip = input_data.get("geoip", {})
    if not _geoip:
        return jsonify(error="error geoip"),400

    _country = _geoip.get("country_code3", -1)

    _provider = _geoip.get("as_org", "")

    _username = input_data.get("username", "")

    _invalid_user = input_data.get("invalid_user", "")

    _type_auth = input_data.get("type_auth", "")

    _result = input_data.get("result", "")

    r_json = {
        'ip': str(_ip),
        'country': _country,
        'provider': _provider,
        'invalid_user': _invalid_user,
        'username': _username,
        'auth_method': _type_auth,
        'success': _result
    }

    # check that input_data is complete
    p = predict_ssh(r_json)
    input_data['predict'] = p.prediction
    input_data['accuracy'] = p.accuracy
    input_data['type'] = p.type
    try:
        r = requests.post("http://electropose.fr:6969", json=input_data)
    except Exception as e:
        print(e)
    return jsonify(input_data)

@app.route('/predict/nginx', methods=['POST'])
def r_predict_nginx():
    """gets a custom NGINX log and sends back a predicted one

    gets a enriched nginx log from logstash, slice the json to get the needed part
    give it to the tensorflow model, then sends the original log + prediction

    Decorators:
        app.route
    """
    input_data = request.json

    _headers = input_data.get("headers", {})
    if not _headers:
        return "error headers"

    _geoip = input_data.get("geoip", {})
    if not _geoip:
        return "error geoip"

    _ip = _headers.get("http_x_real_ip", "")
    if _ip is "":
        return "error ip"

    _user_agent = _headers.get("http_user_agent", "")

    _method = _headers.get("request_method", "")

    _referer = _headers.get("http_referer", "")
    _url = re.sub("^http://electropose.fr", "", _referer)

    _request_uri = _headers.get("request_uri", "")
    _get_query = re.sub("^/mirror", "", _request_uri),

    _country = _geoip.get("country_code3", -1)

    _provider = _geoip.get("asn", "")

    _post_query = input_data.get("message", "")

    _post_length = input_data.get("message_length", "0")

    r_json = {
        'ip': _ip,
        'country': _country,
        'provider': str(_provider),
        'user_agent': _user_agent,
        'method': _method,
        'url': _url,
        'get_query': _get_query,
        'post_query': _post_query,
        'post_length': str(_post_length)
    }
    # check that input_data is complete
    p = predict_nginx(r_json)
    input_data['predict'] = p.prediction
    input_data['accuracy'] = p.accuracy
    input_data['type'] = p.type
    try:
        r = requests.post("http://electropose.fr:7070", json=input_data)
    except Exception as e:
        print(e)
    return jsonify(input_data)


@app.route('/')
def index():
    return "Index API"

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000, debug=True)
