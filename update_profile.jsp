<%-- 
    Document   : update_profile
    Created on : May 14, 2020, 8:20:56 PM
    Author     : Lenovo
--%>


<%@page import="java.sql.*,java.io.*" contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Experts' Blog - Update Profile</title>
    <link rel="stylesheet" type="text/css" href="Background/style.css">
    <link rel = "icon" href ="Background/eb_logo_2.png" type = "image/icon">

    <script src="Scripts/validate.js"></script>
    <script src="Scripts/AJAX.js"></script>   
    
</head>
<body style="background:#bdffc4;">

    <%
        if(session.getAttribute("type")!="student")
            response.sendRedirect("logout.jsp");
    %>
    
<h1><a href="index.jsp"><img src="Background/eb_logo_header.png" height="25%" width="25%"></a> <a href="index.jsp"><button type="button" class="bt" data-toggle="modal" data-target="#myModal">Cancel</button></a></h1>
<h1 style="margin-top: 0px;margin-bottom: 10px;background: lightgreen;color: black; padding: 10px;font-size: 30px;font-weight: bold;">
      <div align="right">
      <table class="subheader"><tr>
      <td><a href="about.jsp">About Us</a></td>
      <td><a href="feedback.jsp">Feedback</a></td>
      </tr></table>
      </div>
</h1>
<%
int x=0;
String name="",dob="",gender="",phone="",address="",institution="",course="";
try{
                                Class.forName("com.mysql.jdbc.Driver");
                                Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/eb","root","");
                                PreparedStatement ps=con.prepareStatement("select * from student where id=?");
                                ps.setString(1, session.getAttribute("id").toString());
                                ResultSet rs=ps.executeQuery();
                                while(rs.next()){
                                    name=rs.getString(2);
                                    gender=rs.getString(6);
                                    phone=rs.getString(5);
                                    address=rs.getString(8);
                                    institution=rs.getString(10);
                                    course=rs.getString(9);
                                }
                                ps=con.prepareStatement("select DATE_FORMAT(DOB,'%Y-%m-%d') from student where id=?");
                                ps.setString(1, session.getAttribute("id").toString());
                                rs=ps.executeQuery();
                                while(rs.next()){
                                    dob=rs.getString(1);
                                }
}
catch(Exception e){
    out.println(e);
}
%>
<div style="text-align: center;">
    <form name ="f2" style="border:0px;" method="post" id="f2" action="update_profile_process.jsp" onsubmit="return ValidateUpdate()">
        <p style="color:red;">UserID & Email can not be changed!</p>
        <table style="width:100%;" align="center">
        <tr>
                
                <td width="33%"><label>Name</label><br>
                    <div class="input-group"><input type="text" name="username" value="<% out.println(name); %>" id="username"  placeholder="Enter Name"></div></td>
                
                
                
                <td width="33%"><label>Phone No. </label><br>
                    <div class="input-group"><input type="tel" name="mobile" value="<% out.println(phone); %>" id="mobile" placeholder="Phone No. " ></div></td>
                
                <td rowspan="2"><label> Institution</label><br>
                    <div class="input-group-box"><textarea name="institute"  id="institute"  placeholder="Enter Institution"><% out.println(institution); %></textarea></div></td>
		
                
            </tr>
            
            <tr>
                <td><label> Gender</label><br><br>
                <div class="input-group-radio">
                    <% if(gender.equals("Male")){
                        %>
                        <input type="radio" name="gender" id="male" value="Male" checked="true">Male
                        <input type="radio" name="gender" id="female" value="Female">Female</div></td>
                        <%} 
                        else{
                        %>
                         
                        <input type="radio" name="gender" id="male" value="Male" >Male
                        <input type="radio" name="gender" id="female" value="Female" checked="true">Female</div></td>
                        <%}%>
                  
             
                <td rowspan="2"><label> Address </label><br>
                    <div class="input-group-box"><textarea name="address" id="address"  placeholder="Enter Address"><% out.println(address); %></textarea></div></td>
           
		
                
            </tr>
            
            
            <tr>
               
                 
                <td><label> Date of Birth </label><br>
                    <div class="input-group"><input type="date" value="<%=(dob)%>" name="dob" id="dob" ></div></td>
                    
                
                <td><label> Course </label><br>
                <div class="input-group"><input type="text" name="course" value="<% out.println(course); %>" id="course"  placeholder="Enter Course"></div></td>
                
                 
               
            </tr>
            
            
            <tr>
                
                 
                 
               
                <td><label>Enter Password to Continue</label><br>
                <div class="input-group"><input type="password" name="password" id="password"  placeholder="Enter Password"></div></td>
                         
                                
      
            </tr>
           
           <tr>
           </tr>
            </table>
            <br><br>
            <table align="center">
             <tr>
                 <td><input class="bt" type="submit" value="Update" id="sub"></td>
                 <td></td>
                 <td><input class="bt" style="background:indianred;" type="reset"></td>
            </tr>
            </table> 
          </form>	
          </div>
</body>
</html>