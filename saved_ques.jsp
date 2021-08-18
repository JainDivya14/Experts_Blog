<%-- 
    Document   : saved_ques
    Created on : May 16, 2020, 7:21:13 AM
    Author     : Lenovo
--%>

<%@page import="java.sql.*,java.io.*" contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<HTML>
<HEAD>
<link rel="stylesheet" type="text/css" href="Background/style.css">
<TITLE>Experts' Blog - Saved Questions</TITLE>
<link rel = "icon" href ="Background/eb_logo_2.png" type = "image/icon">
</HEAD>
<BODY style="background:#bdffc4;">
    <%
        if(session.getAttribute("type")!="student")
            response.sendRedirect("logout.jsp");
    %>
        <h1><a href="index.jsp"><img src="Background/eb_logo_header.png" height="25%" width="25%"></a> <a href="logout.jsp"><button type="button" class="bt" data-toggle="modal" data-target="">Logout</button></a></h1>
      <h1 style="margin-top: 0px;margin-bottom: 10px;background: lightgreen;color: black; padding: 10px;font-size: 30px;font-weight: bold;">
        <div align="right">
      <table class="subheader"><tr>
      <td><a href="about.jsp">About Us</a></td>
      <td><a href="feedback.jsp">Feedback</a></td>
      </tr></table>
      </div>
</h1>
   <h4 class="list_header" style="background:lightgray;text-align: left;font-size:25px;">Saved Questions</h4> 

        <%
    try{
                                Class.forName("com.mysql.jdbc.Driver");
                                Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/eb","root","");
                                PreparedStatement ps=con.prepareStatement("select qid,qname,DATE_FORMAT(log,'%b %d, %Y') from ques_ans where qid IN (select qid from saved where uid=?) order by log DESC");
                                ps.setString(1,session.getAttribute("id").toString());
                                ResultSet rs=ps.executeQuery();
                                while(rs.next()){
                                    String qid=rs.getString(1);
                                    %>
                                    <hr>
                    <a href="ansview.jsp?qid=<%=qid%>" style="font-size:15px;color: black;text-decoration: none;"><H2><% out.println(rs.getString(2)); %></H2>
                    </a>
                    <p>Posted on <% out.println(rs.getString(3)); %></p>
                                    <%
                                }
                                con.close();
                                }
    catch(Exception e){
    out.println(e);
    }
    
    %>
    <hr>
 <br><br><br><br>
</BODY>
<H2 class="footer">
    <table align="center">
        <tr>
            <td width="350px">
                <a href="ask.jsp" title="Ask a Question">
                    <img src="Background/Icons/ask.png" height="40px" width="40px">
                </a>
            </td>
            <td width="350px">
                <a href="askbyme.jsp" title="Asked Questions">
                    <img src="Background/Icons/iask.png" height="40px" width="40px">
                </a>
            </td>
            <td width="350px">
                <a href="saved_ques.jsp" title="Bookmarks">
                    <img src="Background/Icons/star.png" height="40px" width="40px">  
                </a>
            </td>
			<td width="350px">
                <a href="search_ques.jsp" title="Search">
                    <img src="Background/Icons/search.png" height="40px" width="40px">
					
                </a>
            </td>
            <td width="350px">
                <a href="stu_profile.jsp" title="Profile">
                    <img src="Background/Icons/profile.png" height="40px" width="40px">
                </a>
            </td>
        </tr>
    </table>
</H2>
</HTML>