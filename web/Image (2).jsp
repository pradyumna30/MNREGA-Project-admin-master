<%-- 
    Document   : Image
    Created on : Mar 23, 2013, 5:04:41 PM
    Author     : SAI
--%>
<% 

String jobcardno=(String)session.getAttribute("jobcardno"); 
out.println(jobcardno);
%>
<%@page contentType="text/html" pageEncoding="UTF-8" session="true"%>
<!DOCTYPE html>
<html> 
<head> 
<title>Image insert into database</title> 
</head> 

<body> 
<form name="frm" action="Uploadimage.jsp" enctype="multipart/form-data" method="post"> 
 <input type="file" name="uProperty" /> <br> 

 <input type="submit" name="goUpload" value="Upload" /> 
 </form> 
 <input type="text" name="jobcard" value="<%=jobcardno%>" />
</body> 
</html>
