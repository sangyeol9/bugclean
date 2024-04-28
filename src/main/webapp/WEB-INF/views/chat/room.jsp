<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en" xmlns:th="http://www.thymeleaf.org" xmlns:sec="http://www.thymeleaf.org/extras/spring-security">

<th:block th:replace="~{/layout/basic :: setContent(~{this :: content})}">
    <th:block th:fragment="content">

        <div class="container">
            <div class="col-6">
                <h1>${room.name}</h1>
            </div>
            <div>
                <div id="msgArea" class="col"></div>
                <div class="col-6">
                    <div class="input-group mb-3">
                        <input type="text" id="msg" class="form-control">
                        <div class="input-group-append">
                            <button class="btn btn-outline-secondary" type="button" id="button-send">전송</button>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-6"></div>
        </div>


        
    </th:block>
</th:block>
<script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<script>

let username1 = '${pageContext.request.userPrincipal.name}';

fetch("/chat/getEmpName",{
                    method:"POST",
                    headers: {
                        "Content-Type": "application/json",
                    },
                    body : JSON.stringify({
                        username : username1
                    })
                }).then(res=>res.json())
                .then(res=>{
                    console.log("res=== > ",res.name)
                    username1 = res.name;
                })


            $(document).ready(function(){

                var roomName = "${room.name}";
                var roomId = "${room.roomId}";
                

                
                let message;


                console.log(roomName + ", " + roomId + ", " + username1);

                var sockJs = new SockJS("/stomp/chat");
                //1. SockJS를 내부에 들고있는 stomp를 내어줌
                var stomp = Stomp.over(sockJs);

                //2. connection이 맺어지면 실행
                stomp.connect({}, function (){
                   console.log("STOMP Connection")

                   //4. subscribe(path, callback)으로 메세지를 받을 수 있음
                   stomp.subscribe("/sub/chat/room/" + roomId, function (chat) {
                       var content = JSON.parse(chat.body);

                       var writer = content.writer;
                       var str = '';

                       if(writer === username1){
                           str = "<div class='col-6'>";
                           str += "<div class='alert alert-secondary'>";
                           str += "<b>" + writer + " : " + message + "</b>";
                           str += "</div></div>";
                           $("#msgArea").append(str);
                       }
                       else{
                           str = "<div class='col-6'>";
                           str += "<div class='alert alert-warning'>";
                           str += "<b>" + writer + " : " + message + "</b>";
                           str += "</div></div>";
                           $("#msgArea").append(str);
                       }

                       
                   });

                   //3. send(path, header, message)로 메세지를 보낼 수 있음
                   stomp.send('/pub/chat/enter', {}, JSON.stringify({roomId: roomId, writer: username1}))
                });

                $("#button-send").on("click", function(e){
                    var msg = document.getElementById("msg");
                    message = $("#msg").val();
                    console.log(username1 + ":" + msg.value);
                    stomp.send('/pub/chat/message', {}, JSON.stringify({roomId: roomId, message: msg.value, writer: username1}));
                    msg.value = '';
                });
            });
        </script>


</html>