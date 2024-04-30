<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<html lang="en" xmlns:th="http://www.thymeleaf.org" xmlns:sec="http://www.thymeleaf.org/extras/spring-security">

<th:block th:replace="~{/layout/basic :: setContent(~{this :: content})}">
    <th:block th:fragment="content">
        <div class="container">
            <div>
                <ul >
                    <c:forEach items="${list}" var = "li">
                        <li><a href="/chat/room?roomId=${li.roomId}">${li.name}</a></li>
                    </c:forEach>
                </ul>
            </div>
        </div>
        <form action="/chat/room" method="post">
            <input  id="room_Name" type="text" name="name" class="form-control">
            <button id="create_room" class="btn btn-secondary btn-create">개설하기</button>
        </form>
    </th:block>
</th:block>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script th:inline="javascript">
    $("#create_room").click(function(){

        var roomName = $("#room_Name").val();

        if(roomName != null)
            alert(roomName + "방이 개설되었습니다.");

        $(".btn-create").on("click", function (e){
            e.preventDefault();

            var name = $("input[name='name']").val();

            if(name == "")
                alert("Please write the name.")
            else
                //$("form").submit();
        });

    });
</script>

</html>