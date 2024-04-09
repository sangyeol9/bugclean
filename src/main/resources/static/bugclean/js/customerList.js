let modi = document.getElementById("modi");
let th_check = document.getElementById("th_check");
let modal = document.getElementById("modal_myModal");
let modi_checkbox = document.getElementsByClassName("modi_checkbox");
let span = document.getElementsByClassName("close")[0];
let list_tr = document.getElementsByClassName("list_tr");
let td_checkbox = document.getElementsByClassName("td_checkbox");



// 모달 창 각 항목 아이디
let modal_bn_name_in = document.getElementById("modal_bn_name_in");
let modal_ceo_name_in = document.getElementById("modal_ceo_name_in");
let modal_ceo_phone_in  = document.getElementById("modal_ceo_phone_in");
let modal_addr_in = document.getElementById("modal_addr_in");
let modal_manager_name_in = document.getElementById("modal_manager_name_in");
let modal_manager_phone_in = document.getElementById("modal_manager_phone_in");
let modal_sales_name_in = document.getElementById("modal_sales_name_in");


/*모달창 접근*/
for(let i=0; i<modi_checkbox.length;i++){

    // 리스트의 값들 클래스명으로 저장
    let td_business_name = document.getElementsByClassName("td_business_name");
    let td_ceo_name = document.getElementsByClassName("td_ceo_name");
    let td_ceo_phone = document.getElementsByClassName("td_ceo_phone");
    let td_mng_name = document.getElementsByClassName("td_mng_name");
    let td_mng_phone = document.getElementsByClassName("td_mng_phone");
    let td_address = document.getElementsByClassName("td_address");
    let td_sales_mng = document.getElementsByClassName("td_sales_mng");
    let td_customer_num = document.getElementsByClassName("td_customer_num");
    let customer;
    modi_checkbox[i].addEventListener("click",function(){
        console.log("event 진입 " + i );
        console.log(td_checkbox[i].checked);
        if(td_checkbox[i].checked == true){
            customer = td_customer_num[i].getAttribute("data-customernum");
            console.log("customerNum = "+customer);
            console.log("modal 진입 ");

            modal.style.display="block";

            modal_bn_name_in.value = td_business_name[i].innerText;
            modal_ceo_name_in.value = td_ceo_name[i].innerText;
            modal_ceo_phone_in.value = td_ceo_phone[i].innerText;
            modal_addr_in.value = td_address[i].innerText;
            modal_manager_name_in.value = td_mng_name[i].innerText;
            modal_manager_phone_in.value = td_mng_phone[i].innerText;
            modal_sales_name_in.value = td_sales_mng[i].innerText;

        }else {
            modal.style.display="none";
        }
       
        function modiComplate(){
            
            fetch("/customer/update",{
                method : "post",
                body : JSON.stringify({
                    customer_Num : customer,
                    business_Name : modal_bn_name_in.value,
                    ceo_Name : modal_ceo_name_in.value,
                    ceo_Phone : modal_ceo_phone_in.value,
                    address : modal_addr_in.value,
                    manager_Name : modal_manager_name_in.value,
                    manager_Phone : modal_manager_phone_in.value,
                    sales_Manager : modal_sales_name_in
                })
            }).then(response=>response.text)
            .then(response=>{
                if(response =! '0'){
                    alert("변경에 성공하였습니다.");
                }
            })
        }


    })
}

/*모달창 종료 */
span.onclick = function() {
  modal.style.display = "none";
}

window.onclick = function(event) {
  if (event.target == modal) {
    modal.style.display = "none";
  }
}

/*수정 버튼 클릭시 체크박스 노출 */
function checkOn() {
    th_check.classList.remove("display_none");
    for(let i=0;i<modi_checkbox.length;i++){
		modi_checkbox[i].classList.remove("display_none");
	}
    

}