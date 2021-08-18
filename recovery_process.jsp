<%-- 
    Document   : recovery_process
    Created on : May 16, 2020, 5:30:12 PM
    Author     : Lenovo
--%>

<%@page import="java.sql.*,java.io.*" contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Account Recovery</title>
    <link rel="stylesheet" type="text/css" href="Background/style.css">
    <link rel = "icon" href ="Background/eb_logo_2.png" type = "image/icon">

    <script src="Scripts/validate.js"></script>
    <script src="Scripts/AJAX.js"></script>   
    
</head>
<body style="background:#bdffc4;">

<h1><a href="index.jsp"><img src="Background/eb_logo_header.png" height="25%" width="25%"></a> <a href="index.jsp"><button type="button" class="bt" data-toggle="modal" data-target="#myModal">Back to Login</button></a></h1>
<h1 style="margin-top: 0px;margin-bottom: 10px;background: lightgreen;color: black; padding: 10px;font-size: 30px;font-weight: bold;">
      <div align="right">
      <table class="subheader"><tr>
      <td><a href="about.jsp">About Us</a></td>
      <td><a href="feedback.jsp">Feedback</a></td>
      </tr></table>
      </div>
</h1>
<br><br><br><br>
<div align="center">
    <form style=" width: 800px;background: white;">
<%
    int x=0;
    String store="";
    String email=request.getParameter("email");
    String issue=request.getParameter("issue");
    try{
        Class.forName("com.mysql.jdbc.Driver");
        Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/eb","root","");
        if(issue.equals("id")){
        PreparedStatement pst=conn.prepareStatement("select id from student where email=?");
        pst.setString(1,email);
        ResultSet rs=pst.executeQuery();
        while(rs.next()){
            store=rs.getString(1);
        x++;
        }
        if(x>0){
            %><h5 style="font-size: 40px;color:green;">Your Id is <% out.println(store); %></h5><%
        }
        else{
            %><h5 style="font-size: 40px;color:green;"><% out.println("No Account Found!"); %></h5><%
        }
                }
        else{
            PreparedStatement pst=conn.prepareStatement("update student set password=id where email=?");
            pst.setString(1, email);
            x=pst.executeUpdate();
            x=0;
            pst=conn.prepareStatement("select password from student where email=?");
            pst.setString(1,email);
            ResultSet rs=pst.executeQuery();
            while(rs.next()){
            store=rs.getString(1);
            x++;
            }
            if(x>0){
            %><h5 style="font-size: 40px;color:green;">Your New Password is <% out.println(store); %></h5><%
            }
            else{
            %><h5 style="font-size: 40px;color:green;"><% out.println("No Account Found!"); %></h5><%
            }
        }
    }
    catch(Exception e){
        out.println(e);
    }

%>
        
    </form>
</div>
</body>
</html>