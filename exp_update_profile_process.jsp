<%-- 
    Document   : exp_update_profile_process
    Created on : May 16, 2020, 10:22:50 PM
    Author     : Lenovo
--%>

<%@page import="java.sql.*,java.io.*" contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<HTML>
<HEAD>
<link rel="stylesheet" type="text/css" href="Background/style.css">
<link rel = "icon" href ="Background/eb_logo_2.png" type = "image/icon">
<script src="Scripts/validate.js"></script>
<TITLE>Update Profile</TITLE>
<link rel = "icon" href ="ask.png" type = "image/icon">
</HEAD>
<BODY style="background:#bdffc4;">
    <%
        if(session.getAttribute("type")!="expert")
            response.sendRedirect("logout.jsp");
    %>
    
    <%
        try{
            PreparedStatement pst;
            Class.forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/eb","root","");
            pst=con.prepareStatement("update expert set username=?,mobile=?,address=?,gender=?,dob=?,field=?,space=?,post=?,institution=? where id=? and password=?");
           
            int x=0;
            String name,phone,institute,dob,address,course,gender,password,post,space;
            name=request.getParameter("username");
            phone=request.getParameter("mobile");
            institute=request.getParameter("institute");
            dob=request.getParameter("dob");
            address=request.getParameter("address");
            course=request.getParameter("course");
            password=request.getParameter("password");
            gender=request.getParameter("gender");
            space=request.getParameter("space");
            post=request.getParameter("post");
            pst.setString(1,name);
            pst.setString(2,phone);
            pst.setString(3,address);
            pst.setString(4,gender);
            pst.setString(5,dob);
            pst.setString(6,course);
            pst.setString(7,space);
            pst.setString(8,post);
            pst.setString(9,institute);
            pst.setString(10,session.getAttribute("id").toString());
            pst.setString(11,password);
            x=pst.executeUpdate();
            if(x>0){
                %>
                <script>
                    alert("Profile has been updated!");
                    window.location="exp_profile.jsp";
                </script>
                <%
            }
            else{
                %>
                <script>
                    alert("Incorrect Password!");
                    window.location="exp_update_profile.jsp";
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
