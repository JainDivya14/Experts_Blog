<%-- 
    Document   : searched
    Created on : May 15, 2020, 9:05:22 PM
    Author     : Lenovo
--%>

<%@page import="java.sql.*,java.io.*" contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<HTML>
<HEAD>
<link rel="stylesheet" type="text/css" href="Background/style.css">
<link rel = "icon" href ="Background/eb_logo_2.png" type = "image/icon">
<script src="Scripts/validate.js"></script>
<TITLE>Experts' Blog - Search Result</TITLE>
<link rel = "icon" href ="ask.png" type = "image/icon">
</HEAD>
<BODY style="background:#bdffc4;">
        <h1><a href="index.jsp"><img src="Background/eb_logo_header.png" height="25%" width="25%"></a> <a href="logout.jsp"><button type="button" class="bt" data-toggle="modal" data-target="">Logout</button></a></h1>

    <%
        if(session.getAttribute("type")!="admin")
            response.sendRedirect("logout.jsp");
    %>
    <br>
    <div align="center" style="font-size: 25px;">
        <form style="background: white;">
    <%
        String sid=request.getParameter("sid");
        String stype=request.getParameter("stype");
        int c=0;
        try{
                                Class.forName("com.mysql.jdbc.Driver");
                                Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/eb","root","");
                                PreparedStatement ps;
                                String name="",institute="",email="",mobile="",address="",course="",post="";
                                if(stype.equals("1")){
                                ps=con.prepareStatement("select * from student where id=?");
                                ps.setString(1, sid);
                                ResultSet rs=ps.executeQuery();
                                while(rs.next()){
                                    name=rs.getString(2);
                                    email=rs.getString(4);
                                    mobile=rs.getString(5);
                                    address=rs.getString(8);
                                    course=rs.getString(9);
                                    institute=rs.getString(10);
                                    c++;
                                }
                                if(c>0){
                                %>
                                <table style="border-collapse: separate;border-spacing: 50px 15px;">
                                        <tr>
                                            <td>Student ID</td>
                                            <td><% out.println(sid); %></td>
                                        </tr>
                                        <tr>
                                            <td>Name</td>
                                            <td><% out.println(name); %></td>
                                        </tr>
                                        <tr>
                                            <td>Email</td>
                                            <td><% out.println(email); %></td>
                                        </tr>
                                        <tr>
                                            <td>Mobile</td>
                                            <td><% out.println(mobile); %></td>
                                        </tr>
                                        <tr>
                                            <td>Address</td>
                                            <td><% out.println(address); %></td>
                                        </tr>
                                        <tr>
                                            <td>Course</td>
                                            <td><% out.println(course); %></td>
                                        </tr>
                                        <tr>
                                            <td>Institute</td>
                                            <td><% out.println(institute); %></td>
                                        </tr>
                                    </table>
                                <%
                                }
                                else{
                                    %>
                                <h3><% out.println("No student Found!"); %></h3>
                                <%
                                }
                                
                                }
                                else if(stype.equals("2")){
                                ps=con.prepareStatement("select * from expert where id=?");
                                ps.setString(1, sid);
                                ResultSet rs=ps.executeQuery();
                                while(rs.next()){
                                    name=rs.getString(2);
                                    email=rs.getString(4);
                                    mobile=rs.getString(5);
                                    address=rs.getString(8);
                                    course=rs.getString(9);
                                    post=rs.getString(11);
                                    institute=rs.getString(12);
                                    c++;
                                }
                                if(c>0){
                                %>
                                    <table style="border-collapse: separate;border-spacing: 50px 15px;">
                                        <tr>
                                            <td>Expert ID</td>
                                            <td><% out.println(sid); %></td>
                                        </tr>
                                        <tr>
                                            <td>Name</td>
                                            <td><% out.println(name); %></td>
                                        </tr>
                                        <tr>
                                            <td>Email</td>
                                            <td><% out.println(email); %></td>
                                        </tr>
                                        <tr>
                                            <td>Mobile</td>
                                            <td><% out.println(mobile); %></td>
                                        </tr>
                                        <tr>
                                            <td>Address</td>
                                            <td><% out.println(address); %></td>
                                        </tr>
                                        <tr>
                                            <td>Field</td>
                                            <td><% out.println(course); %></td>
                                        </tr>
                                        <tr>
                                            <td>Post</td>
                                            <td><% out.println(post); %></td>
                                        </tr>
                                        <tr>
                                            <td>Institute</td>
                                            <td><% out.println(institute); %></td>
                                        </tr>
                                    </table>
                                <%
                                }
                                else{
                                    %>
                                <h3><% out.println("No Expert Found!"); %></h3>
                                <%
                                }
                                }
                                else{
                                    int k=0;
                                    String ques="";
                                ps=con.prepareStatement("select * from ques_ans where qid=?");
                                ps.setString(1,sid);
                                ResultSet rs=ps.executeQuery();
                                while(rs.next()){
                                ques=rs.getString(2);
                                k++;
                                }
                                if(k>0){
                                    %><h3>Qid:<% out.println(sid); %></h3><%
                                    %><h3>Q:<% out.println(ques); %></h3><%
                                }
                                else{
                                         %><h3><% out.println("No Question Found!"); %></h3><%
                                }
                                }
                               
        }
        catch(Exception e){
        out.println(e);
        }
    %>
   
        </form>
    </div>
</BODY>
<%
       int notif=0;
       try{
           Class.forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/eb","root","");
            Statement st=con.createStatement();
           String q="select count(*) from feedback where status=0";
           ResultSet rs=st.executeQuery(q);
            while(rs.next()){
                notif=Integer.parseInt(rs.getString(1));
            }
       }
       catch(Exception e){
           out.println(e);
       }
    %>
    <br><br><br><br>
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