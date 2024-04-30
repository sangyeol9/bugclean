<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<html lang="en" xmlns:th="http://www.thymeleaf.org" xmlns:sec="http://www.thymeleaf.org/extras/spring-security">
<link rel="stylesheet" href="/bugclean/css/chat.css">

<th:block th:replace="~{/layout/basic :: setContent(~{this :: content})}">
    <th:block th:fragment="content">

        <div id="chat_container" class="container">
            <div class="col-12">
                <h4 id="chat_person"></h4>
                <hr>
                  </div>
            <div>
                <div id="msgArea" class="col"></div>
                <div class="col-12 inputbox">
                    <div class="input-group mb-3">
                        <input type="text" id="msg" onkeyup="enterKey()" class="form-control">
                    </div>
                                                <div class="input-group-append">
                            <button class="btn btn-outline-secondary" type="button" id="button-send">전송</button>
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

const chat_container = document.getElementById("chat_container");
chat_container.scrollTop = chat_container.scrollHeight;

let username1 = '${pageContext.request.userPrincipal.name}';
let username2;
const sendData = JSON.parse(localStorage.getItem('sendData'));
const sendDataMsg = JSON.parse(localStorage.getItem('sendDateMsg'));
    // 채팅내역 불러오기 성공! 집가서 채팅창에 뿌려주면됩니다!!!


                    // 로그인 한 사람 사원번호 예정
                    let id1 = sendData.substring(0,7);
                    // 상대방 번호 될 예정
                    let id2 = sendData.substring(7);
                    let t;
window.onload = function(){
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
                    console.log("res=== > ",res)
                    username1 = res.NAME;
                    

                    if(res.EMPLOYEE_NUM != id1){
                        t = id2;
                        id2 = id1;
                        id1 = t;
                    }
                    fetch("/chat/getEmpInfo",{
                        method:"POST",
                    headers: {
                        "Content-Type": "application/json",
                    },
                    body : JSON.stringify({
                        employee_num : id2
                    })
                    }).then(res=>res.json())
                    .then(res=>{
                        console.log("res  id2 ===>",res);
                        document.getElementById("chat_person").innerHTML = res.DEP_NAME+" " + res.POS_NAME+ " " + res.NAME;
                        username2 = res.NAME;
                    })
                })

}
                    console.log("sendData ===>",sendData);
                    console.log("sendDateMsg ===> ", sendDataMsg)

                
    
                    var roomName = "${room.name}";
                    var roomId = sendData;
                    
    
                    console.log("id1 == " , id1 , " id2= == > ", id2);
                    
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
                               str = "<div class='user1_name'>" + writer +"</div>";
                               str += "<div class='col-6 username1'>";
                               str += "<div class='alert alert-secondary'>";
                               str += "<b>" +  content.message + "</b>";
                               str += "</div></div>";
                               $("#msgArea").append(str);
                           }
                           else{
                               str="<div class='user2_name'>" + '<img id="user2_profile" src="/focus-bootstrap-main/theme/images/base_profile.png">'+ username2 +"</div>";
                               str += "<div class='col-6 username2'>";
                               str += "<div class='alert alert-warning'>";
                               str += "<b>" + content.message + "</b>";
                               str += "</div></div>";
                               $("#msgArea").append(str);
                           }
                           
                           
                       });
    
                       //3. send(path, header, message)로 메세지를 보낼 수 있음
                       stomp.send('/pub/chat/enter', {}, JSON.stringify({ room_num: roomId, writer: username1}))
                    });
    
                    $("#button-send").on("click", function(e){
                        var msg = document.getElementById("msg");
                        message = $("#msg").val();
                        console.log(username1 + ":" + msg.value);
                        stomp.send('/pub/chat/message', {}, JSON.stringify({room_num: roomId, message: msg.value, writer: username1}));
                        sendMessage(roomId,msg.value,id1);
                        msg.value = '';
                    });
                    function enterKey(){
                        console.log("enter",window.event.keyCode)
                        if(window.event.keyCode == 13){
                        var msg = document.getElementById("msg");
                        message = $("#msg").val();
                        console.log(username1 + ":" + msg.value);
                        stomp.send('/pub/chat/message', {}, JSON.stringify({room_num: roomId, message: msg.value, writer: username1}));
                        sendMessage(roomId,msg.value,id1);
                        msg.value = '';
                        }
                    }        
                    
                    function sendMessage(roomId,msg,username){
                        fetch("/chat/sendMsg",{
                            method : "POST",
                            headers: {
                                "Content-Type": "application/json",
                            },
                            body : JSON.stringify({
                                employee_num : username,
                                msg_contents : msg,
                                room_num : roomId
                            })
                        }).then(res=>res.json())
                        .then(res=>{

                        })
                    }

        </script>


</html>