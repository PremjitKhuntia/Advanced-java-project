<%@page contentType="text/html;charset=UTF-8"%>
<html>
<head>
    <title>Online Movie Ticket Booking System</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #141E30, #243B55);
            color: #fff;
            text-align: center;
            padding-top: 100px;
            margin: 0;
        }
        h1 {
            font-size: 36px;
            letter-spacing: 1px;
            margin-bottom: 40px;
            text-shadow: 2px 2px 5px rgba(0,0,0,0.5);
        }
        a {
            text-decoration: none;
            color: #00BFFF;
            font-size: 20px;
            margin: 0 15px;
            border: 2px solid #00BFFF;
            padding: 8px 18px;
            border-radius: 25px;
            transition: all 0.3s ease;
        }
        a:hover {
            background-color: #00BFFF;
            color: #fff;
            box-shadow: 0 0 10px #00BFFF;
        }
    </style>
</head>
<body>
    <h1>Welcome to Online Movie Ticket Booking System</h1>
    <a href="login.jsp">Login</a>
    <a href="register.jsp">Register</a>
    <a href="movies.jsp">See Movies</a>
</body>
</html>
