<%-- 
    Document   : ophome
    Created on : 14-Feb-2013, 15:18:51
    Author     : Ruchir
--%>
<%@ include file="header.jsp" %> 
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>OPERATOR HOME</title>
    </head>
    <body>
        <h1>Hello OPERATOR</h1>
          <form id="form1"  name="form1" method="post" action="addlab">
            <label>
                <input type="submit" name="ADD"  value="ADD" />
            </label>
          </form>
        <form action="verifylab" name="form2" method="post">
            <label>
                <input type="submit" name="VERIFY"  value="VERIFY" />
            </label>
          </form>
        
        <form action="viewlab" name="form3" method="post">
            <label>
                <input type="submit" name="VIEW"  value="VIEW" />
            </label>
          </form>
       ID: <%=session.getAttribute("theName")%>
        <a href="allot1.jsp">Allocate Work</a>
        <a href="workalot.jsp">Demand Work</a>
        <a href="checkissue.jsp">Check Issues</a>
        <a href="wrkerhist.jsp">View Employment History</a>
    <%@ include file="logout.jsp" %>
        
    </body>
</html>
