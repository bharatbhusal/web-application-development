function generateCaptcha() {
    var captchaText = generateRandomString(6); // Change 6 to the desired length of the captcha text
    document.getElementById('captchaText').innerText = captchaText;
}

function validateForm() {
    // Add your regular expression validations here for username, name, phone, email, password, and confirmPassword
    // Display appropriate error messages using div elements

    // Validate captcha
    var enteredCaptcha = document.getElementById('captchaInput').value;
    var captchaText = document.getElementById('captchaText').innerText;

    if (enteredCaptcha.toLowerCase() !== captchaText.toLowerCase())
    {
        document.getElementById('error-message').innerText = 'Captcha verification failed';
        return false;
    }

    return true;
}

function validateLogin() {
    // Check login credentials
    var loginUsername = document.getElementById('loginUsername').value;
    var loginPassword = document.getElementById('loginPassword').value;

    // For simplicity, checking if the username is 'user' and password is 'password'
    if (loginUsername === 'user' && loginPassword === 'password')
    {
        alert('Welcome!');
        return true; // Allow form submission
    } else
    {
        document.getElementById('error-message').innerText = 'Invalid username or password';
        return false; // Prevent form submission
    }
}

function generateRandomString(length) {
    var charset = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
    var result = '';
    for (var i = 0; i < length; i++)
    {
        var randomIndex = Math.floor(Math.random() * charset.length);
        result += charset.charAt(randomIndex);
    }
    return result;
}

// Initialize captcha on page load
generateCaptcha();
