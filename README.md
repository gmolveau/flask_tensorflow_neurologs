# NEUROLOGS

This is an autonomous school project.

The idea is to create a TensorFlow model for each type of log (ssh, nginx) to categorize them.

A log is either bad (hacking = 0) or good (normal usage = 1).

```bash
virtualenv venv -p python3
source venv/bin/activate
pip3 install -r requirements.txt

gunicorn app:app -b 127.0.0.1:5000
gunicorn app:app -b 0.0.0.0:5000

# localhost:5000/predict/ssh

```
