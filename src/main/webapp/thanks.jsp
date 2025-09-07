<%@ page contentType="text/html;charset=UTF-8" language="java" %><%--
--%><%@ page import="com.murach.model.User" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<c:import url="include/header.html" />
<html>
<head>
    <title>Thank You</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: #fdfdfd;
            margin: 0;
            padding: 0;
            color: #333;
        }
        .container {
            width: 600px;
            margin: 30px auto;
            padding: 20px 30px;
            background: #fff;
            border: 1px solid #ddd;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
        }
        h2 {
            color: #007777;
            margin-top: 0;
        }
        p {
            margin: 8px 0;
        }
        .highlight {
            font-weight: bold;
            color: #005555;
        }
        .logo img {
            width: 100px;
            display: block;
            margin-bottom: 15px;
        }
    </style>
</head>
<body>
<div class="container">
    <div class="logo">
        <img src="images/murach.png" alt="Logo">
    </div>
    <h2>Thank you for completing the survey!</h2>
    <%
        User user = (User) request.getAttribute("user");
        if (user != null) {
    %>
        <p><span class="highlight">Name:</span> <%= user.getFirstName() %> <%= user.getLastName() %></p>
        <p><span class="highlight">Email:</span> <%= user.getEmail() %></p>
        <p><span class="highlight">Date of Birth:</span> <%= user.getDob() %></p>
        <p><span class="highlight">Heard about us:</span> <%= user.getHearAbout() %></p>
        <p><span class="highlight">Announcements:</span>
            <%
                if (user.getAnnouncements() != null) {
                    for (String ann : user.getAnnouncements()) {
                        out.print(ann + "   ");
                    }
                } else {
                    out.print("None");
                }
            %>
        </p>
        <p><span class="highlight">Preferred contact:</span> <%= user.getContactBy() %></p>
    <%
        } else {
    %>
        <p>No survey data received.</p>
    <%
        }
    %>

<div style="margin-top:20px;">
    <form action="index.jsp" method="get">
        <input type="submit" value="Return to Survey" class="btn">
    </form>
</div>
</div>
<c:import url="include/footer.jsp" />
<!--</body>
</html>-->
