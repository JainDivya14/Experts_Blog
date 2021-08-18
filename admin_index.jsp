<%-- 
    Document   : admin_index
    Created on : May 11, 2020, 8:04:02 PM
    Author     : Lenovo
--%>

<%@page import="java.sql.*,java.io.*" contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<HTML>
<HEAD>
<link rel="stylesheet" type="text/css" href="Background/style.css">
<link rel = "icon" href ="Background/eb_logo_2.png" type = "image/icon">

<TITLE>Experts' Blog - Home</TITLE>
<link rel = "icon" href ="ask.png" type = "image/icon">
</HEAD>
<BODY style="background:#bdffc4;">
    <%
        if(session.getAttribute("type")!="admin")
            response.sendRedirect("logout.jsp");
    %>
    
    <h1><a href="index.jsp"><img src="Background/eb_logo_header.png" height="25%" width="25%"></a> <a href="logout.jsp"><button type="button" class="bt" data-toggle="modal" data-target="">Logout</button></a></h1>

<div align="center" >

     <table class="menu" style="width: 100%;height: 100%;text-align: center;font-size: 30px;font-weight: bold;">
         <%
        String students="",experts="",qa="",spaces="",pos="",neg="";
        int notif=0;
        try{
            Class.forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/eb","root","");
            Statement st=con.createStatement();
            String q="select count(*) from student";
            ResultSet rs=st.executeQuery(q);
            while(rs.next()){
                students=rs.getString(1);
            }
            q="select count(*) from expert";
            rs=st.executeQuery(q);
            while(rs.next()){
                experts=rs.getString(1);
            }
            q="select count(*) from space";
            rs=st.executeQuery(q);
            while(rs.next()){
                spaces=rs.getString(1);
            }
            q="select count(*) from ques_ans";
            rs=st.executeQuery(q);
            while(rs.next()){
                qa=rs.getString(1);
            }
            q="select count(*) from ans_response where response='like'";
            rs=st.executeQuery(q);
            while(rs.next()){
                pos=rs.getString(1);
            }
            q="select count(*) from ans_response where response='dislike'";
            rs=st.executeQuery(q);
            while(rs.next()){
                neg=rs.getString(1);
            }
            q="select count(*) from feedback where status=0";
            rs=st.executeQuery(q);
            while(rs.next()){
                notif=Integer.parseInt(rs.getString(1));
            }
            
        }
        catch(Exception e){
            out.println(e);
        }
         %>
         <tr>
             <td width="33%"><a href="student_display.jsp"><img src="Background/Icons/student.png" height="200px" width="200px">
                     <br/><% out.println(students); %>+ Students</a></td>
             <td width="34%"><a href="expert_display.jsp"><img src="Background/Icons/expert.png" height="200px" width="200px">
             <br/><% out.println(experts); %>+ Experts</a></td>
             <td width="33%"><a href="space_display.jsp"><img src="Background/Icons/spaces.png" height="200px" width="250px">
             <br/><% out.println(spaces); %>+ Spaces</a></td>
         </tr>
          <tr>
             <td width="33%"><a href="qa_display.jsp"><img src="Background/Icons/question_answer.png" height="200px" width="300px">
             <br/><% out.println(qa); %>+ Question-Answer</a></td>
             <td width="33%"><img src="Background/Icons/like.png" height="200px" width="200px">
             <br/><% out.println(pos); %>+ Positive Response</td>
             <td width="34%"><img src="Background/Icons/dislike.png" height="200px" width="200px">
             <br/><% out.println(neg); %>+ Negative Response</td>
             
             
         </tr>
         
     </table>

</div>
</BODY>
<H2 class="footer">
    <table align="center">
        <tr>
            <td width="350px">
                <a href="feedback_viewer.jsp" title="Feedback Viewer">
                    <img src="Background/Icons/feedback.png" height="40px" width="40px">
                </a>
            </td>
            <td width="350px">
                <a href="addexpert.jsp" title="Add Expert">
                    <img src="Background/Icons/addexpert.png" height="40px" width="40px">  
                </a>
            </td>
            <td width="350px">
                <a href="search.jsp" title="Search">
                    <img src="Background/Icons/search.png" height="40px" width="40px">
                </a>
            </td>
			<td width="350px">
                <a href="notification.jsp" title="Notification">
                    <img src="Background/Icons/notification.png" height="40px" width="40px">
					<span class="badge"><% out.println((notif==0) ? "" : notif); %></span>
                </a>
            </td>
            <td width="350px">
                <a href="admin_profile.jsp" title="Profile">
                    <img src="Background/Icons/profile.png" height="40px" width="40px">
                </a>
            </td>
        </tr>
    </table>
</H2>
    
</HTML>