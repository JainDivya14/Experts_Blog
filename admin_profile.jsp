<%-- 
    Document   : admin_profile
    Created on : May 13, 2020, 5:07:06 PM
    Author     : Lenovo
--%>

<%@page import="java.sql.*,java.io.*" contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="Background/style.css">
        <link rel = "icon" href ="Background/eb_logo_2.png" type = "image/icon">

        <title>Experts' Blog - Profile</title>
    </head>
    <body style="background:#bdffc4;">
    <%
        if(session.getAttribute("type")!="admin")
            response.sendRedirect("logout.jsp");
    %>
    <h1><a href="index.jsp"><img src="Background/eb_logo_header.png" height="25%" width="25%"></a> <a href="logout.jsp"><button type="button" class="bt" data-toggle="modal" data-target="">Logout</button></a></h1>
    <%
        int x=0;
        try{
            Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/eb","root","");
            PreparedStatement ps=conn.prepareStatement("select * from admin where id=?");
            ps.setString(1, session.getAttribute("id").toString());
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
                <td>Address</td><td><% out.println(rs.getString(6)); %></td>
                </tr>
                    
                   
                
                
                </table>
        <button style="margin-left: 85px; width: 10%" class="btn"><a href="update_profile_admin.jsp">Update Profile</a></button>
            <%
            }
            }
            catch(Exception e){
                out.println(e);
            }
   
    %>
    <hr>
    
    <%
        
        int users=0;
        String students="",experts="",admins="",time="";
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
            q="select count(*) from admin";
            rs=st.executeQuery(q);
            while(rs.next()){
                admins=rs.getString(1);
            }
            q="select DATEDIFF(CURDATE(),log) from admin where id='11170686'";
            rs=st.executeQuery(q);
            while(rs.next()){
                time=rs.getString(1);
            }
            users=Integer.parseInt(students)+Integer.parseInt(experts)+Integer.parseInt(admins);
            
        }
        catch(Exception e){
            out.println(e);
        }
        
    %>
         <table class="menu" style="width: 100%;height: 100%;text-align: center;font-size: 30px;font-weight: bold;">
         <tr>
             <td width="33%"><img src="Background/Icons/stopwatch.png" height="200px" width="200px">
             <br/><% out.println(time); %>Days : Time Elapsed</td>
             <td width="34%"><img src="Background/Icons/users.png" height="200px" width="200px">
             <br/><% out.println(users); %> : Total Users</td>
         </tr>
         </table>
    
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

    
    </body>
</html>