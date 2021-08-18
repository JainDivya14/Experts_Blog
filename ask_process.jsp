<%-- 
    Document   : ask_process
    Created on : May 15, 2020, 11:51:18 AM
    Author     : Lenovo
--%>

<%@page import="java.sql.*,java.io.*" contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<HTML>
<HEAD>
<link rel="stylesheet" type="text/css" href="Background/style.css">
<TITLE>Ask Question</TITLE>
<link rel = "icon" href ="Background/eb_logo_2.png" type = "image/icon">
<script src="Scripts/validate.js"></script>
</HEAD>
<BODY style="background:#bdffc4;">
    <%
        if(session.getAttribute("type")!="student")
            response.sendRedirect("logout.jsp");
    %>
<%
String q=request.getParameter("question");
String space=request.getParameter("space");
int x=0;
try{
    Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/eb","root","");
            PreparedStatement ps=conn.prepareStatement("insert into ques_ans (qname,space,askedby) value(?,?,?)");
            ps.setString(1, q);
            ps.setString(2, space);
            ps.setString(3,session.getAttribute("id").toString());
            x=ps.executeUpdate();
            if(x!=0){
                %>
                <script>
                    alert("Question has been asked successfully!");
                    window.location="index.jsp";
                </script>
                <%
            }
            else{
                %>
                <script>
                    alert("Failed to ask question!");
                    window.location="ask.jsp";
                 </script>>
                <%
            
            }
}
catch(Exception e){
out.println(e);
}
%>
</BODY>
</HTML>