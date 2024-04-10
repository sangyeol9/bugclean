//console.log('연결');

const mailCheckBtn = document.getElementById("mailCheckBtn");
mailCheckBtn.addEventListener("click",function(){
		
		//공백시
	    if(document.getElementById("username").value === ''){
	      alert('아이디를 입력해주세요.');
	      return false;
	    }
		
		//이메일 전송
		const email = document.getElementById("username").value + "@gmail.com";
		const checkInput = document.getElementsByClassName("mailCheckInput");
		
		//console.log(email);

		fetch("/employee/mailCheck?email="+email,{
			method: "get",
		})
		.then(res=>res.text())
		.then(res=>{
		    //console.log(res)
		    checkInput.setAtttribute("disabled","false");
		    code =data;
			alert('인증번호가 전송되었습니다.')
		});

		// $.ajax({
		// 	type : 'get',
		// 	url : '<c:url value ="/user/mailCheck?email="/>'+"gmail.com", // GET방식이라 Url 뒤에 email을 뭍힐수있다.
		// 	success : function (data) {
		// 		console.log("data : " +  data);
		// 		checkInput.attr('disabled',false);
		// 		code =data;
		// 		alert('인증번호가 전송되었습니다.')
		// 	}			
		// }); // end ajax
		

})