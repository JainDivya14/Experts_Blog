<%-- 
    Document   : exp_profile_view
    Created on : May 16, 2020, 1:19:50 PM
    Author     : Lenovo
--%>

<%@page import="java.sql.*,java.io.*" contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<HTML>
<HEAD>
<link rel="stylesheet" type="text/css" href="Background/style.css">
<TITLE>Experts' Blog - Expert</TITLE>
<link rel = "icon" href ="Background/eb_logo_2.png" type = "image/icon">
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
<h4 class="list_header" style="background:lightgray;text-align: left;font-size:25px;">Expert Profile View</h4> 

    <%
        String expid=request.getParameter("expid");
        int x=0;
        try{
            Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/eb","root","");
            PreparedStatement ps=conn.prepareStatement("select * from expert where id=?");
            ps.setString(1, expid);
            ResultSet rs=ps.executeQuery();
            while(rs.next()){
            %> 
                <table style="margin-left: 5%;font-size: 20px;">
                <tr>
                <td colspan="2" style="font-size: 25px;"><b><% out.println(rs.getString(2)); %></b></td>
                </tr>
                <tr>
                <td width="100px">User ID</td><td><% out.println(rs.getString(1)); %></td>
                </tr>
                <tr>
                <td>Email</td><td><% out.println(rs.getString(4)); %></td>
                </tr>
                <tr>
                <td>Mobile</td><td><% out.println(rs.getString(5)); %></td>
                </tr>
                <tr>
                <td>Address</td><td><% out.println(rs.getString(8)); %></td>
                </tr>
                <tr>    
                <td>Field</td><td><% out.println(rs.getString(9)); %></td>
                </tr>
                <tr>    
                <td>Post</td><td><% out.println(rs.getString(11)); %></td>
                </tr>
                <tr>
                <td>Institution</td><td><% out.println(rs.getString(12)); %></td>
                </tr>
                <tr>
                <td>DOB</td><td><% out.println(rs.getString(7)); %></td>
                </tr>
                <tr>
                <td>Gender</td><td><% out.println(rs.getString(6)); %></td>
                </tr>
                
                </table>

            <%
            }
            }
            catch(Exception e){
                out.println(e);
            }
   
    %>
    <hr>
<%
        String answered="",upvotes="",downvotes="";
        try{
            PreparedStatement pst;
            Class.forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/eb","root","");
            pst=con.prepareStatement("select count(*) from ans_table where answeredby=?");
            pst.setString(1,expid);
            ResultSet rs=pst.executeQuery();
            while(rs.next()){
                answered=rs.getString(1);
            }
            pst=con.prepareStatement("select count(*) from ans_response where response='dislike' and ans_id IN (select ansid from ans_table where answeredby=?)");
            pst.setString(1,expid);
            rs=pst.executeQuery();
            while(rs.next()){
                downvotes=rs.getString(1);
            }
            pst=con.prepareStatement("select count(*) from ans_response where response='like' and ans_id IN (select ansid from ans_table where answeredby=?)");
            pst.setString(1,expid);
            rs=pst.executeQuery();
            while(rs.next()){
                upvotes=rs.getString(1);
            }
            con.close();
            }
        catch(Exception e){
            out.println(e);
        }
    
    %>
        <table class="menu" style="width: 100%;height: 100%;text-align: center;font-size: 30px;font-weight: bold;">
        <tr>
             <td width="33%"><a href=""><img src="Background/Icons/question_answer.png" height="100px" width="150px">
             <br/><% out.println(answered); %> Answers Posted</a></td>
             <td width="33%"><img src="Background/Icons/like.png" height="100px" width="100px">
             <br/><% out.println(upvotes); %> Upvotes</td>
             <td width="34%"><img src="Background/Icons/dislike.png" height="100px" width="100px">
             <br/><% out.println(downvotes); %> Downvotes</td>
         </tr>
         </table>
         
<H2 class="footer">
    <table align="center">
        <tr>
            <td width="350px">
                <a href="ask.jsp" title="Ask a Question">
                    <img src="Background/Icons/ask.png" height="40px" width="40px">
                </a>
            </td>
            <td width="350px">
                <a href="askbyme.jsp" title="Asked Questions">
                    <img src="Background/Icons/iask.png" height="40px" width="40px">
                </a>
            </td>
            <td width="350px">
                <a href="saved_ques.jsp" title="Bookmarks">
                    <img src="Background/Icons/star.png" height="40px" width="40px">  
                </a>
            </td>
			<td width="350px">
                <a href="search_ques.jsp" title="Search">
                    <img src="Background/Icons/search.png" height="40px" width="40px">
					
                </a>
            </td>
            <td width="350px">
                <a href="stu_profile.jsp" title="Profile">
                    <img src="Background/Icons/profile.png" height="40px" width="40px">
                </a>
            </td>
        </tr>
    </table>
</H2>
</BODY>
</HTML>