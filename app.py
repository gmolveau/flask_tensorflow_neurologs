import os, sys
from flask import Flask, request, jsonify
from flask_cors import CORS

from serve import predict_ssh, predict_nginx

app = Flask(__name__)
CORS(app)

@app.route('/predict/ssh', methods=['POST'])
def r_predict_ssh():
    input_data = request.json
    print(input_data)
    # check that input_data is complete
    output_data = predict_ssh(input_data)
    return jsonify(output_data)

@app.route('/predict/nginx', methods=['POST'])
def r_predict_nginx():
    input_data = request.json
    print(input_data)
    # check that input_data is complete
    output_data = predict_nginx(input_data)
    return jsonify(output_data)


@app.route('/')
def index():
    return "Index API"

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000, debug=True)
