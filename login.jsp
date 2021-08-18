<%-- 
    Document   : login
    Created on : May 5, 2020, 10:15:11 AM
    Author     : Akash
--%>



<%@page import="java.sql.*" contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h2>
            <%
                String u=request.getParameter("username");
                String p=request.getParameter("password");
                int c=0;
            try{                    
            Class.forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/eb","root","");
            Statement stmt=con.createStatement();
            ResultSet rs;
            char type=u.charAt(0);
            if(type=='1')
                rs=stmt.executeQuery("select * from admin");
            else if(type=='3')
                rs=stmt.executeQuery("select * from expert");
            else
                rs=stmt.executeQuery("select * from student");
            while(rs.next()){
            if(u.equals(rs.getString(1)) && p.equals(rs.getString(3)))
               c++;
        }
            if(c>0){
                if(type=='1'){
                    out.println("Redirecting to Admin Homepage!");
                    session.setAttribute("id",u);
                    session.setAttribute("type","admin");
                    response.sendRedirect("admin_index.jsp");
                }
                else if(type=='3'){
                    out.println("Redirecting to Expert Homepage!");
                    session.setAttribute("id",u);
                    session.setAttribute("type","expert");
                    response.sendRedirect("expert_index.jsp");
                }
                else{
                    out.println("Redirecting to Student Homepage!");
                    session.setAttribute("id",u);
                    session.setAttribute("type","student");
                    response.sendRedirect("student_index.jsp");
                }
            }
            else{
                %>
                <script>
                alert("Invalid Login Credentials!");
                window.location= "index.jsp";
                </script>
              
                <%
            //  response.sendRedirect("index.jsp");
            }
            con.close();
            }
        catch(Exception e){
           out.println(e);
        }
            %>
        </h2>
    </body>
</html>
