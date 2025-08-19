<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<html>
<head>
 <meta charset="UTF-8">
	<title>Home</title>
<style>
.text-align{text-align:center}
</style>
</head>
<body>
<h1>
	Hello world!  
</h1>

<P>  My Name is ${name }. </P><br>
</body>
</html>
