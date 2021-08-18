<%-- 
    Document   : ansview_exp
    Created on : May 16, 2020, 2:45:44 PM
    Author     : Lenovo
--%>

<%@page import="java.sql.*,java.io.*" contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<HTML>
<HEAD>
<link rel="stylesheet" type="text/css" href="Background/style.css">
<TITLE>Experts' Blog - View Answer</TITLE>
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
    String q="";
    String a="";
    String qid=request.getParameter("qid");
    String askedon="";
    String anson="";
    String ansid="";
    String ansby="";
    String ansres="";
    String like="";
    String dislike="";
    String state="0";
    String expid="";
    int support=0;
    int save=0;
    int total=0;
    try{
                                Class.forName("com.mysql.jdbc.Driver");
                                Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/eb","root","");
                                PreparedStatement ps=con.prepareStatement("select count(*) from ques_support where qid=? and uid!=(select askedby from ques_ans where qid=?)");
                                ps.setString(1,qid);
                                ps.setString(2,qid);
                                ResultSet rs=ps.executeQuery();
                                while(rs.next()){
                                    total=Integer.parseInt(rs.getString(1))+1;
                                }
                                ps=con.prepareStatement("select count(*) from saved where qid=? and uid=?");
                                ps.setString(1, qid);
                                ps.setString(2,session.getAttribute("id").toString());
                                rs=ps.executeQuery();
                                while(rs.next()){
                                    save=Integer.parseInt(rs.getString(1));
                                }
                                ps=con.prepareStatement("select count(*) from ques_support where qid=? and uid=?");
                                ps.setString(1,qid);
                                ps.setString(2, session.getAttribute("id").toString());
                                rs=ps.executeQuery();
                                while(rs.next()){
                                    support=Integer.parseInt(rs.getString(1));
                                }
                               
                                
    }
    catch(Exception e){
    out.println(e);
    }
    try{
                                
                                Class.forName("com.mysql.jdbc.Driver");
                                Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/eb","root","");
                                PreparedStatement ps=con.prepareStatement("select DATE_FORMAT(log,'%M %d, %Y '),qname from ques_ans where qid=?");
                                ps.setString(1, qid);
                                ResultSet rs=ps.executeQuery();
                                while(rs.next()){
                                    askedon=rs.getString(1);
                                    q=rs.getString(2);
                                    %>
  <a href="#" style="font-size:15px;color: black;text-decoration: none;"><H2><% out.println(q); %></H2>
                    </a>
                    <p style="color:gray;">Asked on <% out.println(askedon); %><p>
                    <p style="color:gray;">Asked by <% out.println(total); %>Student<p>
                    <table style="border-collapse: seperate; border-spacing: 25px 0px;">
                        <tr>
                            <td style="background:goldenrod;color:white;font-weight: bold;padding: 12px 12px 12px 12px;border-radius: 25px;">
                                <a href="save_ques_exp.jsp?save=<%=save%>&qid=<%=qid%>"><% out.println((save==1) ? "Saved" : "Save"); %>
                                </a></td>
                        </tr>
                    </table>
                    
                                    <%
                                }
                                int count=0;
                                ps=con.prepareStatement("select * from ans_table where qid=?");
                                ps.setString(1, qid);
                                rs=ps.executeQuery();
                                while(rs.next()){
                                count++;
                                }
                                if(count==0){
                                    %><hr> <p style="font-size: 20px;color: grey;">No Answer till now</p><%
                                }
                                else{
                                ps=con.prepareStatement("select DATE_FORMAT(log,'%M %d, %Y'),ansid,ans,answeredby from ans_table where qid=?");
                                ps.setString(1, qid);
                                rs=ps.executeQuery();
                                while(rs.next()){
                                    ansby=rs.getString(4);
                                    ansid=rs.getString(2);
                                    anson=rs.getString(1);
                                    a=rs.getString(3);
                                    a=a.replace("\n","<br>");
                                
                                }
                                expid=ansby;
                                ps=con.prepareStatement("select username from expert where id=?");
                                ps.setString(1, ansby);
                                rs=ps.executeQuery();
                                while(rs.next()){
                                    ansby=rs.getString(1);
                                }
                                ps=con.prepareStatement("select count(*) from ans_response where ans_id=? and response='like'");
                                ps.setString(1,ansid);
                                rs=ps.executeQuery();
                                while(rs.next()){
                                    like=rs.getString(1);
                                }
                                ps=con.prepareStatement("select count(*) from ans_response where ans_id=? and response='dislike'");
                                ps.setString(1,ansid);
                                rs=ps.executeQuery();
                                while(rs.next()){
                                    dislike=rs.getString(1);
                                }
                                ps=con.prepareStatement("select response from ans_response where ans_id=? and user_id=?");
                                ps.setString(1,ansid);
                                ps.setString(2,session.getAttribute("id").toString());
                                rs=ps.executeQuery();
                                while(rs.next()){
                                    ansres=rs.getString(1);
                                }
                                if(ansres.equals("like")){
                                    state="1";
                                }
                                else if(ansres.equals("dislike")){
                                    state="2";
                                }
                                
                                %><hr>
                                <p style="color:gray;">Answered on <% out.println(anson); %></p>
                                <a href="ansby_profile.jsp?expid=<%=expid%>" style="color:black;">Answered by <% out.println(ansby); %></a>
                                <p style="font-size: 20px;color: black;"><% out.println(a); %></p>
                                <table style="border-collapse: seperate; border-spacing: 25px 0px;">
                                
                                </table>
                                <p style="color:gray;">Upvotes <% out.println(like); %></p>
                                <p style="color:gray;">Downvotes <% out.println(dislike); %></p>

                                <%
                                
                                }
                                con.close();
                                }
    catch(Exception e){
    out.println(e);
    }
    
    %>                  
 <br><br><br><br>  
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
       
</BODY>
</HTML>