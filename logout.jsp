<%-- 
    Document   : logout.jsp
    Created on : May 11, 2020, 4:48:51 PM
    Author     : Lenovo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Logging Out</title>
    </head>
    <body>
        <%
            session.invalidate();
            response.sendRedirect("index.jsp");
        %>
    </body>
</html>
