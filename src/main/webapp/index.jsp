<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fn" uri="jakarta.tags.functions" %>
<c:import url="include/header.html" />
<html>
<head>
    <title>Survey</title>
    <style>
        body { font-family: Arial, sans-serif; background: #fdfdfd; margin: 0; padding: 0; color: #333; }
        .container { width: 600px; margin: 30px auto; padding: 20px 30px; background: #fff;
            border: 1px solid #ddd; border-radius: 8px; box-shadow: 0 4px 8px rgba(0,0,0,0.1);}
        .logo img { width: 100px; display: block; margin-bottom: 15px; }
        h2 { color: #007777; margin-top: 0; }
        h3 { color: #007777; margin-bottom: 5px; }
        label { display: inline-block; width: 120px; font-weight: bold; margin-bottom: 6px; }
        input[type="text"], input[type="email"], input[type="date"], select {
            width: 60%; padding: 6px; margin-bottom: 12px; border: 1px solid #ccc; border-radius: 4px; }
        .btn { background: #007777; color: white; padding: 8px 20px; border: none; border-radius: 4px; cursor: pointer; }
        .btn:hover { background: #005555; }
        input[type="radio"], input[type="checkbox"] { margin-right: 6px; margin-top: 8px; }
        .error { color: red; font-weight: bold; margin-bottom: 10px; }
    </style>

    <script>
        function validateForm() {
            let firstName = document.forms["surveyForm"]["firstName"].value.trim();
            let lastName  = document.forms["surveyForm"]["lastName"].value.trim();
            let email     = document.forms["surveyForm"]["email"].value.trim();
            let dob       = document.forms["surveyForm"]["dob"].value.trim();
            let errorBox  = document.getElementById("errorBox");

            errorBox.innerHTML = ""; // clear lỗi cũ

            if (firstName === "" || lastName === "" || email === "" || dob === "") {
                errorBox.innerHTML = "⚠️ Vui lòng nhập đầy đủ First Name, Last Name, Email và Date of Birth.";
                return false; // chặn submit
            }
            return true; // hợp lệ
        }
    </script>
</head>
<body>
<div class="container">
    <div class="logo">
        <img src="images/murach.png" alt="Logo">
    </div>
    <h2>Survey</h2>
    <p>If you have a moment, we’d appreciate, if you would fill out this survey</p>

    <!-- Hộp hiển thị lỗi -->
    <div id="errorBox" class="error">
        <c:if test="${not empty message}">${message}</c:if>
    </div>

    <form name="surveyForm" action="emailList" method="post" onsubmit="return validateForm();">
        <h3>Your information:</h3>
        <label>First Name:</label>
        <input type="text" name="firstName" value="${user.firstName}"><br>

        <label>Last Name:</label>
        <input type="text" name="lastName" value="${user.lastName}"><br>

        <label>Email:</label>
        <input type="email" name="email" value="${user.email}"><br>

        <label>Date of Birth:</label>
        <input type="date" name="dob" value="${user.dob}"><br>

        <h3>How did you hear about us?</h3>
        <input type="radio" name="hearAbout" value="Search Engine" <c:if test="${user.hearAbout == 'Search Engine'}">checked</c:if>> Search Engine
        <input type="radio" name="hearAbout" value="Word of mouth" <c:if test="${user.hearAbout == 'Word of mouth'}">checked</c:if>> Word of mouth
        <input type="radio" name="hearAbout" value="Social Media" <c:if test="${user.hearAbout == 'Social Media'}">checked</c:if>> Social Media
        <input type="radio" name="hearAbout" value="Other" <c:if test="${user.hearAbout == 'Other'}">checked</c:if>> Other<br>

        <h3>Would you like to receive announcements about new CDs and special offers?</h3>
        <input type="checkbox" name="announcements" value="yesGeneral" 
               <c:if test="${not empty user.announcements and fn:contains(user.announcementsAsString, 'yesGeneral')}">checked</c:if>> 
               YES, I'd like that<br>
        <input type="checkbox" name="announcements" value="yesEmail" 
               <c:if test="${not empty user.announcements and fn:contains(user.announcementsAsString, 'yesEmail')}">checked</c:if>> 
               YES, please send me email announcements<br>

        <h3>Please contact me by:</h3>
        <select name="contactBy">
            <option <c:if test="${user.contactBy == 'Email or postal mail'}">selected</c:if>>Email or postal mail</option>
            <option <c:if test="${user.contactBy == 'Email only'}">selected</c:if>>Email only</option>
            <option <c:if test="${user.contactBy == 'Postal mail only'}">selected</c:if>>Postal mail only</option>
        </select><br><br>

        <input type="submit" value="Submit" class="btn">
    </form>
</div>
<c:import url="include/footer.jsp" />
</body>
</html>
