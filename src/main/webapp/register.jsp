<!DOCTYPE html>
<html>
<head>
    <title>Register</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>
    <div class="auth-container">
        <div class="auth-box">
            <h2>Create Account</h2>
            <form action="register" method="post">
                <input type="text" name="username" placeholder="Enter Name" required><br>
                <input type="email" name="email" placeholder="Enter Email" required><br>
                <input type="password" name="password" placeholder="Create Password" required><br>
                <input type="submit" value="Register">
            </form>
            <p>Already a member? <a href="login.jsp">Sign in</a></p>
        </div>
    </div>
</body>
</html>