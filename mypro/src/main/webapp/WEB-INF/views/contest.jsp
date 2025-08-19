<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>��ȸ ���</title>
  <style>
    h1, p {
      text-align: center;
    }

    .container {
      display: flex;
      flex-wrap: wrap;
      justify-content: space-around;
      gap: 10px;
      max-width: 1000px;
      margin: 0 auto;
    }

    .pic {
      flex-basis: 32%;
      border: 1px solid #ccc;
      padding: 10px;
      border-radius: 8px;
      background-color: #f9f9f9;
      position: relative;
    }

    .pic img {
      width: 100%;
      height: auto;
      display: block;
    }

    .delete-btn {
      position: absolute;
      top: 8px;
      right: 8px;
      background-color: #f44336;
      color: white;
      border: none;
      border-radius: 4px;
      padding: 5px 8px;
      cursor: pointer;
      font-size: 0.8em;
    }

    @media (min-width: 769px) and (max-width: 1024px) {
      .pic {
        flex-basis: 49%;
      }
    }

    @media (max-width: 768px) {
      .pic {
        flex-basis: 100%;
      }
    }

    .form-container {
      text-align: center;
      margin: 30px auto;
    }

    input[type="file"], input[type="text"] {
      margin: 5px;
      padding: 6px;
      font-size: 1em;
    }

    button {
      padding: 6px 12px;
      font-size: 1em;
      cursor: pointer;
    }
  </style>
</head>
<body>

  <h1>��ȸ ���</h1>

  <!-- �̹��� �߰� �� -->
  <div class="form-container">
    <input type="file" id="imageInput" accept="image/*">
    <input type="text" id="descInput" placeholder="�̹��� ������ �Է��ϼ���">
    <button onclick="addImage()">�߰�</button>
  </div>

  <!-- �̹��� ��� -->
  <div class="container" id="imageContainer">
    <!-- ���� �̹��� ���� -->
    <div class="pic">
      <img src="images/image2.jpg" alt="��ȸ ��� ����">
      <p>20OO�� O�� O�� OO ��ȸ</p>
      <button class="delete-btn" onclick="deleteImage(this)">����</button>
    </div>
    <div class="pic">
      <img src="images/image1.jpg" alt="��ȸ ��� ����">
      <p>20OO�� O�� O�� ���� ���</p>
      <button class="delete-btn" onclick="deleteImage(this)">����</button>
    </div>
    <div class="pic">
      <img src="images/image3.jpg" alt="��ȸ ��� ����">
      <p>20OO�� O�� O�� ����</p>
      <button class="delete-btn" onclick="deleteImage(this)">����</button>
    </div>
  </div>

  <script>
    function addImage() {
      const imageInput = document.getElementById('imageInput');
      const descInput = document.getElementById('descInput');
      const container = document.getElementById('imageContainer');

      const file = imageInput.files[0];
      const desc = descInput.value.trim();

      if (!file) {
        alert("�̹����� �������ּ���.");
        return;
      }

      const reader = new FileReader();

      reader.onload = function(e) {
        const div = document.createElement("div");
        div.className = "pic";

        div.innerHTML = `
          <img src="${e.target.result}" alt="����� �̹���">
          <p>${desc || "���� ����"}</p>
          <button class="delete-btn" onclick="deleteImage(this)">����</button>
        `;

        container.appendChild(div);
        imageInput.value = "";
        descInput.value = "";
      };

      reader.readAsDataURL(file);
    }

    function deleteImage(button) {
      const picDiv = button.parentElement;
      picDiv.remove();
    }
  </script>
</body>
</html>
