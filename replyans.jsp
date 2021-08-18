<%-- 
    Document   : replyans
    Created on : May 16, 2020, 9:55:20 AM
    Author     : Lenovo
--%>

<%@page import="java.sql.*,java.io.*" contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<HTML>
<HEAD>
<link rel="stylesheet" type="text/css" href="Background/style.css">
<script src="Scripts/validate.js"></script>
<TITLE>Experts' Blog - Reply Question</TITLE>
<link rel = "icon" href ="Background/eb_logo_2.png" type = "image/icon">
</HEAD>
<BODY style="background:#bdffc4;">
    <%
        if(session.getAttribute("type")!="expert")
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
    
    <%
        String ques="";
        String qid=request.getParameter("qid");
        try{
            Class.forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/eb","root","");
            PreparedStatement ps=con.prepareStatement("select qname from ques_ans where qid=?");
            ps.setString(1,qid);
            ResultSet rs=ps.executeQuery();
            while(rs.next()){
            ques=rs.getString(1);
            }
        }
        catch(Exception e){
            out.println(e);
        }
    
    %>
    
    <div align="center">
        <form name ="f2" style="background: white" method="post" id="f2" action="ans_process.jsp?qid=<%=qid%>" onsubmit="return ValidateAnswer()">
        <table style="width:100%;text-align: center;" align="center">
            <h2 align="center" style="background: lightgreen;font-size: 40px;padding: 10px;margin-top: 0px;">Reply Question</h2>
            <h2 align="center" style="font-size: 30px;"><% out.println(ques); %></h2>
            
            <tr><td><label style="font-size: 20px;">Answer<br></label>
                    <div class="input-group-box"><pre><textarea style="height: 300px;width:1200px;font-size: 20px;" name="answer" id="answer" placeholder="Type Your answer Here"></textarea></pre></div></td>
                  </tr>         
            </table>
            <table align="center">
                    <tr>
                    <td><input class="bt" type="submit" value="Answer" id="sub"></td>
                    <td></td>
                    <td><input class="bt" style="background:indianred;" type="reset"></td>
                    </tr>
            </table>
                    
        </form>
            <br><br><br><br>
        </div>
</BODY>
<H2 class="footer">
    <table align="center">
        <tr>
            <td width="350px">
                <a href="expert_index.jsp" title="Questions for you">
                    <img src="Background/Icons/ask.png" height="40px" width="40px">
                </a>
            </td>
            <td width="350px">
                <a href="exp_ques_list.jsp" title="All Questions">
                    <img src="Background/Icons/question_answer.png" height="40px" width="50px">
                </a>
            </td>
            <td width="350px">
                <a href="saved_ques_exp.jsp" title="Saved Questions">
                    <img src="Background/Icons/star.png" height="40px" width="40px">  
                </a>
            </td>
            <td width="350px">
                <a href="exp_ans_list.jsp" title="Your Answers">
                    <img src="Background/Icons/notepad.png" height="40px" width="40px">
					
                </a>
            </td>
            <td width="350px">
                <a href="exp_profile.jsp" title="Profile">
                    <img src="Background/Icons/profile.png" height="40px" width="40px">
                </a>
            </td>
        </tr>
    </table>
</H2>
</HTML>