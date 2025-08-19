<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>연습 계획 작성</title>
    <style>
        table, th, td {
            border: 1px solid #000000;
            border-collapse: collapse;
            margin: 10px auto;
        }
        th, td {
            padding: 10px 20px;
            text-align: center;
        }
        caption {
            font-weight: bold;
            margin: 10px;
            font-size: 1.2em;
        }
        input {
            width: 100%;
            box-sizing: border-box;
            padding: 5px;
        }
        .button-area {
            text-align: center;
            margin: 20px;
        }
        button {
            margin: 0 10px;
            padding: 10px 15px;
            font-size: 1em;
        }
            .colored{
        background-color: #fae18f;
    }
    th {
        background-color: #fae18f;
    }
      textarea {
            min-height: 2em;
        }
    </style>
</head>
<body>

    <table id="planTable">
        <caption>연습 계획 작성</caption>
        <thead>
            <tr>
                <th class="colored">계획 번호</th>
                <th class="colored">연습 일자</th>
                <th class="colored">연습 내용</th>
                <th class="colored">연습 시간</th>
            </tr>
        </thead>
        <tbody>
            <!-- 초기 행 예시 -->
            <tr>
                <td>1</td>
                <td><input type="date" value=""></td>
                <td><textarea></textarea></td>
                <td><textarea></textarea></td>
            </tr>
        </tbody>
    </table>

    <div class="button-area">
        <button onclick="addRow()">행 추가</button>
        <button onclick="addColumn()">열 추가</button>
    </div>

    <script>
        let planNumber = 2; // 시작 번호

        function addRow() {
            const table = document.getElementById("planTable").getElementsByTagName("tbody")[0];
            const newRow = table.insertRow();

            // 계획 번호
            const cell0 = newRow.insertCell(0);
            cell0.innerText = planNumber++;

            // 연습 일자
            const cell1 = newRow.insertCell(1);
            const dateInput = document.createElement("input");
            dateInput.type = "date";
            cell1.appendChild(dateInput);

            // 연습 내용
            const cell2 = newRow.insertCell(2);
            const contentInput = document.createElement("textarea");
            contentInput.type = "text";
            cell2.appendChild(contentInput);

            // 연습 시간
            const cell3 = newRow.insertCell(3);
            const timeInput = document.createElement("textarea");
            timeInput.type = "text";
            cell3.appendChild(timeInput);

            const totalCols = document.getElementById("planTable").tHead.rows[0].cells.length;
            // 현재 열 수 - 4(기본) = 추가된 열 수
             const extraCols = totalCols - 4;

               for (let i = 0; i < extraCols; i++) {
             const extraCell = newRow.insertCell();
             const extraTextarea = document.createElement("textarea");
             extraCell.appendChild(extraTextarea);
            }
        }

        function addColumn() {
            const table = document.getElementById("planTable");
            const headerRow = table.tHead.rows[0];
            const colName = prompt("추가할 열 이름을 입력하세요:");
            if (!colName) return;

            // 헤더에 열 추가
            const newHeader = document.createElement("th");
            newHeader.innerText = colName;
            headerRow.appendChild(newHeader);

            // 각 행에 textarea 셀 추가
            const tbodyRows = table.tBodies[0].rows;
            for (let i = 0; i < tbodyRows.length; i++) {
                const newCell = tbodyRows[i].insertCell();
                const newTextarea = document.createElement("textarea");
                newCell.appendChild(newTextarea);
            }
        }
    </script>

</body>
</html>
