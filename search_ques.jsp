<%-- 
    Document   : search_ques
    Created on : May 18, 2020, 11:30:10 AM
    Author     : Lenovo
--%>

<%@page import="java.sql.*,java.io.*" contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<HTML>
<HEAD>
<link rel="stylesheet" type="text/css" href="Background/style.css">
<link rel = "icon" href ="Background/eb_logo_2.png" type = "image/icon">
<script src="Scripts/validate.js"></script>
<TITLE>Experts' Blog - Search</TITLE>
<link rel = "icon" href ="ask.png" type = "image/icon">
</HEAD>
<BODY style="background:#bdffc4;">
        <h1><a href="index.jsp"><img src="Background/eb_logo_header.png" height="25%" width="25%"></a> <a href="logout.jsp"><button type="button" class="bt" data-toggle="modal" data-target="">Logout</button></a></h1>

    <%
        if(session.getAttribute("type")!="student")
            response.sendRedirect("logout.jsp");
    %>
    <br>
    <div align="center">
              <form name ="f2" style="background: white" method="post" id="f2" action="searched_ques.jsp" onsubmit="return ValidateSearchQuestion()">
        <table style="width:100%;text-align: center;" align="center">
            <h2 align="center" style="background: lightgreen;font-size: 40px;padding: 10px;margin-top: 0px;">Search</h2>

            
            <tr><td><label>Enter Question<br></label>
                    <div class="input-group"><input type="text" name="sid" is="sid" placeholder="Enter Question"></div></td>
                    </tr>
           
            </table>
            <table align="center">
                    <tr>
                    <td><input class="bt" type="submit" value="Search" id="sub"></td>
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