<%-- 
    Document   : Surveyorverify
    Created on : Mar 27, 2013, 3:12:57 PM
    Author     : SAI
--%>
<%@ include file="header.jsp" %> 
<%

    String s = request.getParameter("jobcardno");                   //String e=    (String)session.getAttribute("mail");
    //out.println(s);
     if(s=="")
               {
                response.sendRedirect("Surveyorview.jsp");
    
                }
    Class.forName("com.mysql.jdbc.Driver");
    java.sql.Connection con;
    con = java.sql.DriverManager.getConnection("jdbc:mysql://localhost:3306/mnrega", "root", "prady");

    java.sql.PreparedStatement ps = con.prepareStatement("select * from labour where jobcardno= ? and vcheck='no' ");
    ps.setString(1, s);

    java.sql.ResultSet r1 = ps.executeQuery();
    if (r1.next() == false) {
        out.println("Data Not Available Or Data Already verified");
        //out.println("<a href="Surveyorview.jsp"> back</a>");
    }
    r1.beforeFirst();
    //String name= r1.getString(2);
                  /*
     * if(s==) { out.println("No data Available"); }
     */
    //out.println("<html><body> <table border=0 align=center><thead>");
    //out.println(" <tr> <th>blog no</th> <th>problem</th><th>date</th> <th>user</th></thead>");
    //  while(rs.next()){

    //out.println(" <tr>                                       <td>"+rs.getInt(1) +"</td> <td>"+rs.getString(2) +"</td> <td>"+rs.getString(3) +"</td><td>"+rs.getInt(4) +"</td><td> </td></tr>");

    //out.println(" </table> </body></html>");


    // String image= "images/"+s+".jpg";
    //out.println(image);
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="Verified.jsp" method="get" name="form1">
            <% while (r1.next()) {%>

            <input type="hidden" name="jobcardno" id="jobcardno" value="<%=r1.getString(7)%>" />
            <table width="553" border="1" align="center">
                <tr>
                    <td width="63">Adhar number</td>
                    <td width="59">labour name</td>
                    <td width="77">labour date of birth</td>
                    <td width="45">gender </td>
                    <td width="36">city </td>
                    <td width="62">Date of applied</td>
                    <td width="72">jobcard numbe</td>
                    <td width="105"> Validity Check</td>
                     <td width="105"> Verify</td>
                </tr>
                <tr>
                    <td><%=r1.getInt(1)%></td>
                    <td><%=r1.getString(2)%></td>
                    <td><%=r1.getString(3)%></td>
                    <td><%=r1.getString(4)%></td>
                    <td><%=r1.getString(5)%></td>
                    <td><%=r1.getString(6)%></td>
                    <td><%=r1.getString(7)%></td>
                    <td><p><%=r1.getString(8)%>        <td><label>
                                <input type="checkbox" name="Checkbox" value="verified" id="CheckboxGroup1_0" />
                               </label> </td>
                           
                        </p></td>
                </tr>
            </table> 
            <p>
                <input type="submit" name="Submit" id="Submit" value="Submit" align="center"/>
            </p>
            <p>&nbsp;</p>  <%}%>
        </form>
        <a href="Surveyorview.jsp"> back</a>
    </body>
</html>
