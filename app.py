from flask import Flask, request, jsonify

app = Flask(__name__)

@app.route('/contact', methods=['POST'])
def contact():
    data = request.get_json()
    name = data.get('name')
    email = data.get('email')
    message = data.get('message')
    
    # Here you can handle the form data, e.g., save to database or send email
    
    return jsonify({'status': 'success', 'message': 'Thank you for your message!'})

if __name__ == '__main__':
    app.run(debug=True)
