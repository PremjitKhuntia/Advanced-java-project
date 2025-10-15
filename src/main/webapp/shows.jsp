<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html><body>
<h2>Shows</h2>
<table>
  <tr><th>Date</th><th>Time</th><th>Hall</th><th>Action</th></tr>
  <c:forEach var="s" items="${shows}">
    <tr>
      <td>${s.showDate}</td>
      <td>${s.showTime}</td>
      <td>${s.hallNo}</td>
      <td><a href="seats?showId=${s.showId}">Select Seats</a></td>
    </tr>
  </c:forEach>
</table>
</body></html>