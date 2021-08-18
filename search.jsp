<%-- 
    Document   : search
    Created on : May 15, 2020, 8:42:34 PM
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
        if(session.getAttribute("type")!="admin")
            response.sendRedirect("logout.jsp");
    %>
    <br>
    <div align="center">
              <form name ="f2" style="background: white" method="post" id="f2" action="searched.jsp" onsubmit="return ValidateSearch()">
        <table style="width:100%;text-align: center;" align="center">
            <h2 align="center" style="background: lightgreen;font-size: 40px;padding: 10px;margin-top: 0px;">Search</h2>

            
            <tr><td><label>Enter ID<br></label>
                    <div class="input-group"><input type="text" name="sid" is="sid" placeholder="Enter ID"></div></td>
                    </tr>
           
                    
                    <tr>
                        <td><label>Search Type<br></label>
                        <div class="input-group"><select name="stype" id="stype" class="select">
                            <option value="1">Student</option>
                            <option value="2">Expert</option>
                            <option value="3">Question</option>
                            </select></div></td>                   
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
</BODY>
<%
       int notif=0;
       try{
           Class.forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/eb","root","");
            Statement st=con.createStatement();
           String q="select count(*) from feedback where status=0";
           ResultSet rs=st.executeQuery(q);
            while(rs.next()){
                notif=Integer.parseInt(rs.getString(1));
            }
       }
       catch(Exception e){
           out.println(e);
       }
       
    %>
    
   
    
    <H2 class="footer">
    <table align="center">
        <tr>
            <td width="350px">
                <a href="feedback_viewer.jsp" title="Feedback Viewer">
                    <img src="Background/Icons/feedback.png" height="40px" width="40px">
                </a>
            </td>
            <td width="350px">
                <a href="addexpert.jsp" title="Add Expert">
                    <img src="Background/Icons/addexpert.png" height="40px" width="40px">  
                </a>
            </td>
            <td width="350px">
                <a href="search.jsp" title="Search">
                    <img src="Background/Icons/search.png" height="40px" width="40px">
                </a>
            </td>
			<td width="350px">
                <a href="notification.jsp" title="Notification">
                    <img src="Background/Icons/notification.png" height="40px" width="40px">
					<span class="badge"><% out.println((notif==0) ? "" : notif); %></span>
                </a>
            </td>
            <td width="350px">
                <a href="admin_profile.jsp" title="Profile">
                    <img src="Background/Icons/profile.png" height="40px" width="40px">
                </a>
            </td>
        </tr>
    </table>
</H2>

</HTML>