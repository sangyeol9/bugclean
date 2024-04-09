//console.log('연결');

const numRequest = document.getElementById("numRequest");
const numCheck = document.getElementById("numCheck");
numRequest.addEventListener("click",function(){


        numCheck.innerHTML="";
        // 라벨 요소 생성
        var label = document.createElement("label");
        var strong = document.createElement("strong");
        strong.textContent = "인증번호";
        label.appendChild(strong);

        // 텍스트 입력 요소 생성
        var input = document.createElement("input");
        input.setAttribute("type", "text");
        input.setAttribute("class", "form-control");

        // DOM에 추가
        numCheck.appendChild(label);
        numCheck.appendChild(input);


})