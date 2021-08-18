<%-- 
    Document   : update_profile_admin
    Created on : May 14, 2020, 11:39:50 PM
    Author     : Lenovo
--%>

<%@page import="java.sql.*,java.io.*" contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<HTML>
<HEAD>
<link rel="stylesheet" type="text/css" href="Background/style.css">
<link rel = "icon" href ="Background/eb_logo_2.png" type = "image/icon">
<script src="Scripts/validate.js"></script>
<TITLE>Experts' Blog - Update Profile</TITLE>
<link rel = "icon" href ="ask.png" type = "image/icon">
</HEAD>
<BODY style="background:#bdffc4;">
    <%
        if(session.getAttribute("type")!="admin")
            response.sendRedirect("logout.jsp");
    %>
    
    <h1><a href="index.jsp"><img src="Background/eb_logo_header.png" height="25%" width="25%"></a> <a href="logout.jsp"><button type="button" class="bt" data-toggle="modal" data-target="">Logout</button></a></h1>

    <div align="center" style="margin-top: 20px;">
    <form name ="f4" style="background: white" method="post" id="f4" action="admin_pass_change.jsp" onsubmit="return VerifyUpdatePass()">
        <table style="width:100%;text-align: center;" align="center">
            <h2 align="center" style="background: lightgreen;font-size: 40px;padding: 10px;margin-top: 0px;">Update Profile</h2>
            <p style="color:red;">*Due to security concerns, admin can change only password.</p>
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
    
    
</BODY>
</HTML>