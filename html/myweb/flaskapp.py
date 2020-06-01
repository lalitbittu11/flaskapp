from flask import Flask
app = Flask(__name__)
@app.route('/')
def hello_world():
  return 'Hello from Flask Lalit!'

@app.route('/home')
def app_home():
  return 'this is home page of my app'

@app.route('/login')
def app_login():
  return 'this is login page of my app'

if __name__ == '__main__':
  app.run()
