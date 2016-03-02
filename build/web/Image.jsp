<%-- 
    Document   : Image
    Created on : Mar 23, 2013, 5:04:41 PM
    Author     : SAI
--%>
<%@ include file="header.jsp" %> 
<% 

String adhar=(String)session.getAttribute("adhar"); 
//out.println(adhar);
%>
<%@page contentType="text/html" pageEncoding="UTF-8" session="true"%>
<!DOCTYPE html>
<html> 
<head> 
<title>Image insert into database</title> 
</head> 

<body> 
<div align="center">
    <form name="frm" action="Uploadimage.jsp" enctype="multipart/form-data" method="post"> 
 <input type="file" name="uProperty" /> <br> 

 <input type="submit" name="goUpload" value="Upload" /> 
 </form> 
 <input type="hidden" name="adhar" value="<%=adhar%>" />
</div>
</body> 
</html>
