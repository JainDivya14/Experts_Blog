<%-- 
    Document   : reg_student.jsp
    Created on : May 7, 2020, 4:16:39 PM
    Author     : Akash
--%>

<%@page import="java.sql.*,java.io.*" contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="Background/style.css">
        <link rel = "icon" href ="Background/eb_logo_2.png" type = "image/icon">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registration Page</title>
    </head>
    <body style="background: #43B762;">
        <h1><a href="index.jsp"><img src="Background/eb_logo_header.png" height="25%" width="25%"></a> <a href="index.jsp"><button type="button" class="bt" data-toggle="modal" data-target="#myModal">Back to Login</button></a></h1>
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
            String name,phone,institute,email,dob,address,course,gender,password;
            name=request.getParameter("username");
            phone=request.getParameter("mobile");
            institute=request.getParameter("institute");
            email=request.getParameter("email");
            dob=request.getParameter("dob");
            address=request.getParameter("address");
            course=request.getParameter("course");
            password=request.getParameter("password");
            gender=request.getParameter("gender");
            
            
            try{
            
            Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/eb","root","");
            PreparedStatement ps=conn.prepareStatement("select * from student where email=?");
            ps.setString(1, email);
            ResultSet rs=ps.executeQuery();
            while(rs.next()){
                x++;
            }
            }
            catch(Exception e){
                out.println(e);
            }
            if(x==0){
            try{
            PreparedStatement pst;
            Class.forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/eb","root","");
            pst=con.prepareStatement("insert into student (username,email,mobile,address,course,institution,password,dob,gender) values (?,?,?,?,?,?,?,?,?)");
            pst.setString(1,name);
            pst.setString(2,email);
            pst.setString(3,phone);
            pst.setString(4,address);
            pst.setString(5,course);
            pst.setString(6,institute);
            pst.setString(7,password);
            pst.setString(8,dob);
            pst.setString(9,gender);
            x=pst.executeUpdate();
            if(x==1){
                try{
                    PreparedStatement ps=con.prepareStatement("select * from student where email=?");
                    ps.setString(1, email);
                    ResultSet rs=ps.executeQuery();
                    while(rs.next()){
                        //out.println("Your id is : "+rs.getString(1));
                        %>
                        <div align="center">
                        <div style="text-align:center;width:50%;alignment-adjust:center;">
                        <form style="border:1px solid black;background: white;text-align: center;">
                            <p style="font-size: 40px;color:green">Registration Successful!</p>
                            <p style="font-size: 35px;color:black"> Your ID is <% out.println(rs.getString(1)); %>
                            </p>
                            <p style="font-size: 30px;color:black">Go Back and Login using ID and password!</p>
                        </form>
                        </div>
                        </div>
                        <%
                    }
                }
                catch(Exception ee){
                    System.out.println(ee);
                }
                
                //out.println("DATA SAVED!");
            }
            else{
                 out.println("NOT SAVED!");
                 %>
                 <script>
                 alert("Failed to register!");
                 window.location= "register.jsp";
                 </script>
                <%
            }
            }
        catch(Exception ee){
            System.out.println(ee);
        }
        }
            else{
                %>
                <script>
                alert("Email already registered!");
                window.location= "register.jsp";
                </script>
                <%
            }
        %>
    </body>
</html>
