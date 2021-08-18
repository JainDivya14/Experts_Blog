<%-- 
    Document   : addexpert
    Created on : May 15, 2020, 6:51:41 PM
    Author     : Lenovo
--%>

<%@page import="java.sql.*,java.io.*" contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<HTML>
<HEAD>
<link rel="stylesheet" type="text/css" href="Background/style.css">
<link rel = "icon" href ="Background/eb_logo_2.png" type = "image/icon">
<script src="Scripts/validate.js"></script>
<TITLE>Experts' Blog - New Expert</TITLE>
<link rel = "icon" href ="ask.png" type = "image/icon">
</HEAD>
<BODY style="background:#bdffc4;">
    <%
        if(session.getAttribute("type")!="admin")
            response.sendRedirect("logout.jsp");
    %>
    
    <h1><a href="index.jsp"><img src="Background/eb_logo_header.png" height="25%" width="25%"></a> <a href="logout.jsp"><button type="button" class="bt" data-toggle="modal" data-target="">Logout</button></a></h1>
    <h4 class="list_header" style="padding: 0px 0px 0px 0px;font-size: 30px;">Expert Registration</h4>
<div style="text-align: center;">
    <form name ="f2" style="border:0px;" method="post" id="f2" action="reg_expert.jsp" onsubmit="return ValidateRegister()">
        <table style="width:100%" align="center">
        <tr>
                
                <td width="33%"><label>Name</label><br>
                <div class="input-group"><input type="text" name="username" id="username"  placeholder="Enter Name"></div></td>
                
                
                
                <td width="33%"><label>Phone No. </label><br>
                    <div class="input-group"><input type="tel" name="mobile" id="mobile" placeholder="Phone No. " ></div></td>
                
                <td rowspan="2"><label> Institution</label><br>
                    <div class="input-group-box"><textarea name="institute" id="institute"  placeholder="Enter Institution"></textarea></div></td>
		
                
            </tr>
            
            <tr>
                <td><label> E-mail </label><br>
                <div class="input-group"><input type="email" name="email" id="email" onkeyup="sendInfo()" placeholder="Enter E-mail"><br>
                    <span id="a" style="color:red;"></span></div></td>   
             
                <td rowspan="2"><label> Address </label><br>
                    <div class="input-group-box"><textarea name="address" id="address"  placeholder="Enter Address"></textarea></div></td>
           
		
                
            </tr>
            
            
            <tr>
               
                 
                <td><label> Date of Birth </label><br>
                <div class="input-group"><input type="date" name="dob" id="dob" value="2000-01-01"></div></td>
                    
                
                <td><label> Course </label><br>
                <div class="input-group"><input type="text" name="course" id="course"  placeholder="Enter Course"></div></td>
                
                 
               
            </tr>
            
            
            <tr>
                
                 
                 <td><label> Gender</label><br><br>
                <div class="input-group-radio">
                <input type="radio" name="gender" id="male" value="Male">Male
                <input type="radio" name="gender" id="female" value="Female">Female</div></td>
               
                <td><label> Password </label><br>
                <div class="input-group"><input type="password" name="password" id="password"  placeholder="Enter Password"></div></td>
                         
                 <td><label> Confirm Password </label><br>
                <div class="input-group"><input type="password" name="password2" id="password2"  placeholder="Confirm Password"></div></td>
                
      
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
                            
                            
                            
                            
                           
           </tr>
            </table>
            <br><br>
            <table align="center">
             <tr>
                 <td><input class="bt" type="submit" value="Register" id="sub"></td>
                 <td></td>
                 <td><input class="bt" style="background:indianred;" type="reset"></td>
            </tr>
            </table> 
          </form>
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

</BODY>
</HTML>