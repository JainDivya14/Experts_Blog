<%-- 
    Document   : login
    Created on : May 5, 2020, 10:15:11 AM
    Author     : Akash
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
        <TITLE>Experts' Blog</TITLE>
        
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
  
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="Background/style.css">
        <link rel = "icon" href ="Background/eb_logo_2.png" type = "image/icon">

  
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
        <script src="Scripts/validate.js"></script>
        
    
</head>
<body>
    
    <%
        if(session.getAttribute("type")=="student")
            response.sendRedirect("student_index.jsp");
        if(session.getAttribute("type")=="expert")
            response.sendRedirect("expert_index.jsp");
        if(session.getAttribute("type")=="admin")
            response.sendRedirect("admin_index.jsp");
    %>
    
    <h1><a href="index.jsp"><img src="Background/eb_logo_header.png" height="25%" width="25%"></a> <button type="button" class="bt" data-toggle="modal" data-target="#myModal">Login</button></h1>
    <h1 style="margin-top: 0px;margin-bottom: 0px;background: lightgreen;color: black; padding: 10px;font-size: 30px;font-weight: bold;">
      <div align="right">
      <table class="subheader"><tr>
      <td><a href="about.jsp">About Us</a></td>
      <td><a href="feedback.jsp">Feedback</a></td>
      </tr></table>
      </div>
    </h1>
     
 
    <div class="container">
        <div class="modal fade" id="myModal" role="dialog">
        <div class="modal-dialog">
    
        <div class="modal-content">
        <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal">&times;</button>
            <h4><b>Login</b></h4>
        </div>
            
        <div class="modal-body">
        <div align="center">
              <form name="f1"  method="post" action="login.jsp" onsubmit="return ValidateLogin()"> 
                        <div class="input-group"><input type="text" name="username" id="uname" value="" placeholder="UserID"/> </div>
                        <div class="input-group"><input type="password" name="password" id="pass" value="" placeholder="Password"><br/></div>
                        <input type="submit" value="Login" name="login" class="btn"><br/><br/>
                       
                        <a href="register.jsp"><input type="button" value="Register" name="login" class="btn"><br/><br/></a>
                        <a href="recovery.jsp">Trouble in Login?</a>
              </form>
        </div>   
        </div>
        </div>
        </div>
        </div>
    </div>
 
</body>
</html>