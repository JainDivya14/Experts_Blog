<%-- 
    Document   : notification
    Created on : May 15, 2020, 6:04:20 PM
    Author     : Lenovo
--%>

<%@page import="java.sql.*,java.io.*" contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<HTML>
<HEAD>
<link rel="stylesheet" type="text/css" href="Background/style.css">
<link rel = "icon" href ="Background/eb_logo_2.png" type = "image/icon">

<TITLE>Experts' Blog - Notifications</TITLE>
<link rel = "icon" href ="ask.png" type = "image/icon">
</HEAD>
<BODY style="background:#bdffc4;">
    <%
        if(session.getAttribute("type")!="admin")
            response.sendRedirect("logout.jsp");
    %>
    
    <h1><a href="index.jsp"><img src="Background/eb_logo_header.png" height="25%" width="25%"></a> <a href="logout.jsp"><button type="button" class="bt" data-toggle="modal" data-target="">Logout</button></a></h1>
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
        <h4 class="list_header">Notifications</h4> <% if(notif>0){ %>
        <h4 class="list_header" style="background:lightgray;text-align: left;font-size: 25px;"><%out.println(notif);%>New Feedback</h4>
    <div align="center">        
                  
                        <table class="feedtable" border="1px" style="background: white;text-align: center;width:100%;">
                            <tr style="font-weight: bold;">
                                <td>No.</td>
                                <td>Experience</td>
                                <td>Type</td>
                                <td>Comment</td>
                                <td>Name</td>
                                <td>Email</td>
                                <td>Log</td>
                            </tr>
                            <%
                            try{
                                Class.forName("com.mysql.jdbc.Driver");
                                Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/eb","root","");
                                PreparedStatement ps=con.prepareStatement("select * from feedback where status=0 order by date_time DESC");
                                ResultSet rs=ps.executeQuery();
                                while(rs.next()){
                                    %>
                                    <tr>
                                    <td><% out.println(rs.getString(1)); %></td>
                                    <td><% out.println(rs.getString(2)); %></td>
                                    <td><% out.println(rs.getString(3)); %></td>
                                    <td><% out.println(rs.getString(4)); %></td>
                                    <td><% out.println(rs.getString(5)); %></td>
                                    <td><% out.println(rs.getString(6)); %></td>
                                    <td><% out.println(rs.getString(7)); %></td>
                                    </tr>
                                    </table>
                                    <%
                                }
                                ps=con.prepareStatement("update feedback set status=1");
                                int x=ps.executeUpdate();
                                con.close();
                            }
                            catch(Exception e){
                                System.out.println(e);
                            }
        }
        else{
                %>    <h4 class="list_header" style="background:lightgray;text-align: left;font-size:25px;">No New Notification at this moment.</h4> <%

        }

%>

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
</BODY>
</HTML>