<%@ page import="java.util.Calendar, java.util.GregorianCalendar" %>
<%
    GregorianCalendar currentDate = new GregorianCalendar();
    int currentYear = currentDate.get(Calendar.YEAR);
%>
<div class="footer" style="
    text-align: center;
    padding: 15px 0;
    background: #f5f5f5;
    border-top: 1px solid #ddd;
    position: relative;
    bottom: 0;
    width: 100%;
    margin-top: 30px;">
    <p>&copy; Copyright <%= currentYear %> Mike Murach &amp; Associates</p>
</div>
</body>
</html>