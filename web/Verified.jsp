<%-- 
    Document   : Verified
    Created on : Mar 27, 2013, 3:54:21 PM
    Author     : SAI
--%>
<%@ include file="header.jsp" %> 
<%
    try {

        String verify = request.getParameter("Checkbox");
        String verify2 = request.getParameter("verify2"); // for money verification
        // out.println(verify);
        if (verify != null) {
            java.sql.Connection con;
            Class.forName("com.mysql.jdbc.Driver");
            con = java.sql.DriverManager.getConnection("jdbc:mysql://localhost:3306/mnrega", "root", "prady");

            java.sql.PreparedStatement ps1 = con.prepareStatement("Update Labour Set vcheck=? where jobcardno=?");
            out.println("in labour");
            ps1.setString(1, verify);
            ps1.setString(2, request.getParameter("jobcardno"));

            int i = ps1.executeUpdate();

            if (i > 0) {
                java.sql.PreparedStatement ps2 = con.prepareStatement("insert into workerdetails2 values(?,0,0,0,0)");
                ps2.setString(1, request.getParameter("jobcardno"));
                
                  int j = ps2.executeUpdate();

                out.println("Updated Successfully");
                //response.sendRedirect("Surveyorview.jsp");
            } else {
                out.println("Not verified");

            }
        }

        if (verify2 != null) {

            java.sql.Connection con;
            Class.forName("com.mysql.jdbc.Driver");
            con = java.sql.DriverManager.getConnection("jdbc:mysql://localhost:3306/mnrega", "root", "prady");

            java.sql.PreparedStatement ps1 = con.prepareStatement("Update workerdetails1 Set verifymoneyearned=? where jobcardno=? and Siteworkedat=?");

            ps1.setString(1, verify2);
            ps1.setString(2, request.getParameter("jobcardno"));
            ps1.setString(3, request.getParameter("siteno"));
            int i = ps1.executeUpdate();
            //  out.println("exe update");
            if (i > 0) {
                out.println("Updated Successfully");
                //  out.println("<a href="Surveyorview.jsp"> back </a>");

                //Thread.currentThread().sleep(5000); 
                // response.sendRedirect("Surveyorview.jsp");
            } else {
                out.println("Not verified either already verified or incorret data ");

            }



        }
    } catch (Exception e) {
        out.println(e);

    }
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1><a href="Surveyorview.jsp"> back </a> </h1>
    </body>
</html>
