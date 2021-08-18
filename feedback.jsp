<%-- 
    Document   : feedback
    Created on : May 12, 2020, 12:39:16 PM
    Author     : Lenovo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="Background/style.css">
        <script src="Scripts/validate.js"></script>
        <link rel = "icon" href ="Background/eb_logo_2.png" type = "image/icon">
        <title>Experts' Blog - Feedback</title>
    </head>
    <body style="background:#bdffc4;">
<div align="center">
        <h1><a href="index.jsp"><img src="Background/eb_logo_header.png" height="25%" width="25%"></a> <a href="index.jsp"><button type="button" class="bt" data-toggle="modal" data-target="#myModal">Back to Homepage</button></a></h1>
            <h1 style="margin-top: 0px;margin-bottom: 10px;background: lightgreen;color: black; padding: 10px;font-size: 30px; font-weight:bold;">
      <div align="right">
      <table class="subheader"><tr>
      <td><a href="about.jsp">About Us</a></td>
      <td><a href="feedback.jsp">Feedback</a></td>
      </tr></table>
      </div>
    </h1>
        <form name ="f3" style="background: white" method="post" id="f2" action="feed_process.jsp" onsubmit="return ValidateFeedback()">
        <table style="width:100%;text-align: center;" align="center">
            <h2 align="center" style="background: lightgrey;color:green;font-size: 40px;padding: 5px;margin-top: 0px;">RATE & FEEDBACK US!</h2>
            
            
                     <tr>
                    <td><label>How do you rate your overall experience?</label><br><br>
                    <div class="input-group-radio">
                    <input type="radio" name="exp" id="good" value="good">Good
                    <input type="radio" name="exp" id="average" value="average">Average
                    <input type="radio" name="exp" id="bad" value="bad">Bad</div></td>
                    <td><label> Your Name </label><br>
                        <div class="input-group"><input type="text" name="name" id="name" placeholder="Enter Your Name"></div>
                    </td>
                    </tr>
            
                    <tr>
                    
                    <td><label>Feedback Type</label><br><br>
                    <div class="input-group-radio">
                    <input type="radio" name="feedtype" id="rateonly" value="rateonly" checked>Rate Only
                    <input type="radio" name="feedtype" id="suggestion" value="suggestion">Suggestion
                    <input type="radio" name="feedtype" id="query" value="query">Query
                    <input type="radio" name="feedtype" id="report" value="report">Report</div></td>
                    
                    <td><label>E-mail </label><br>
                    <div class="input-group"><input type="email" name="email" id="email" placeholder="Enter E-mail"><br></div></td>
                    
                    
                    
                    </tr>
                    
                    
                    <tr>
                    <td rowspan="2"><label> Comments </label><br>
                        <div class="input-group-box"><textarea name="comment" id="comment"  cols="40" rows="5" value="" placeholder="Your Comment"></textarea></div></td>
                    
                    </tr>
                    
    
                    
        </table>
                    <table align="center">
                    <tr>
                    <td><input class="bt" type="submit" value="Send" id="sub"></td>
                    <td></td>
                    <td><input class="bt" style="background:indianred;" type="reset"></td>
                    </tr>
            </table>
                    
        </form>
</div>
    </body>
</html>
