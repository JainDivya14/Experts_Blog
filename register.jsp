<%-- 
    Document   : register
    Created on : May 6, 2020, 5:17:06 PM
    Author     : Akash
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Experts' Blog - Registration</title>
    <link rel="stylesheet" type="text/css" href="Background/style.css">
    <link rel = "icon" href ="Background/eb_logo_2.png" type = "image/icon">

    <script src="Scripts/validate.js"></script>
    <script src="Scripts/AJAX.js"></script>   
    
</head>
<body style="background:#bdffc4;">

<h1><a href="index.jsp"><img src="Background/eb_logo_header.png" height="25%" width="25%"></a> <a href="index.jsp"><button type="button" class="bt" data-toggle="modal" data-target="#myModal">Back to Login</button></a></h1>
<h1 style="margin-top: 0px;margin-bottom: 0px;background: lightgreen;color: black; padding: 10px;font-size: 30px;font-weight: bold;">
      <div align="right">
      <table class="subheader"><tr>
      <td><a href="about.jsp">About Us</a></td>
      <td><a href="feedback.jsp">Feedback</a></td>
      </tr></table>
      </div>
</h1>
<h4 class="list_header" style="background:lightgray;text-align: center;font-size:30px;">Registration</h4> 

<div style="text-align: center;">
    <form name ="f2" style="border:0px;" method="post" id="f2" action="reg_student.jsp" onsubmit="return ValidateRegister()">
        <table style="width:100%" align="center">
        <tr>
                
                <td width="33%"><label>Name</label><br>
                <div class="input-group"><input type="text" name="username" id="username"  placeholder="Enter Name"></div></td>
                
                
                
                <td width="33%"><label>Phone No. </label><br>
                    <div class="input-group"><input type="tel" name="mobile" id="mobile" placeholder="Phone No. " ></div></td>
                
                <td rowspan="2"><label> Institution</label><br>
                    <div class="input-group-box"><textarea name="institute" id="institute"  placeholder="Enter Institution"></textarea></div></td>
		
                
            </tr>
            
            <tr>
                <td><label> E-mail </label><br>
                <div class="input-group"><input type="email" name="email" id="email" onkeyup="sendInfo()" placeholder="Enter E-mail"><br>
                    <span id="a" style="color:red;"></span></div></td>   
             
                <td rowspan="2"><label> Address </label><br>
                    <div class="input-group-box"><textarea name="address" id="address"  placeholder="Enter Address"></textarea></div></td>
           
		
                
            </tr>
            
            
            <tr>
               
                 
                <td><label> Date of Birth </label><br>
                <div class="input-group"><input type="date" name="dob" id="dob" value="2000-01-01"></div></td>
                    
                
                <td><label> Course </label><br>
                <div class="input-group"><input type="text" name="course" id="course"  placeholder="Enter Course"></div></td>
                
                 
               
            </tr>
            
            
            <tr>
                
                 
                 <td><label> Gender</label><br><br>
                <div class="input-group-radio">
                <input type="radio" name="gender" id="male" value="Male">Male
                <input type="radio" name="gender" id="female" value="Female">Female</div></td>
               
                <td><label> Password </label><br>
                <div class="input-group"><input type="password" name="password" id="password"  placeholder="Enter Password"></div></td>
                         
                 <td><label> Confirm Password </label><br>
                <div class="input-group"><input type="password" name="password2" id="password2"  placeholder="Confirm Password"></div></td>
                
      
            </tr>
           
           <tr>
           </tr>
            </table>
            <br><br>
            <table align="center">
             <tr>
                 <td><input class="bt" type="submit" value="Register" id="sub"></td>
                 <td></td>
                 <td><input class="bt" style="background:indianred;" type="reset"></td>
            </tr>
            </table> 
          </form>	
          </div>
</body>
</html>