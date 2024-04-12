//console.log('연결');

const mailCheckBtn = document.getElementById("mailCheckBtn");

let submit = document.getElementById("submit");
let phoneStart = document.getElementById("phoneStart");
let phoneMiddle = document.getElementById("phoneMiddle");
let phoneEnd = document.getElementById("phoneEnd");

let email= null;
let number;

mailCheckBtn.addEventListener("click",function(){
		//공백시
	    if(document.getElementById("username").value === ''){
	      alert('아이디를 입력해주세요.');
	      return false;
	    }else if(document.getElementById("username").value.includes('@')){
			alert('올바르게 입력해주세요.');
	     	return false;
		}
		
		email = document.getElementById("username").value + "@gmail.com";
		//console.log(email);
		
		//이메일 전송
		sendNumber()
		$("#number").focus();
		$("#mailCheckBtn").attr("disabled","disabled");

})
		//이메일 전송
		function sendNumber(){
			console.log(email);
			$("#mail_number").css("display","block");
			$.ajax({
				url:"/employee/mailSend",
				type:"post",
				dataType:"json",
				data:{"email" : email},
				success: function(data){
					alert("인증번호 발송");
					$("#Confirm").attr("value",data);
				}
				// ,error:function(request, status, error){
				// 	console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				// }
				}
			);
		}
		
		//인증번호 일치여부
		function confirmNumber(){

			userNumCheck = document.getElementById("userNumCheck").value
			//console.log("number : "+number);
			fetch("/employee/mailCheck?userNumber="+userNumCheck,{
				method:"get"
			})
			.then(res=>res.text())
			.then(r=>{
				//console.log("r : "+r);
				if(r){
					alert("인증되었습니다.");
				}else{
					alert("다시 시도해주세요.");
				}
			})

		}
		// //인증번호 확인
		// function confirmNumber(){
		// 	var number1 = $("#number").val();
		// 	var number2 = $("#Confirm").val();
	
		// 	if(number1 == number2){
		// 		alert("인증되었습니다.");
		// 	}else{
		// 		alert("번호가 다릅니다.");
		// 	}
		// }


//


let phone = document.getElementById("phone");
submit.addEventListener("click",function(){
	//폰
	if(phoneStart.value != ""&&phoneMiddle.value != ""&&phoneEnd.value != ""){

		phone.setAttribute("value",phoneStart.value+"-"+phoneMiddle.value+"-"+phoneEnd.value);
	}
	//alert(phone.value);
})