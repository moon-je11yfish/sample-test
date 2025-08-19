<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
  request.setCharacterEncoding("UTF-8");
%> 
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />

<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
<title>헤더</title>
 <link rel="stylesheet" href="/resources/css/structure.css">
<style>


* {
  margin:0;   /* 마진 리셋 */
  padding:0;   /* 패딩 리셋 */
  box-sizing: border-box;   /* 박스 영역은 테두리까지 */ 
}
a {
  text-decoration:none;  /* 텍스트 링크 밑줄 없애기 */ 
}
ul {
  list-style: none;
}
          #header{
  width:100%;    /*  너비 */
  height:100px;   /* 높이 */ 
  background-color:#045;  
  
}

/* 로고 */
#logo{ 
  float:left;   /* 왼쪽으로 플로팅 */ 
  width:495px;   /*  너비 */ 
  height:100px;   /* 높이 */
  line-height:100px;  /* 세로로 중간에 맞춤 - 줄간격을 높이 값과 같게 */
  padding-left:5px;  /* 왼쪽에 여백 */
}
#logo h1 {
  font-family:'Merienda', cursive;
  font-weight:700;
  font-size:30px;   /* 글자 크기 */
  color:#fff;   /* 글자 색*/
  text-shadow:0 -1px 0 #222;  /* 그림자 색 */
}

/* 내비게이션 */
nav{  
  float:right;   /* 오른쪽으로 플로팅 */
  width:700px;   /*   너비 */  
  height:100px;   /* 메뉴 영역 높이 */  
  padding-top:40px;  /* 메뉴를 아래로 내리기 위해 */  
}
#topMenu {  
  height:60px; 
}
#topMenu > li {
  float:left;  /* 메뉴 항목을 왼쪽으로 플로팅 */ 
  position: relative;  
}
#topMenu > li > a{
  display:block;  /* 링크 텍스트는 블록으로 */ 
  font-size:1.1em;
  color:#fff;  /* 글자 색 */
  font-weight:600;  /* 글자 굵기 */
  padding:20px 60px;  /* 패딩 */ 
}
#topMenu > li > a:hover {
  color:#1fa8f8;
  text-shadow:0 -2px #222;
}
  </style> 
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css" integrity="sha512-Evv84Mr4kqVGRNSgIGL/F/aIDqQb7xQ2vcrdIwxfjThSH8CSR7PBEakCr51Ck+w+/U6swU2Im1vVX0SVk9ABhg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    
</head>
<body>

			<div id="logo">
		<a href="${contextPath}/main.do">
		      
		       
		    <h1> ○○ 악단 스케줄 관리 시스템</h1></a>
		    </div>
		

       <nav>
        <ul id="topMenu">
        <li>
          <c:choose>
         		<c:when test="${isLogOn == true  && member!= null}">
            		<a href="${contextPath}/logout.do"><h3>로그아웃</h3></a>
          		</c:when>
          	<c:otherwise>
	        	<a href="${contextPath}/loginForm.do"><h3>로그인</h3></a>
	      	</c:otherwise>
	   </c:choose>   
	   </li>
            <li><a href="${contextPath}/signup.do">회원가입</a></li>
            <li><a href="${contextPath}/notice.do">공지사항</a></li>
        </ul>
    </nav>


</body>
</html>