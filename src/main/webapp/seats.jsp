<%@ page import="java.sql.*,com.example.util.DBConnection" %>
<%
    // Get movieId from request
    String movieId = request.getParameter("movieId");
    session.setAttribute("movieId", movieId); // save in session for servlet
%>
<!DOCTYPE html>
<html>
<head>
    <title>Select Seats</title>
    <link rel="stylesheet" type="text/css" href="css/style.css">
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            margin: 0;
            padding: 20px;
            min-height: 100vh;
        }

        .container {
            max-width: 800px;
            margin: 0 auto;
            background: white;
            border-radius: 15px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.2);
            padding: 30px;
        }

        h2 {
            text-align: center;
            color: #333;
            margin-bottom: 30px;
            font-size: 28px;
            border-bottom: 2px solid #667eea;
            padding-bottom: 10px;
        }

        .screen {
            text-align: center;
            margin: 20px 0 40px 0;
            padding: 10px;
            background: #333;
            color: white;
            border-radius: 5px;
            font-weight: bold;
            letter-spacing: 2px;
        }

        .seat-section {
            margin-bottom: 30px;
        }

        .row-title {
            font-size: 18px;
            font-weight: bold;
            color: #555;
            margin-bottom: 15px;
            text-align: center;
        }

        .seats-container {
            display: flex;
            justify-content: center;
            gap: 15px;
            flex-wrap: wrap;
            margin-bottom: 20px;
        }

        .seat-checkbox {
            display: none;
        }

        .seat-label {
            display: inline-block;
            width: 50px;
            height: 50px;
            background: #f0f0f0;
            border: 2px solid #ddd;
            border-radius: 8px;
            text-align: center;
            line-height: 46px;
            cursor: pointer;
            font-weight: bold;
            transition: all 0.3s ease;
            margin: 5px;
        }

        .seat-label:hover {
            background: #e0e0e0;
            transform: translateY(-2px);
        }

        .seat-checkbox:checked + .seat-label {
            background: #4CAF50;
            color: white;
            border-color: #45a049;
            transform: scale(1.1);
        }

        .submit-btn {
            display: block;
            width: 200px;
            margin: 40px auto 0;
            padding: 15px;
            background: linear-gradient(135deg, #667eea, #764ba2);
            color: white;
            border: none;
            border-radius: 25px;
            font-size: 18px;
            font-weight: bold;
            cursor: pointer;
            transition: all 0.3s ease;
            text-align: center;
        }

        .submit-btn:hover {
            transform: translateY(-3px);
            box-shadow: 0 5px 15px rgba(0,0,0,0.2);
            background: linear-gradient(135deg, #764ba2, #667eea);
        }

        .legend {
            display: flex;
            justify-content: center;
            gap: 20px;
            margin-top: 20px;
        }

        .legend-item {
            display: flex;
            align-items: center;
            gap: 5px;
            font-size: 14px;
        }

        .legend-available {
            width: 20px;
            height: 20px;
            background: #f0f0f0;
            border: 2px solid #ddd;
            border-radius: 4px;
        }

        .legend-selected {
            width: 20px;
            height: 20px;
            background: #4CAF50;
            border: 2px solid #45a049;
            border-radius: 4px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Select Seats for Movie ID: <%= movieId %></h2>
        
        <div class="screen">SCREEN</div>

        <form action="BookTicketServlet" method="post">
            <input type="hidden" name="movieId" value="<%= movieId %>">

            <div class="seat-section">
                <div class="row-title">Row A - Premium</div>
                <div class="seats-container">
                    <input type="checkbox" name="seat" value="A1" id="A1" class="seat-checkbox">
                    <label for="A1" class="seat-label">A1</label>
                    
                    <input type="checkbox" name="seat" value="A2" id="A2" class="seat-checkbox">
                    <label for="A2" class="seat-label">A2</label>
                    
                    <input type="checkbox" name="seat" value="A3" id="A3" class="seat-checkbox">
                    <label for="A3" class="seat-label">A3</label>
                </div>
            </div>

            <div class="seat-section">
                <div class="row-title">Row B - Premium</div>
                <div class="seats-container">
                    <input type="checkbox" name="seat" value="B1" id="B1" class="seat-checkbox">
                    <label for="B1" class="seat-label">B1</label>
                    
                    <input type="checkbox" name="seat" value="B2" id="B2" class="seat-checkbox">
                    <label for="B2" class="seat-label">B2</label>
                    
                    <input type="checkbox" name="seat" value="B3" id="B3" class="seat-checkbox">
                    <label for="B3" class="seat-label">B3</label>
                </div>
            </div>

            <div class="seat-section">
                <div class="row-title">Row C - Standard</div>
                <div class="seats-container">
                    <input type="checkbox" name="seat" value="C1" id="C1" class="seat-checkbox">
                    <label for="C1" class="seat-label">C1</label>
                    
                    <input type="checkbox" name="seat" value="C2" id="C2" class="seat-checkbox">
                    <label for="C2" class="seat-label">C2</label>
                    
                    <input type="checkbox" name="seat" value="C3" id="C3" class="seat-checkbox">
                    <label for="C3" class="seat-label">C3</label>
                </div>
            </div>

            <div class="seat-section">
                <div class="row-title">Row D - Standard</div>
                <div class="seats-container">
                    <input type="checkbox" name="seat" value="D1" id="D1" class="seat-checkbox">
                    <label for="D1" class="seat-label">D1</label>
                    
                    <input type="checkbox" name="seat" value="D2" id="D2" class="seat-checkbox">
                    <label for="D2" class="seat-label">D2</label>
                    
                    <input type="checkbox" name="seat" value="D3" id="D3" class="seat-checkbox">
                    <label for="D3" class="seat-label">D3</label>
                </div>
            </div>

            <div class="legend">
                <div class="legend-item">
                    <div class="legend-available"></div>
                    <span>Available</span>
                </div>
                <div class="legend-item">
                    <div class="legend-selected"></div>
                    <span>Selected</span>
                </div>
            </div>

            <button type="submit" class="submit-btn">Confirm Booking</button>
        </form>
    </div>
</body>
</html>