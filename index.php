<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login & Register</title>
</head>
<body>
    <h2>Login</h2>
    <form action="login.php" method="POST">
        <label for="login-username">Username:</label><br>
        <input type="text" id="login-username" name="username" required><br>
        <label for="login-password">Password:</label><br>
        <input type="password" id="login-password" name="password" required><br><br>
        <button type="submit">Login</button>
    </form>

    <h2>Register</h2>
    <form action="register.php" method="POST">
        <label for="register-username">Username:</label><br>
        <input type="text" id="register-username" name="username" required><br>
        <label for="register-password">Password:</label><br>
        <input type="password" id="register-password" name="password" required><br><br>
        <button type="submit">Register</button>
    </form>
</body>
</html>
