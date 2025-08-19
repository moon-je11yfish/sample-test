<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>공지사항</title>
  <!-- <link rel="stylesheet" href="mypro/resources/css/notice.css"> -->
  <style>
    * {  /* 전체 선택자 */
  box-sizing: border-box;
}
body{  /* 문서 본문에 대한 스타일 */
  display:flex;  /* 플렉스 컨테이너 */ 
  justify-content: center;  /* 주축(수평) 정렬 */
  align-items: center;    /* 교차축(수직) 정렬 */
  margin:0;    /* 마진 */  
  min-height: 100vh;  /* 최소 높이 */
}
#container_notice{   /* 컨테이너 스타일 */
  width:500px;   /* 너비 */
  height:750px;   /* 높이 */
  padding:100px 50px;  /* 패딩 */
  border:1px solid black;   /* 테두리 */
  justify-content: center;
                    align-items: center;
                    margin:auto;
  background:url('resources/images/notice.jpg') no-repeat left top;  /* 배경 이미지 */
  background-size:auto 100%;  /* 배경 이미지 크기 */
}
    ol {
      padding-left: 20px;
    }
    ol li {
      margin-bottom: 10px;
      line-height: 1.4;
    }
    button {
      margin-left: 10px;
      cursor: pointer;
      font-size: 0.9em;
    }
    #newItemInput {
      width: 100%;
      padding: 8px;
      font-size: 1em;
      margin-bottom: 10px;
      box-sizing: border-box;
    }
    #controls {
      margin-top: 20px;
      text-align: right;
    }
    a {
      text-align: center;

    }
 
  </style>
</head>
<body>
  <div id="container_notice">
    <h1>공지사항</h1>
    <ol id="noticeList">
      <li>
        스스로 정한 연습 계획을 꾸준히 지켜 높은 성취와 대회에서의 활약을 목표합시다.
        <button onclick="deleteItem(this)">삭제</button>
      </li>
      <li>
        정해진 합주 연습 일에는 특별한 사정 없이 무단으로 결석하는 일은 없도록 합시다.
        <button onclick="deleteItem(this)">삭제</button>
      </li>
    </ol>

    <div id="controls">
      <input type="text" name="text" id="newItemInput" placeholder="새 공지사항을 입력하세요">
      <button onclick="addItem()">추가</button>
    </div>
  </div>
  <script>
    function addItem() {
      const input = document.getElementById("newItemInput");
      const text = input.value.trim();
      if (text === "") {
        alert("내용을 입력해주세요.");
        return;
      }
		
      const li = document.createElement("li");
      li.innerHTML = `${"$"}{text} <button onclick="deleteItem(this)">삭제</button>`;

      document.getElementById("noticeList").appendChild(li);
      input.value = "";
    }

    function deleteItem(button) {
      const li = button.parentElement;
      li.remove();
    }
   
  </script>
</body>
</html>
