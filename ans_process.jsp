<%-- 
    Document   : ans_process
    Created on : May 16, 2020, 10:20:05 AM
    Author     : Lenovo
--%>

<%@page import="java.sql.*,java.io.*" contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<HTML>
<HEAD>
<link rel="stylesheet" type="text/css" href="Background/style.css">
<script src="Scripts/validate.js"></script>
<TITLE>Expert</TITLE>
<link rel = "icon" href ="ask.png" type = "image/icon">
</HEAD>
<BODY style="background:#bdffc4;">
    <%
        if(session.getAttribute("type")!="expert")
            response.sendRedirect("logout.jsp");
    %>
    <%
    String ansid="";
    String qid=request.getParameter("qid");
    String answer=request.getParameter("answer");
    int x=0;
    try{
        Class.forName("com.mysql.jdbc.Driver");
        Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/eb","root","");
        PreparedStatement pst=con.prepareStatement("insert into ans_table (qid,ans,answeredby) values(?,?,?)");
        pst.setString(1,qid);
        pst.setString(2,answer);
        pst.setString(3,session.getAttribute("id").toString());
        x=pst.executeUpdate();
        if(x==0){
            %>
            <script>
                alert("Failed to answer");
                window.location="replyans.jsp?qid=<%=qid%>";
            </script>
            <%
        }
        else{
            pst=con.prepareStatement("select ansid from ans_table where qid=?");
            pst.setString(1, qid);
            ResultSet rs=pst.executeQuery();
            while(rs.next()){
            ansid=rs.getString(1);
            }
            pst=con.prepareStatement("update ques_ans set ansid=?,status=? where qid=?");
            pst.setString(1, ansid);
            pst.setString(2,"1");
            pst.setString(3,qid);
            x=pst.executeUpdate();
            %>
            <script>
                alert("Answer has been posted!");
                window.location="index.jsp";
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