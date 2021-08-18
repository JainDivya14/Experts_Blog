<%-- 
    Document   : reg_expert
    Created on : May 15, 2020, 7:59:08 PM
    Author     : Lenovo
--%>

<%@page import="java.sql.*,java.io.*" contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<HTML>
<HEAD>
<link rel="stylesheet" type="text/css" href="Background/style.css">
<link rel = "icon" href ="Background/eb_logo_2.png" type = "image/icon">
<script src="Scripts/validate.js"></script>
<TITLE>Register-Expert</TITLE>
<link rel = "icon" href ="ask.png" type = "image/icon">
</HEAD>
<BODY style="background:#bdffc4;">
        <h1><a href="index.jsp"><img src="Background/eb_logo_header.png" height="25%" width="25%"></a> <a href="logout.jsp"><button type="button" class="bt" data-toggle="modal" data-target="">Logout</button></a></h1>

    <%
        if(session.getAttribute("type")!="admin")
            response.sendRedirect("logout.jsp");
    %>
    
    <%
        try{
            PreparedStatement pst;
            Class.forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/eb","root","");
            pst=con.prepareStatement("insert into expert (username,email,mobile,address,field,institution,password,dob,gender,space,post) values (?,?,?,?,?,?,?,?,?,?,?)");
           
            int x=0;
            String name,phone,institute,email,dob,address,course,gender,password,post,space;
            name=request.getParameter("username");
            phone=request.getParameter("mobile");
            institute=request.getParameter("institute");
            email=request.getParameter("email");
            dob=request.getParameter("dob");
            address=request.getParameter("address");
            course=request.getParameter("course");
            password=request.getParameter("password");
            gender=request.getParameter("gender");
            space=request.getParameter("space");
            post=request.getParameter("post");
            pst.setString(1,name);
            pst.setString(2,email);
            pst.setString(3,phone);
            pst.setString(4,address);
            pst.setString(5,course);
            pst.setString(6,institute);
            pst.setString(7,password);
            pst.setString(8,dob);
            pst.setString(9,gender);
            pst.setString(10,space);
            pst.setString(11,post);
            x=pst.executeUpdate();
            if(x==1){
                try{
                    PreparedStatement ps=con.prepareStatement("select * from expert where email=?");
                    ps.setString(1, email);
                    ResultSet rs=ps.executeQuery();
                    while(rs.next()){
                        //out.println("Your id is : "+rs.getString(1));
                        %>
                        <br><br>
                        <div align="center">
                        <div style="text-align:center;width:50%;alignment-adjust:center;">
                        <form style="border:1px solid black;background: white;text-align: center;">
                            <p style="font-size: 40px;color:green">Registration Successful!</p>
                            <p style="font-size: 35px;color:black">Expert ID is <% out.println(rs.getString(1)); %>
                            </p>
                        </form>
                        </div>
                        </div>
                        <%
                    }
                }
                catch(Exception ee){
                    out.println(ee);
                }
            }
        }
        catch(Exception e){
            out.println(e);
                }
    
    %>
    
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

</BODY>
</HTML>