<!DOCTYPE html>
<html>
<head>
    <title>Register</title>
    <style>
        /* Background styling */
        body {
            font-family: "Poppins", Arial, sans-serif;
            background: linear-gradient(135deg, #90caf9, #e3f2fd);
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        /* Container */
        .auth-container {
            display: flex;
            justify-content: center;
            align-items: center;
            width: 100%;
        }

        /* Box */
        .auth-box {
            background: #ffffff;
            padding: 40px 50px;
            border-radius: 15px;
            box-shadow: 0 8px 20px rgba(0,0,0,0.1);
            text-align: center;
            width: 350px;
        }

        .auth-box h2 {
            margin-bottom: 25px;
            color: #1a237e;
            font-size: 24px;
            letter-spacing: 0.5px;
        }

        /* Inputs */
        .auth-box input[type="text"],
        .auth-box input[type="email"],
        .auth-box input[type="password"] {
            width: 90%;
            padding: 10px 15px;
            margin: 10px 0;
            border: 1px solid #ccc;
            border-radius: 8px;
            font-size: 14px;
            outline: none;
            transition: 0.3s;
        }

        .auth-box input[type="text"]:focus,
        .auth-box input[type="email"]:focus,
        .auth-box input[type="password"]:focus {
            border-color: #42a5f5;
            box-shadow: 0 0 5px rgba(66,165,245,0.5);
        }

        /* Submit button */
        .auth-box input[type="submit"] {
            width: 95%;
            padding: 10px;
            margin-top: 15px;
            background: #1e88e5;
            border: none;
            color: white;
            border-radius: 8px;
            font-size: 16px;
            cursor: pointer;
            transition: background 0.3s ease;
        }

        .auth-box input[type="submit"]:hover {
            background: #1565c0;
        }

        /* Paragraph and link */
        .auth-box p {
            margin-top: 20px;
            font-size: 14px;
            color: #333;
        }

        .auth-box a {
            color: #1e88e5;
            text-decoration: none;
            font-weight: 500;
        }

        .auth-box a:hover {
            text-decoration: underline;
        }
    </style>
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
