<%-- 
    Document   : ask
    Created on : May 15, 2020, 9:13:35 AM
    Author     : Lenovo
--%>

<%@page import="java.sql.*,java.io.*" contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<HTML>
<HEAD>
<link rel="stylesheet" type="text/css" href="Background/style.css">
<TITLE>Experts' Blog - Ask Question</TITLE>
<link rel = "icon" href ="Background/eb_logo_2.png" type = "image/icon">
<script src="Scripts/validate.js"></script>
</HEAD>
<BODY style="background:#bdffc4;">
    <%
        if(session.getAttribute("type")!="student")
            response.sendRedirect("logout.jsp");
    %>
      <h1><a href="index.jsp"><img src="Background/eb_logo_header.png" height="25%" width="25%"></a> <a href="logout.jsp"><button type="button" class="bt" data-toggle="modal" data-target="">Logout</button></a></h1>
      <h1 style="margin-top: 0px;margin-bottom: 10px;background: lightgreen;color: black; padding: 10px;font-size: 30px;font-weight: bold;">

      <div align="right">
      <table class="subheader"><tr>
      <td><a href="about.jsp">About Us</a></td>
      <td><a href="feedback.jsp">Feedback</a></td>
      </tr></table>
      </div>
      </h1>
      <div align="center">
              <form name ="f2" style="background: white" method="post" id="f2" action="ask_process.jsp" onsubmit="return ValidateQuestion()">
        <table style="width:100%;text-align: center;" align="center">
            <h2 align="center" style="background: lightgreen;font-size: 40px;padding: 10px;margin-top: 0px;">Ask Question</h2>
            <p style="color:green;text-align: center;">Hint : For getting answers faster & accurate, make sure that question is to the point & not being asked previously & relevant space is selected.</p>

            
            <tr><td><label>Question<br></label>
                    <div class="input-group-box"><textarea name="question" id="question" placeholder="Type Your Question Here"></textarea></div></td>
                    </tr>
           
                    
                    <tr>
                        <td><label>Space<br></label>
                        <div class="input-group"><select name="space" id="space" class="select">
                            <option value="1">Computer Engineering or Information Technology</option>
                            <option value="2">Mechanical Engineering</option>
                            <option value="3">Electrical Engineering</option>
                            <option value="4">Electronics & Communication Engineering</option>
                            </select></div></td>                   
                    </tr>
            
            
                   
            </table>
            <table align="center">
                    <tr>
                    <td><input class="bt" type="submit" value="Ask" id="sub"></td>
                    <td></td>
                    <td><input class="bt" style="background:indianred;" type="reset"></td>
                    </tr>
            </table>
                    
        </form>
      </div>
      <br><br><br><br>
</BODY>
<H2 class="footer">
    <table align="center">
        <tr>
            <td width="350px">
                <a href="ask.jsp" title="Ask a Question">
                    <img src="Background/Icons/ask.png" height="40px" width="40px">
                </a>
            </td>
            <td width="350px">
                <a href="askbyme.jsp" title="Asked Questions">
                    <img src="Background/Icons/iask.png" height="40px" width="40px">
                </a>
            </td>
            <td width="350px">
                <a href="saved_ques.jsp" title="Bookmarks">
                    <img src="Background/Icons/star.png" height="40px" width="40px">  
                </a>
            </td>
			<td width="350px">
                <a href="search_ques.jsp" title="Search">
                    <img src="Background/Icons/search.png" height="40px" width="40px">
					
                </a>
            </td>
            <td width="350px">
                <a href="stu_profile.jsp" title="Profile">
                    <img src="Background/Icons/profile.png" height="40px" width="40px">
                </a>
            </td>
        </tr>
    </table>
</H2>
    
</HTML>
