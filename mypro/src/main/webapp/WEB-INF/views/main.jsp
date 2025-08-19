<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title> 관현악 연습 스케줄 관리 시스템 </title>
         </head>
    
<body onload="openPopup()">
    <script>
   let newWin = window.open("popup.html", "pop", "width=500, height=670");
   let blocked = false;
		function openPopup(){
			
			if (newWin == null){
				alert("팝업이 차단되어 있습니다. 팝업 차단을 해제해주세요.")
			}
		}
        function openCenter(doc, win, width, height){
            let left = (screen.availWidth - width)/2;
            let right = (screen.availHeight - height)/2;
            let opt = `left=${left}, top=${top}, width=${width}, height=${height}`;
            window.open(doc,win,opt);
        }
        openCenter('popup.html', 'pop', 500, 670);
			
  </script>
  <c:if test="${signup == true}">
  		<script type="text/javascript">
  		alert("회원가입이 완료되었습니다.")
  		</script>
  </c:if>
  
<main>
    <img class="img" src="/mypro/resources/images/ochestra.jpg"/>  <hr>
     <strong><h2 class="html"> 연습 계획 </h2></strong>
    <div id="main">
        <div class="card-list"> 
            <div class="card">
        <h3> <a href="${contextPath}/planning.do"> 연습 계획 설정</a> </h3>
        <p> 각자의 연습계획을 설정할 수 있습니다.<br> 연습 날짜나 내용, 시간 등을 정해 계획해봅시다</p>
        <i class="fa-solid fa-calendar-days fa-2x" ></i>
        </div>

        <div class="card">
       <h3> 파트 단체 연습 계획 설정</h3>
        <p> 하나의 파트가 단체로 연습할 계획을 세워봅시다.<br> 합주는 혼자보단 다같이 연습할 때 훨씬 빠르게 늡니다.</p>
        <i class="fa-solid fa-drum fa-2x"></i>
        </div>
       
        <div class="card">
       <h3> 합주 연습 계획</h3>
        <p> 악단에서 관리하는 연습 스케줄입니다.<br>진행될 합주의 일시나 내용, 지난 합주의 연습기록을 살펴볼 수 있습니다.</p>
        <i class="fa-solid fa-music fa-2x"></i>
            </div>

         </div>
</div>

<div id="table-container">
 <table width>
            <caption> 연습 계획 작성 예시</caption>
            <style>
                table, th, td{
                    border: 1px solid #000000;
                    border-collapse: collapse;
                   
                    margin: 10px auto;
                }
                th, td{padding: 10px 20px;}
                
            </style>
        <thead>
            <tr>
                <th class="colored">계획 번호</th>
                <th class="colored">연습 일자</th>
                <th class="colored">연습 내용</th>
                <th class="colored">연습 시간</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <th class="colored">1</th>
                <th>2025-06-05</th>
                <th>대회 준비</th>
                <th>2시간</th>
            </tr>
            <tr>
                <th class="colored">2</th>
                <th>2025-06-12</th>
                <th>개인 악곡 연습</th>
                <th>1시간</th>
            </tr>
            <tr>
                <th class="colored">3</th>
                <th>2025-06-19</th>
                <th>실수 보완</th>
                <th>3시간</th>
            </tr>
        </tbody>
        

        </table>
</div>

    <hr>
    <strong><h2 class="html"> 기록관리 </h2></strong>
     <div class="card-list">
    <div class="card">
        <h3><a href="http://snowhale.dothome.co.kr/inst.html"> 악기 관리</a> </h3>
        <p> 악기는 항상 최상의 컨디션을 유지해야 합니다.<br> 악기 관리 기록을 통해 악기의 상태를 꼼꼼히 점검합시다.</p> </div>

            <div class="card">
       <h3> <a href="http://snowhale.dothome.co.kr/contest.html">대회 기록</a></h3>
        <p> 지난 대회의 참가 이력입니다.<br> 우리가 함께 이뤄낸 성과들을 한 번 돌아봅시다.</p></div>
     </div>

 


    <hr>
    </main> 


 <p><br>협주곡 1번 마장조, 작품번호 8번, RV. 269 "봄"</p>
    <audio src="/mypro/resources/images/spring.mp3" controls />
    
</body>
</html>
