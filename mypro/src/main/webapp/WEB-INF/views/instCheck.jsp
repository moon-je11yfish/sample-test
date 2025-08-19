<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>악기 관리 기록</title>
  <style>
    body {
      font-family: 'Arial', sans-serif;
      margin: 40px;
      background-color: #f4f6f8;
    }

    h1 {
      text-align: center;
      margin-bottom: 30px;
    }

    form {
      background: #fff;
      padding: 20px;
      border-radius: 8px;
      box-shadow: 0 2px 10px rgba(0,0,0,0.1);
      max-width: 700px;
      margin: 0 auto 40px auto;
    }

    label {
      font-weight: bold;
      margin-top: 15px;
      display: block;
    }

    input[type="date"], textarea {
      width: 100%;
      padding: 8px;
      margin-bottom: 20px;
      border-radius: 4px;
      border: 1px solid #ccc;
    }

    button {
      padding: 10px 20px;
      background-color: #4CAF50;
      color: white;
      border: none;
      border-radius: 6px;
      cursor: pointer;
    }

    button:hover {
      background-color: #45a049;
    }

    table {
      width: 100%;
      border-collapse: collapse;
      margin-top: 30px;
    }

    th, td {
      border: 1px solid #ccc;
      padding: 12px;
      text-align: center;
    }

    th {
      background-color: #eee;
    }

    .check-table {
      width: 100%;
      border-collapse: collapse;
      margin-bottom: 20px;
      background-color: #fff;
    }

    .check-table th, .check-table td {
      border: 1px solid #ccc;
      padding: 10px;
      text-align: center;
    }

    .check-table th {
      background-color: #f0f0f0;
    }
  </style>
</head>
<body>

  <h1>악기 관리 기록</h1>

  <form id="recordForm">
    <label for="date">기록 작성 날짜:</label>
    <input type="date" id="date" required>

    <table class="check-table">
      <thead>
        <tr>
          <th>항목</th>
          <th>양호</th>
          <th>문제 있음</th>
          <th>점검 미실시</th>
        </tr>
      </thead>
      <tbody>
        <tr>
          <td>악기조율</td>
          <td><input type="radio" name="tuning" value="양호" required></td>
          <td><input type="radio" name="tuning" value="문제 있음"></td>
          <td><input type="radio" name="tuning" value="점검 미실시"></td>
        </tr>
        <tr>
          <td>악기청소</td>
          <td><input type="radio" name="cleaning" value="양호" required></td>
          <td><input type="radio" name="cleaning" value="문제 있음"></td>
          <td><input type="radio" name="cleaning" value="점검 미실시"></td>
        </tr>
        <tr>
          <td>리드확인</td>
          <td><input type="radio" name="reed" value="양호" required></td>
          <td><input type="radio" name="reed" value="문제 있음"></td>
          <td><input type="radio" name="reed" value="점검 미실시"></td>
        </tr>
        <tr>
          <td>요철상태점검</td>
          <td><input type="radio" name="damage" value="양호" required></td>
          <td><input type="radio" name="damage" value="문제 있음"></td>
          <td><input type="radio" name="damage" value="점검 미실시"></td>
        </tr>
      </tbody>
    </table>

    <label for="notes">비고:</label>
    <textarea id="notes" rows="3" placeholder="기타 문제사항 등을 입력하세요."></textarea>

    <button type="submit">저장</button>
  </form>

  <table id="recordTable">
    <thead>
      <tr>
        <th>날짜</th>
        <th>악기조율</th>
        <th>악기청소</th>
        <th>리드확인</th>
        <th>요철점검</th>
        <th>비고</th>
      </tr>
    </thead>
    <tbody>
    </tbody>
  </table>

  <script>
    const form = document.getElementById('recordForm');
    const tableBody = document.querySelector('#recordTable tbody');

    form.addEventListener('submit', function (e) {
      e.preventDefault();

      const date = document.getElementById('date').value;
      const tuning = form.elements['tuning'].value;
      const cleaning = form.elements['cleaning'].value;
      const reed = form.elements['reed'].value;
      const damage = form.elements['damage'].value;
      const notes = document.getElementById('notes').value;

      const row = document.createElement('tr');
      row.innerHTML = `
        <td>${date}</td>
        <td>${tuning}</td>
        <td>${cleaning}</td>
        <td>${reed}</td>
        <td>${damage}</td>
        <td>${notes}</td>
      `;

      tableBody.appendChild(row);
      form.reset();
    });
  </script>

</body>
</html>
