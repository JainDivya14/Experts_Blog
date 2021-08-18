<%-- 
    Document   : recovery
    Created on : May 16, 2020, 4:57:22 PM
    Author     : Lenovo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Account Recovery</title>
    <link rel="stylesheet" type="text/css" href="Background/style.css">
    <link rel = "icon" href ="Background/eb_logo_2.png" type = "image/icon">

    <script src="Scripts/validate.js"></script>
    <script src="Scripts/AJAX.js"></script>   
    
</head>
<body style="background:#bdffc4;">

<h1><a href="index.jsp"><img src="Background/eb_logo_header.png" height="25%" width="25%"></a> <a href="index.jsp"><button type="button" class="bt" data-toggle="modal" data-target="#myModal">Back to Login</button></a></h1>
<h1 style="margin-top: 0px;margin-bottom: 10px;background: lightgreen;color: black; padding: 10px;font-size: 30px;font-weight: bold;">
      <div align="right">
      <table class="subheader"><tr>
      <td><a href="about.jsp">About Us</a></td>
      <td><a href="feedback.jsp">Feedback</a></td>
      </tr></table>
      </div>
</h1>
<br><br>
<div align="center">
    <form name="f5" id="f5" style="width: 500px;background: white;" action="recovery_process.jsp" method="POST" onsubmit="return ValidateRecovery()">
        <table>
            <tr><td><label>Email Id</label><br><div class="input-group"><input type="email" id="email" name="email" placeholder="Enter Email Id"></div></td>
        </tr>
        <tr>
                <div class="input-group-radio">
                    <td><input type="radio" name="issue" id="id" value="id" placeholder="email">I forgot my User ID<br></td>
                </tr>
                <tr>
                <td><input type="radio" name="issue" id="password" value="password">I forgot my password</td><br>
                </div>
        </tr>
        <tr>
        <td><button class="bt" onclick="submit">Continue</button><td>
        </td>
        </table>
    </form>
</div>
</body>
</html>