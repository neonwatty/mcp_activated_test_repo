from flask import Flask, jsonify

app = Flask(__name__)

@app.route('/')
def home():
    return jsonify({
        'message': 'Welcome to the Flask API',
        'status': 'running'
    })

@app.route('/health')
def health():
    return jsonify({
        'status': 'healthy',
        'version': '1.0.0'
    })

if __name__ == '__main__':
    # Run the app on all network interfaces (0.0.0.0) and port 5001
    app.run(host='0.0.0.0', port=5001) 