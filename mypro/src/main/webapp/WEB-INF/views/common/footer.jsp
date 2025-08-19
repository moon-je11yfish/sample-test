<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"   isELIgnored="false"
 %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>하단 부분</title>
  <style>
    p {
     font-size:20px;
      text-align:center;
    }
  </style>
</head>
<body>
 <footer>
    <c:choose>
          <c:when test="${isLogOn == true  && member!= null}">
          	<br>
            <h3>환영합니다. ${member.name }님!</h3>
          </c:when>
          <c:otherwise>
          	<br>
	        <h3>로그아웃 상태입니다.</h3>
	      </c:otherwise>
	   </c:choose>   
  </footer>

</body>
</html>