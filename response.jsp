<%-- 
    Document   : response
    Created on : May 16, 2020, 8:09:14 AM
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
        String state=request.getParameter("state");
        String trigger=request.getParameter("trigger");
        String aid=request.getParameter("aid");
        String qid=request.getParameter("qid");
        int x=0;
        if(state.equals("0")){
        if(trigger.equals("like")){
            try{
                PreparedStatement pst;
                Class.forName("com.mysql.jdbc.Driver");
                Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/eb","root","");
                pst=con.prepareStatement("insert into ans_response (ans_id,response,user_id) values(?,?,?)");
                pst.setString(1,aid);
                pst.setString(2,"like");
                pst.setString(3,session.getAttribute("id").toString());
                x=pst.executeUpdate();
                if(x!=0){
                    %>
                        <script>
                            alert("Upvoted!");
                            window.location="ansview.jsp?qid=<%=qid%>";
                        </script>
                        <%
                
                }
                else{
                    %>
                        <script>
                            alert("Failed to Upvote!");
                            window.location="ansview.jsp?qid=<%=qid%>";
                        </script>
                        <%
                
                }
                
            }
            catch(Exception e){
            out.println(e);
            }
        }
        else{
            try{
                PreparedStatement pst;
                Class.forName("com.mysql.jdbc.Driver");
                Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/eb","root","");
                pst=con.prepareStatement("insert into ans_response (ans_id,response,user_id) values(?,?,?)");
                pst.setString(1,aid);
                pst.setString(2,"dislike");
                pst.setString(3,session.getAttribute("id").toString());
                x=pst.executeUpdate();
                if(x!=0){
                    %>
                        <script>
                            alert("Downvoted!");
                            window.location="ansview.jsp?qid=<%=qid%>";
                        </script>
                        <%
                
                }
                else{
                    %>
                        <script>
                            alert("Failed to Downvote!");
                            window.location="ansview.jsp?qid=<%=qid%>";
                        </script>
                        <%
                
                }
            }
            catch(Exception e){
            out.println(e);
            }
        }
        
        }
        else if(state.equals("1")){
        if(trigger.equals("like")){
            try{
                PreparedStatement pst;
                Class.forName("com.mysql.jdbc.Driver");
                Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/eb","root","");
                pst=con.prepareStatement("delete from ans_response where ans_id=? and user_id=?");
                pst.setString(1,aid);
                pst.setString(2,session.getAttribute("id").toString());
                x=pst.executeUpdate();
                if(x!=0){
                    %>
                        <script>
                            alert("Upvote Removed!");
                            window.location="ansview.jsp?qid=<%=qid%>";
                        </script>
                        <%
                
                }
                else{
                    %>
                        <script>
                            alert("Failed to Remove Upvote!");
                            window.location="ansview.jsp?qid=<%=qid%>";
                        </script>
                        <%
                
                }
                
            }
            catch(Exception e){
            out.println(e);
            }
        }
        else{
            try{
                PreparedStatement pst;
                Class.forName("com.mysql.jdbc.Driver");
                Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/eb","root","");
                pst=con.prepareStatement("update ans_response set response=? where ans_id=? and user_id=?");
                pst.setString(1,"dislike");
                pst.setString(2,aid);
                pst.setString(3,session.getAttribute("id").toString());
                x=pst.executeUpdate();
                if(x!=0){
                    %>
                        <script>
                            alert("Downvoted!");
                            window.location="ansview.jsp?qid=<%=qid%>";
                        </script>
                        <%
                
                }
                else{
                    %>
                        <script>
                            alert("Failed to Downvote!");
                            window.location="ansview.jsp?qid=<%=qid%>";
                        </script>
                        <%
                
                }
            }
            catch(Exception e){
            out.println(e);
            }
        }
        }
        else{
            if(trigger.equals("like")){
                try{
                PreparedStatement pst;
                Class.forName("com.mysql.jdbc.Driver");
                Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/eb","root","");
                pst=con.prepareStatement("update ans_response set response=? where ans_id=? and user_id=?");
                pst.setString(1,"like");
                pst.setString(2,aid);
                pst.setString(3,session.getAttribute("id").toString());
                x=pst.executeUpdate();
                if(x!=0){
                    %>
                        <script>
                            alert("Upvoted!");
                            window.location="ansview.jsp?qid=<%=qid%>";
                        </script>
                        <%
                
                }
                else{
                    %>
                        <script>
                            alert("Failed to Upvote!");
                            window.location="ansview.jsp?qid=<%=qid%>";
                        </script>
                        <%
                
                }
            }
            catch(Exception e){
            out.println(e);
            }
            
            }
            else{
                try{
                PreparedStatement pst;
                Class.forName("com.mysql.jdbc.Driver");
                Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/eb","root","");
                pst=con.prepareStatement("delete from ans_response where ans_id=? and user_id=?");
                pst.setString(1,aid);
                pst.setString(2,session.getAttribute("id").toString());
                x=pst.executeUpdate();
                if(x!=0){
                    %>
                        <script>
                            alert("Downvote Removed!");
                            window.location="ansview.jsp?qid=<%=qid%>";
                        </script>
                        <%
                
                }
                else{
                    %>
                        <script>
                            alert("Failed to Remove Downvote!");
                            window.location="ansview.jsp?qid=<%=qid%>";
                        </script>
                        <%
                
                }
                
            }
            catch(Exception e){
            out.println(e);
            }
                
                
            
            }
        
        }
        
        
        
        
        %>
   
    </body>
</html>
