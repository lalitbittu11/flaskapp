import sys
sys.path.insert(0, '/var/www/html/myweb')
from flaskapp import app

def test_root():
    response = app.test_client().get('/')
    assert response.status_code == 200
    assert response.data == b'Hello from Flask Lalit!'

def test_home():
    response = app.test_client().get('/home')
    assert response.status_code == 200
    assert response.data == b'this is home page of my app'

def test_login():
    response = app.test_client().get('/login')
    assert response.status_code == 200
    assert response.data == b'this is login page of my app'
