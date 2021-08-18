<%-- 
    Document   : update_profile_process
    Created on : May 15, 2020, 10:25:04 AM
    Author     : Lenovo
--%>


<%@page import="java.sql.*,java.io.*" contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Update Profile</title>
    <link rel="stylesheet" type="text/css" href="Background/style.css">
    <link rel = "icon" href ="Background/eb_logo_2.png" type = "image/icon">

    <script src="Scripts/validate.js"></script>
    <script src="Scripts/AJAX.js"></script>   
    
</head>
<body style="background:#bdffc4;">
    
    
      <%
        if(session.getAttribute("type")!="student")
            response.sendRedirect("logout.jsp");
    %>
<%
int x=0;
            String name,phone,institute,dob,address,course,gender,password;
            name=request.getParameter("username");
            phone=request.getParameter("mobile");
            institute=request.getParameter("institute");
            dob=request.getParameter("dob");
            address=request.getParameter("address");
            course=request.getParameter("course");
            password=request.getParameter("password");
            gender=request.getParameter("gender");

try{
            PreparedStatement pst;
            Class.forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/eb","root","");
            pst=con.prepareStatement("update student set username=?,mobile=?,institution=?,dob=?,address=?,course=?,gender=? where id=? and password=?");
            pst.setString(1,name);
            pst.setString(2,phone);
            pst.setString(3,institute);
            pst.setString(4,dob);
            pst.setString(5,address);
            pst.setString(6,course);
            pst.setString(7,gender);
            pst.setString(8,session.getAttribute("id").toString());
            pst.setString(9,password);
            x=pst.executeUpdate();
            if(x!=0){
                %>
                <script>
                alert("Profile Updated Successfully!");
                window.location="stu_profile.jsp";
                </script>
                <%
            }
            else{
                %>
                <script>
                alert("Invalid Password!");
                window.location="update_profile.jsp";
                </script>
                <%
            }

}
catch(Exception e){
out.println(e);
}
    
%>        
</body>
</html>