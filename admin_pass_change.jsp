<%-- 
    Document   : admin_pass_change
    Created on : May 15, 2020, 8:56:54 AM
    Author     : Lenovo
--%>

<%@page import="java.sql.*,java.io.*" contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<HTML>
<HEAD>
<link rel="stylesheet" type="text/css" href="Background/style.css">
<link rel = "icon" href ="Background/eb_logo_2.png" type = "image/icon">
<script src="Scripts/validate.js"></script>
<TITLE>Changing Password</TITLE>
<link rel = "icon" href ="ask.png" type = "image/icon">
</HEAD>
<BODY style="background:#bdffc4;">
    <%
        if(session.getAttribute("type")!="admin")
            response.sendRedirect("logout.jsp");
    %>
    
    <h1><a href="index.jsp"><img src="Background/eb_logo_header.png" height="25%" width="25%"></a> <a href="logout.jsp"><button type="button" class="bt" data-toggle="modal" data-target="">Logout</button></a></h1>
</BODY>

<%
String opass=request.getParameter("oldpass");
String npass=request.getParameter("newpass1");
int x=0;
try{
            PreparedStatement pst;
            Class.forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/eb","root","");
            pst=con.prepareStatement("update admin set password=? where id=? and password=?");
            pst.setString(1,npass);
            pst.setString(2,session.getAttribute("id").toString());
            pst.setString(3,opass);
            x=pst.executeUpdate();
            if(x!=0){
                %>
                <script>
                alert("Password Changed Successfully!");
                window.location="admin_profile.jsp";
                </script>
                <%
            }
            else{
                %>
                <script>
                alert("Invalid Old Password!");
                window.location="admin_profile.jsp";
                </script>
                <%
            }

}
catch(Exception e){
out.println(e);
}
%>

</HTML>