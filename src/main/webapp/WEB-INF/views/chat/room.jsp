<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>Websocket Chat</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <!-- CSS -->
    <style>
        
    </style>
</head>
<body>
<div class="container" id="app">
    <div class="row">
        <div class="col-md-12">
            <h3>채팅방 리스트</h3>
        </div>
    </div>
    <div class="input-group">
        <div class="input-group-prepend">
            <label class="input-group-text">방제목</label>
        </div>
        <input type="text" class="form-control" id="room_name">
        <div class="input-group-append">
            <button class="btn btn-primary" type="button" id="createRoomBtn">채팅방 개설</button>
        </div>
    </div>
    <ul class="list-group" id="chatroomsList">
        <!-- Chatrooms will be populated here -->
    </ul>
</div>
<!-- JavaScript -->
<script>
    document.addEventListener('DOMContentLoaded', function () {
        // Find elements
        const roomNameInput = document.getElementById('room_name');
        const createRoomBtn = document.getElementById('createRoomBtn');
        const chatroomsList = document.getElementById('chatroomsList');

        // Define methods
        function findAllRoom() {
            fetch("/chat/rooms",{
                method:"GET"
            }).then(response=>response.json())
            .then(response => {
                console.log("res==",response);
                chatroomsList.innerHTML = ''; // Clear previous chatrooms
                response.forEach(item => {

                    const jsonString = item.name;
                    const startIndex = jsonString.indexOf("\"") + 8; // "의 다음 인덱스
                    const endIndex = jsonString.lastIndexOf("\""); // 마지막 " 인덱스

                    const real_name = jsonString.substring(startIndex, endIndex);
                    console.log("name === ", real_name);
                    console.log("item == ",item);
                    const li = document.createElement('li');
                    li.className = 'list-group-item list-group-item-action';
                    li.setAttribute('data-roomId', item.roomId);
                    li.innerText = real_name;
                    li.addEventListener('click', function () {
                        enterRoom(item.roomId);
                    });
                    chatroomsList.appendChild(li);
                });
            });
        }

        function createRoom() {
            const roomName = roomNameInput.value.trim();
            console.log("roomname=",roomName);
            if (roomName === '') {
                alert("방 제목을 입력해 주십시요.");
                return;
            }
            fetch("/chat/room",{
                    method : "POST",
                    headers: {
                        "Content-Type": "application/json",
                      },
                    body : JSON.stringify({
                       name : roomName
                    })
            }).then(response=>response.json())
            .then(response => {
                    alert(response.data.name + "방 개설에 성공하였습니다.");
                    roomNameInput.value = '';
                    findAllRoom();
                })
                .catch(error => {
                    alert("채팅방 개설에 실패하였습니다.");
                });
        }

        function enterRoom(roomId) {
            const sender = prompt('대화명을 입력해 주세요.');
            if (sender !== null && sender.trim() !== "") {
                localStorage.setItem('wschat.sender', sender.trim());
                localStorage.setItem('wschat.roomId', roomId);
                location.href = "/chat/room/enter/" + roomId;
            }
        }

        // Attach event listeners
        createRoomBtn.addEventListener('click', createRoom);

        // Initial load
        findAllRoom();
    });
</script>
</body>
</html>
