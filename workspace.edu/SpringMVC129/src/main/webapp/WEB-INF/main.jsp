<!-- WebContent/index.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회사 정보 프로그램</title>
</head>
<body>
    <h1>회사 정보 프로그램</h1>
    <form id="questionForm">
        <label for="question">원하는 정보를 검색하세요:</label>
        <input type="text" id="question" name="question">
        <button type="button" onclick="askQuestion()">정보 요청하기</button>
    </form>
    <div id="result">
    
    </div>
    <div id="error"></div>
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
    <script>
        function askQuestion() {
            var question = $('#question').val();
            var data = { 'question': question };

            $.ajax({
                type: 'POST',
                url: 'http://localhost:5000/ask_question',
                contentType: 'application/json',
                data: JSON.stringify(data),
                success: function (data) {
                    $('#result').text(data.result || data.error);
                    $('#error').text(""); // 성공 시 에러 메시지 초기화
                },
                error: function (xhr, status, error) {
                    console.error('Error:', error);
                    $('#error').text("에러 발생: " + error); // 에러 메시지 표시
                }
            });
        }
    </script>
</body>
</html>