<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>모집 공고</title>   
  <style>
    @import url('https://fonts.googleapis.com/css2?family=Dancing+Script:wght@400..700&family=Do+Hyeon&family=Jua&display=swap');
    .container {
      border : 10px double rgb(241, 240, 156);
      border-radius:10px;
      padding:10px;
    }
    ul {
      margin-left:15px;
      list-style-type:none;
    }
    ul li {
      margin : 10px 5px;
    }
    button{ 
      position:auto;
      bottom:20px;
      right:20px;
      
    }
    .subtitle{
        font-size: large;
        color: rgb(247, 169, 52);
        font-family: "Jua", sans-serif;
        font-weight: 400;
        font-style: normal;
    }
    img{
        width: 450px;
        height: 300px;
    }
  </style>     
</head>
<body>
    <script>
    function closeWin(){
    window.close();
    }

    function fn_move(){
      // 내가 원하는 사이트로 이동 예) days.html
      window.opener.location.href = "http:/localhost:8090/mypro/loginForm.do";
      closeWin();
    }
  </script>
  <!-- Do it! '닫기' 버튼에 close() 메서드 연결하기 -->
  <div class="container">
    <h1>윈드 오케스트라 단원 모집</h1>
    <ul>
      <li><span class="subtitle"> 모집대상:</span> 금관, 목관, 타악기</li>
      <li><span class="subtitle">목관악기:</span> 피콜로, 플루트, 오보에, 클라리넷, 바순</li>
      <li><span class="subtitle">금관악기:</span> 트럼펫, 트럼본, 호른, 튜바</li>
      <li><span class="subtitle">타악기:</span> 마림바, 팀파니 외</li>
      <li><span class="subtitle">주요활동:</span> 정기 연주회, 각종 초청 공연, 연주봉사 등</li>
    </ul>    
    <img src="/mypro/resources/images/chunsik.jpg">
    <button onclick="fn_move()" style="cursor: pointer;">로그인하고 신청</button>
    <button onclick="javascript: window.close();">닫기</button>
  </div>
</body>
</html>
