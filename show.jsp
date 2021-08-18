<%@page import="java.sql.*" contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
        String email=request.getParameter("val");
        if(email==null || email.trim().equals(""))
            out.println("Enter Email!"); 
        else{
        try{
            Class.forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/eb","root","");
            PreparedStatement ps=con.prepareStatement("select * from student where email=?");
            ps.setString(1, email);
            ResultSet rs=ps.executeQuery();
            while(rs.next()){
                out.println("Email is already registered!");
            }
            con.close();
        }
        catch(Exception e){
            System.out.println(e);
        }
        }
 
        %>
    </body>
</html>
