<%-- 
    Document   : save_ques
    Created on : May 16, 2020, 7:56:03 AM
    Author     : Lenovo
--%>

<%@page import="java.sql.*,java.io.*" contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<HTML>
<HEAD>
<link rel="stylesheet" type="text/css" href="Background/style.css">
<TITLE>Answer</TITLE>
<link rel = "icon" href ="ask.png" type = "image/icon">
</HEAD>
<BODY style="background:#bdffc4;">
    <%
        if(session.getAttribute("type")!="student")
            response.sendRedirect("logout.jsp");
    %>
        <h1><a href="index.jsp"><img src="Background/eb_logo_header.png" height="25%" width="25%"></a> <a href="logout.jsp"><button type="button" class="bt" data-toggle="modal" data-target="">Logout</button></a></h1>
    <h1 style="margin-top: 0px;margin-bottom: 10px;background: lightgreen;color: black; padding: 10px;font-size: 30px;font-weight: bold;">

        <div align="right">
      <table class="subheader"><tr>
      <td><a href="about.jsp">About Us</a></td>
      <td><a href="feedback.jsp">Feedback</a></td>
      </tr></table>
      </div>
</h1>
    <body>
        <%
            int x=0;
            String save=request.getParameter("save");
            String qid=request.getParameter("qid");
            out.println(save);
            if(save.equals("1")){
            try{
                PreparedStatement pst;
                Class.forName("com.mysql.jdbc.Driver");
                Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/eb","root","");
                pst=con.prepareStatement("DELETE from saved where qid=? and uid=?");
                pst.setString(1,qid);
                pst.setString(2,session.getAttribute("id").toString());
                x=pst.executeUpdate();
                    if(x!=0){
                        %>
                        <script>
                            alert("Removed from saved answers!");
                            window.location="ansview.jsp?qid=<%=qid%>";
                        </script>
                        <%
                }
                else{
                        %>
                        <script>
                            alert("Failed to remove from saved answers!");
                            window.location="ansview.jsp?qid=<%=qid%>";
                        </script>
                        <%
                }
            }
            catch(Exception ee){
            out.println(ee);
            }
            }
            else{
                try{
                PreparedStatement pst;
                Class.forName("com.mysql.jdbc.Driver");
                Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/eb","root","");
                pst=con.prepareStatement("insert into saved (qid,uid) values(?,?)");
                pst.setString(1,qid);
                pst.setString(2,session.getAttribute("id").toString());
                x=pst.executeUpdate();
                    if(x!=0){
                        %>
                        <script>
                            alert("Question Saved!");
                            window.location="ansview.jsp?qid=<%=qid%>";
                        </script>
                        <%
                }
                else{
                        %>
                        <script>
                            alert("Failed to save question!");
                            window.location="ansview.jsp?qid=<%=qid%>";
                        </script>
                        <%
                }
            }
            catch(Exception ee){
            out.println(ee);
            }
                
                
            }
        
        %>
    </body>
</html>
