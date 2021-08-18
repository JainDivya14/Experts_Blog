<%-- 
    Document   : student_pass_change_process
    Created on : May 15, 2020, 9:26:34 AM
    Author     : Lenovo
--%>

<%@page import="java.sql.*,java.io.*" contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<HTML>
<HEAD>
<link rel="stylesheet" type="text/css" href="Background/style.css">
<TITLE>Change Password</TITLE>
<script src="Scripts/validate.js"></script>
<link rel = "icon" href ="Background/eb_logo_2.png" type = "image/icon">
</HEAD>
<BODY style="background:#bdffc4;">
    <%
        if(session.getAttribute("type")!="student")
            response.sendRedirect("logout.jsp");
    %>
    
<%
String opass=request.getParameter("oldpass");
String npass=request.getParameter("newpass1");
int x=0;
try{
            PreparedStatement pst;
            Class.forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/eb","root","");
            pst=con.prepareStatement("update student set password=? where id=? and password=?");
            pst.setString(1,npass);
            pst.setString(2,session.getAttribute("id").toString());
            pst.setString(3,opass);
            x=pst.executeUpdate();
            if(x!=0){
                %>
                <script>
                alert("Password Changed Successfully!");
                window.location="stu_profile.jsp";
                </script>
                <%
            }
            else{
                %>
                <script>
                alert("Invalid Old Password!");
                window.location="stu_profile.jsp";
                </script>
                <%
            }

}
catch(Exception e){
out.println(e);
}
%>
</BODY>
</HTML>