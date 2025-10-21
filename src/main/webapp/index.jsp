<%@page contentType="text/html;charset=UTF-8"%>
<html>
<head>
    <title>Online Movie Ticket Booking System</title>
    <style>
        /* General body styling */
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #141E30, #243B55);
            color: #fff;
            margin: 0;
            padding: 0;
            height: 100vh;
            display: flex;
            flex-direction: column;
        }

        /* Navbar styling */
        nav {
            background: rgba(0, 0, 0, 0.3);
            backdrop-filter: blur(5px);
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 12px 40px;
            box-shadow: 0 2px 8px rgba(0,0,0,0.3);
        }

        nav .logo {
            font-size: 22px;
            font-weight: 600;
            letter-spacing: 1px;
            color: #00BFFF;
            text-shadow: 0 0 10px #00BFFF;
        }

        nav ul {
            list-style: none;
            display: flex;
            margin: 0;
            padding: 0;
        }

        nav ul li {
            margin-left: 25px;
        }

        nav ul li a {
            text-decoration: none;
            color: #00BFFF;
            font-size: 16px;
            padding: 8px 16px;
            border: 2px solid #00BFFF;
            border-radius: 25px;
            transition: all 0.3s ease;
        }

        nav ul li a:hover {
            background-color: #00BFFF;
            color: #fff;
            box-shadow: 0 0 10px #00BFFF;
        }

        /* Center content */
        .content {
            flex: 1;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            text-align: center;
        }

        h1 {
            font-size: 38px;
            letter-spacing: 1px;
            margin-bottom: 30px;
            text-shadow: 2px 2px 6px rgba(0,0,0,0.6);
        }

        /* Responsive navbar */
        @media (max-width: 600px) {
            nav {
                flex-direction: column;
                padding: 15px 20px;
            }
            nav ul {
                flex-direction: column;
                margin-top: 10px;
            }
            nav ul li {
                margin: 10px 0;
            }
        }
    </style>
</head>
<body>

    <!-- Navbar -->
    <nav>
        <div class="logo">🎬 Movie Booking</div>
        <ul>
            <li><a href="index.jsp">Home</a></li>
            <li><a href="movies.jsp">Movies</a></li>
            <li><a href="login.jsp">Login</a></li>
            <li><a href="register.jsp">Register</a></li>
        </ul>
    </nav>

    <!-- Welcome content -->
    <div class="content">
        <h1>Welcome to Online Movie Ticket Booking System</h1>
        <p style="font-size:18px;color:#bbdefb;">Book your favorite movies anytime, anywhere 🎟️</p>
    </div>

</body>
</html>
