<%-- 
    Document   : sample
    Created on : May 14, 2020, 12:44:11 PM
    Author     : Lenovo
--%>

<%@page import="java.sql.*,java.io.*" contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="Background/style.css">
        <link rel = "icon" href ="Background/eb_logo_2.png" type = "image/icon">
        <title>About Us</title>
    </head>
    <body style="background:#bdffc4;">
        <h1><a href="index.jsp"><img src="Background/eb_logo_header.png" height="25%" width="25%"></a> <a href="index.jsp"><button type="button" class="bt" data-toggle="modal" data-target="#myModal">Back to Homepage</button></a></h1>
            <h1 style="margin-top: 0px;margin-bottom: 10px;background: lightgreen;color: black; padding: 10px;font-size: 30px; font-weight:bold;">
      <div align="right">
      <table class="subheader"><tr>
      <td><a href="about.jsp">About Us</a></td>
      <td><a href="feedback.jsp">Feedback</a></td>
      </tr></table>
          <%
          String qname="CSS";
        int c=0;
        try{
                                Class.forName("com.mysql.jdbc.Driver");
                                Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/eb","root","");
                                PreparedStatement ps;
                                ps=con.prepareStatement("select * from ques_ans where qname LIKE '%' ? '%'");
                                ps.setString(1, qname);
                                ResultSet rs=ps.executeQuery();
                                while(rs.next()){
                                    qname=rs.getString(2);
                                    out.println(qname);
                                    c++;
                                }
                                if(c==0){
                                    out.println("No question found!");
                                }
        }
        catch(Exception e){
            out.println(e);
        }
          %>
      </div>
    </body>
</html>
