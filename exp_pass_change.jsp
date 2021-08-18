<%-- 
    Document   : exp_pass_change
    Created on : May 16, 2020, 6:32:29 PM
    Author     : Lenovo
--%>

<%@page import="java.sql.*,java.io.*" contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<HTML>
<HEAD>
<link rel="stylesheet" type="text/css" href="Background/style.css">
<TITLE>Experts' Blog - Change Password</TITLE>
<script src="Scripts/validate.js"></script>
<link rel = "icon" href ="Background/eb_logo_2.png" type = "image/icon">
</HEAD>
<BODY style="background:#bdffc4;">
    <%
        if(session.getAttribute("type")!="expert")
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
        
<div align="center" style="margin-top: 20px;">
    <form name ="f4" style="background: white" method="post" id="f4" action="exp_pass_change_process.jsp" onsubmit="return VerifyUpdatePass()">
        <table style="width:100%;text-align: center;" align="center">
            <h2 align="center" style="background: lightgreen;font-size: 40px;padding: 10px;margin-top: 0px;">Update Password</h2>
            
            
                    <tr><td><label>Old Password<br></label>
                            <div class="input-group"><input type="password" name="oldpass" id="oldpass" placeholder="Old Password"></div></td>
                    </tr>
            
                    <tr>
                    <td><label>New Password<br></label>
                        <div class="input-group"><input type="password" name="newpass1" id="newpass1" placeholder="New Password"></div></td>
                    </tr>
                    
                    
                    <tr>
                    <td><label>Confirm New Password<br></label>
                        <div class="input-group"><input type="password" name="newpass2" id="newpass2" placeholder="Confirm New Password"></div></td>
                    </tr>
                    
    
                    
        </table>
                    <table align="center">
                    <tr>
                    <td><input class="bt" type="submit" value="Update" id="sub"></td>
                    <td></td>
                    <td><input class="bt" style="background:indianred;" type="reset"></td>
                    </tr>
            </table>
                    
        </form>
</div>        
   <H2 class="footer">
    <table align="center">
        <tr>
            <td width="350px">
                <a href="expert_index.jsp" title="Questions for you">
                    <img src="Background/Icons/ask.png" height="40px" width="40px">
                </a>
            </td>
            <td width="350px">
                <a href="exp_ques_list.jsp" title="All Questions">
                    <img src="Background/Icons/question_answer.png" height="40px" width="50px">
                </a>
            </td>
            <td width="350px">
                <a href="saved_ques_exp.jsp" title="Saved Questions">
                    <img src="Background/Icons/star.png" height="40px" width="40px">  
                </a>
            </td>
            <td width="350px">
                <a href="exp_ans_list.jsp" title="Your Answers">
                    <img src="Background/Icons/notepad.png" height="40px" width="40px">
					
                </a>
            </td>
            <td width="350px">
                <a href="exp_profile.jsp" title="Profile">
                    <img src="Background/Icons/profile.png" height="40px" width="40px">
                </a>
            </td>
        </tr>
    </table>
</H2>           
</BODY>
</HTML>