<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>Websocket ChatRoom</title>
    <!-- Required meta tags -->
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">

    <!-- Bootstrap CSS -->
    <style>
       
    </style>
</head>
<body>
<div class="container" id="app">
    <div>
        <h2 id="roomName"></h2>
    </div>
    <div class="input-group">
        <div class="input-group-prepend">
            <label class="input-group-text">내용</label>
        </div>
        <input type="text" class="form-control" id="messageInput">
        <div class="input-group-append">
            <button class="btn btn-primary" type="button" id="sendMessageBtn">보내기</button>
        </div>
    </div>
    <ul class="list-group" id="messageList">
        <!-- Messages will be populated here -->
    </ul>
    <div></div>
</div>
<!-- JavaScript -->
<!-- 
<script src="https://cdn.jsdelivr.net/npm/sockjs-client@1.5.1/dist/sockjs.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/stompjs@2.3.3/dist/stomp.min.js"></script> -->

<script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.4.0/sockjs.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>

<script>
    document.addEventListener('DOMContentLoaded', function () {
        // Find elements
        const roomNameEl = document.getElementById('roomName');
        const messageInput = document.getElementById('messageInput');
        const sendMessageBtn = document.getElementById('sendMessageBtn');
        const messageList = document.getElementById('messageList');

        // WebSocket & STOMP initialization
        let sock = new SockJS("/ws-stomp");
        let ws = Stomp.over(sock);
        let reconnect = 0;

        // Vue.js
        let roomId = localStorage.getItem('wschat.roomId');
        let sender = localStorage.getItem('wschat.sender');

        // Methods
        function findRoom() {
            fetch("/chat/room/" + roomId,{
                method:"GET"
            }).then(response=>response.json())
            .then(response => {
                roomNameEl.innerText = response.data.name;
            });
        }

        function sendMessage() {
            const message = messageInput.value.trim();
            if (message === '') {
                alert("내용을 입력해 주세요.");
                return;
            }
            ws.send("/pub/chat/message", {}, JSON.stringify({ type: 'TALK', roomId: roomId, sender: sender, message: message }));
            messageInput.value = '';
        }

        function recvMessage(recv) {
            const li = document.createElement('li');
            li.className = 'list-group-item';
            li.innerText = recv.sender + ' - ' + recv.message;
            messageList.insertBefore(li, messageList.firstChild);
        }

        function connect() {
            // Pub/Sub event
            ws.connect({}, function (frame) {
                ws.subscribe("/sub/chat/room/" + roomId, function (message) {
                    const recv = JSON.parse(message.body);
                    recvMessage(recv);
                });
                ws.send("/pub/chat/message", {}, JSON.stringify({ type: 'ENTER', roomId: roomId, sender: sender }));
            }, function (error) {
                if (reconnect++ <= 5) {
                    setTimeout(function () {
                        console.log("connection reconnect");
                        sock = new SockJS("/ws-stomp");
                        ws = Stomp.over(sock);
                        connect();
                    }, 10 * 1000);
                }
            });
        }
        connect();

        // Attach event listeners
        sendMessageBtn.addEventListener('click', sendMessage);

        // Initial load
        findRoom();
    });
</script>
</body>
</html>
