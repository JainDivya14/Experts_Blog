<%-- 
    Document   : exp_update_profile
    Created on : May 16, 2020, 7:43:30 PM
    Author     : Lenovo
--%>

<%@page import="java.sql.*,java.io.*" contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<HTML>
<HEAD>
<link rel="stylesheet" type="text/css" href="Background/style.css">
<link rel = "icon" href ="Background/eb_logo_2.png" type = "image/icon">
<script src="Scripts/validate.js"></script>
<TITLE>Update Profile</TITLE>
<link rel = "icon" href ="ask.png" type = "image/icon">
</HEAD>
<BODY style="background:#bdffc4;">
    <%
        if(session.getAttribute("type")!="expert")
            response.sendRedirect("logout.jsp");
    %>
    
    <%
        int x=0;
        String name="",dob="",gender="",phone="",address="",institution="",course="";
         try{
                                Class.forName("com.mysql.jdbc.Driver");
                                Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/eb","root","");
                                PreparedStatement ps=con.prepareStatement("select * from expert where id=?");
                                ps.setString(1, session.getAttribute("id").toString());
                                ResultSet rs=ps.executeQuery();
                                while(rs.next()){
                                    name=rs.getString(2);
                                    gender=rs.getString(6);
                                    phone=rs.getString(5);
                                    address=rs.getString(8);
                                    institution=rs.getString(12);
                                    course=rs.getString(9);
                                }
                                ps=con.prepareStatement("select DATE_FORMAT(dob,'%Y-%m-%d') from expert where id=?");
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
    
  
    
    <h1><a href="index.jsp"><img src="Background/eb_logo_header.png" height="25%" width="25%"></a> <a href="logout.jsp"><button type="button" class="bt" data-toggle="modal" data-target="">Logout</button></a></h1>
    <h4 class="list_header" style="padding: 0px 0px 0px 0px;font-size: 30px;">Update Profile</h4>
<div style="text-align: center;">
    <form name ="f2" style="border:0px;" method="post" id="f2" action="exp_update_profile_process.jsp" onsubmit="return ValidateExpUpdate()">
        
                <p style="color:red;">UserID & Email can not be changed!</p>

        <table style="width:100%" align="center">
        <tr>
                
                <td width="33%"><label>Name</label><br>
                    <div class="input-group"><input type="text" name="username" id="username"  value="<% out.println(name); %>" placeholder="Enter Name"></div></td>
                
                
                
                <td width="33%"><label>Phone No. </label><br>
                    <div class="input-group"><input type="tel" name="mobile" id="mobile" value="<% out.println(phone); %>" placeholder="Phone No. " ></div></td>
                
                <td rowspan="2"><label> Institution</label><br>
                    <div class="input-group-box"><textarea name="institute" id="institute" value="" placeholder="Enter Institution"><% out.println(institution); %></textarea></div></td>
		
                
            </tr>
            
            <tr>
                
                   
                <td><label> Date of Birth </label><br>
                <div class="input-group"><input type="date" value="<%=dob%>" name="dob" id="dob" ></div></td>
             
                <td rowspan="2"><label> Address </label><br>
                    <div class="input-group-box"><textarea name="address" value="" id="address" placeholder="Enter Address"><% out.println(address); %></textarea></div></td>
           
                
		
                
            </tr>
            
           
            <tr>
                
                 
                <td><label> Gender</label><br><br>
                <div class="input-group-radio">
                    <% if(gender.equals("Male")){
                        %>
                        <input type="radio" name="gender" id="male" value="Male" checked="true">Male
                        <input type="radio" name="gender" id="female" value="Female">Female</div>
                        <%} 
                        else{
                        %>
                         
                        <input type="radio" name="gender" id="male" value="Male" >Male
                        <input type="radio" name="gender" id="female" value="Female" checked="true">Female</div></td>
                        <%}%>
                       
                        <td>
                        <label>Course<br></label>
                          <div class="input-group"><input type="text" name="course" id="course" value="<% out.println(course); %>" placeholder="Enter Course"></div></td>
                
                 
                
      
            </tr>
           
           <tr>
                        
               <td><label>Add Space<br></label>
                        <div class="input-group"><select name="space" id="space" class="select">
                            <option value="1">Computer Engineering or Information Technology</option>
                            <option value="2">Mechanical Engineering</option>
                            <option value="3">Electrical Engineering</option>
                            <option value="4">Electronics & Communication Engineering</option>
                            </select></div></td>
                <td><label>Post<br></label>
                        <div class="input-group"><select name="post" id="post" class="select">
                            <option value="Assistant Professor">Assistant Professor</option>
                            <option value="Senior Professor">Senior Professor</option>
                            <option value="Technical Trainer">Technical Trainer</option>
                            <option value="Industrial Expert">Industrial Expert</option>
                            <option value="Managerial Expert">Managerial Expert</option>
                            </select></div></td>            
                            
                            <td><label>Enter Password to Update Profile</label><br>
                <div class="input-group"><input type="password" name="password" id="password"  placeholder="Enter Password"></div></td>
               
                            
                            
                           
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

</BODY>
</HTML>