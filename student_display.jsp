<%-- 
    Document   : student_display
    Created on : May 13, 2020, 4:16:24 PM
    Author     : Lenovo
--%>

<%@page import="java.sql.*,java.io.*" contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="Background/style.css">
        <link rel = "icon" href ="Background/eb_logo_2.png" type = "image/icon">

        <title>Experts' Blog - Students List</title>
    </head>
    <body style="background:#bdffc4;">
    <%
        if(session.getAttribute("type")!="admin")
            response.sendRedirect("logout.jsp");
    %>
    <h1><a href="index.jsp"><img src="Background/eb_logo_header.png" height="25%" width="25%"></a> <a href="logout.jsp"><button type="button" class="bt" data-toggle="modal" data-target="">Logout</button></a></h1>
    <h4 class="list_header">Students List</h4>
    <div align="center">        
                  
                        <table class="feedtable" border="1px" style="background: white;text-align: center;width:100%;">
                            <tr style="font-weight: bold;">
                                <td>S.No.</td>
                                <td>ID</td>
                                <td>NAME</td>
                                <td>EMAIL</td>
                                <td>MOBILE</td>
                                <td>SEX</td>
                                <td>DOB</td>
                                <td>ADDRESS</td>
                                <td>COURSE</td>
                                <td>INSTITUTION</td>
                                <td>DELETE</td>
                            </tr>
                            <%
                            try{
                                int count=1;
                                Class.forName("com.mysql.jdbc.Driver");
                                Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/eb","root","");
                                PreparedStatement ps=con.prepareStatement("select * from student");
                                ResultSet rs=ps.executeQuery();
                                while(rs.next()){
                                    String del_id=rs.getString(1);
                                    %>
                                    <tr>
                                    <td><% out.println(count); %></td>
                                    <td><% out.println(rs.getString(1)); %></td>
                                    <td><% out.println(rs.getString(2)); %></td>
                                    <td><% out.println(rs.getString(4)); %></td>
                                    <td><% out.println(rs.getString(5)); %></td>
                                    <td><% out.println(rs.getString(6)); %></td>
                                    <td><% out.println(rs.getString(7)); %></td>
                                    <td><% out.println(rs.getString(8)); %></td>
                                    <td><% out.println(rs.getString(9)); %></td>
                                    <td><% out.println(rs.getString(10)); %></td>
                                    <td><a href="delete_student.jsp?del_id=<%=del_id%>">Delete</a></td>
                                    </tr>
                                    <%
                                    count++;
                                }
                                
                                con.close();
                                
                            }
                            catch(Exception e){
                                System.out.println(e);
                            }
                            
                            
                            %>
                   
                        </table>
                         <br><br><br><br>  
                     
                    </div>
    
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
    
</html>
