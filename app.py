from flask import Flask, request

app = Flask(__name__)

@app.route('/login', methods=['POST'])
def login():
    username = request.form.get('username')
    password = request.form.get('password')
    # In a real application, you would add authentication logic here
    print(f"Attempted login with Username: {username}, Password: {password}")
    # For now, just redirect back to the home page or show a success message
    return "Login attempt received. Check console for credentials. (This is a placeholder)"

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
