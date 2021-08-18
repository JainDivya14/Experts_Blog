<%-- 
    Document   : delete_expert
    Created on : May 14, 2020, 10:14:31 PM
    Author     : Lenovo
--%>


<%@page import="java.sql.*,java.io.*" contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Deleting Expert</title>
    </head>
    <body>
        <%
            String del_id=request.getParameter("del_id");
            out.println(del_id);
            int x=0;
            try{
                PreparedStatement pst;
                Class.forName("com.mysql.jdbc.Driver");
                Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/eb","root","");
                pst=con.prepareStatement("DELETE from expert where id=?");
                pst.setString(1,del_id);
                x=pst.executeUpdate();
                    if(x!=0){
                        %>
                        <script>
                            alert("1 Expert Deleted!");
                            window.location="expert_display.jsp";
                        </script>
                        <%
                }
                else{
                        %>
                        <script>
                            alert("Failed to delete!");
                            window.location("expert_display.jsp");
                        </script>
                        <%
                }
            }
            catch(Exception ee){
            out.println(ee);
            }
        
        %>
    </body>
</html>
