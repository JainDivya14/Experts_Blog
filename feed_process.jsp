<%-- 
    Document   : feed_process
    Created on : May 12, 2020, 4:34:06 PM
    Author     : Lenovo
--%>

<%@page import="java.sql.*,java.io.*" contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Feedback Processing</title>
    </head>
    <body>
        <%
            int x=0;
            String rating,rating_type,comment,name,email;
            rating=request.getParameter("exp");
            rating_type=request.getParameter("feedtype");
            comment=request.getParameter("comment");
            name=request.getParameter("name");
            email=request.getParameter("email");
            try{
            PreparedStatement pst;
            Class.forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/eb","root","");
            pst=con.prepareStatement("insert into feedback (experience,type,comment,name,email) values (?,?,?,?,?)");
            pst.setString(1,rating);
            pst.setString(2,rating_type);
            pst.setString(3,comment);
            pst.setString(4,name);
            pst.setString(5,email);
            x=pst.executeUpdate();
            if(x!=0){
                %>
                 <script>
                 alert("Feedback Sent!");
                 window.location= "feedback.jsp";
                 </script>
                <% 
            }
            else{
                %>
                 <script>
                 alert("Failed to send feedback!");
                 window.location= "feedback.jsp";
                 </script>
                <%
            }
            }
            catch(Exception ee){
                out.println(ee);
            }
        %>
    </body>
</html>
