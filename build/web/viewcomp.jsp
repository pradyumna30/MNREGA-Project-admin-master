<%-- 
    Document   : viewcomp
    Created on : 31-Mar-2013, 20:20:43
    Author     : Ruchir
--%>
<%@ include file="header.jsp" %> 
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View Complain</title>
    </head>
    <body>
        <h1>Complain Details</h1>
        <%String cid=request.getParameter("Comp");
        String email="",cname="";
        %>
        <form name=myname method=post action="chngstat.jsp">
        <TABLE BORDER="1">
            <TR>
                <TH>Complain Id</TH>
                <TH>Name</TH>
                <TH>Email-ID</TH>
                <TH>Time of Complain</TH>
                <TH>Status</TH>
                <TH>Message</TH>
            </TR>
       <h2>Complain Holder Details</h2>
            <%try
            {
                out.println("cid:"+cid);
                Connection conn = null;
                Class.forName("com.mysql.jdbc.Driver").newInstance();
                conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/mnrega","root","prady");
                ResultSet rs = null;
                Statement st=null;
                st=conn.createStatement();
                String sql="select * from complain where compid='"+cid+"'";
                rs = st.executeQuery(sql);
               
                if(!rs.next())
                {
                    %>
                    <h2>Invalid Complain ID</h2>
                    <a href="compheader.jsp">Click here to Continue</a>
                <%
                               }
                               else{
               // while(rs.next()){
              
                 //out.println("In while loop");
                 %>
                    
                   
             <TR>
                <TD> <%= rs.getString(1) %></td>
                <TD> <%= rs.getString(2) %></TD>
                <TD> <%= rs.getString(3) %></TD>
                <TD> <%= rs.getString(6) %></TD>
                <TD> <%= rs.getString(4) %></TD>
                <TD> <%= rs.getString(5) %></TD>
                
            </TR>
                
                <%
               email=rs.getString(3);
                 cname= rs.getString(2);
                
                             }  
            
                                 //}  
                
    }catch(SQLException e){ System.out.println(e.getMessage()); } %>
    
    <input type="hidden" name="email" value="<%=email%>" />
    <input type="hidden" name="name" value="<%=cname%>" />
    <input type="hidden" name="compid" value="<%=cid%>" />
    <h3>ACT ON COMPLAIN</h3>
    <p>Select the New Status of this complain</p>
    
    <input type="submit" name="In-Process" value="In-Process"/>
   </form>
    
    <form action="solvcomp.jsp" method="get">
        <input type="submit" name="Solved" value="Solved"/>
    <input type="hidden" name="email" value="<%=email%>" />
    <input type="hidden" name="name" value="<%=cname%>" />
    <input type="hidden" name="compid" value="<%=cid%>" />
    <a href="compheader.jsp">Go Back</a>
        
    </form>
    
    </body>
</html>
