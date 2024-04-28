let affairs_team_list = document.getElementById("affairs_team_list");
let affairs_team_span = document.getElementById("affairs_team_span");
let affairs_team_div = document.getElementById("affairs_team_div"); 
let messenger_emp_list = document.getElementById("messenger_emp_list");

let ceo;
let affairs = document.getElementById("총무팀");
let personal = document.getElementById("인사팀_list");
let sales = document.getElementById("영업팀");
let field = document.getElementById("현장팀");


let info_name = document.getElementById("info_name");
let info_nick = document.getElementById("info_nick");
let info_def = document.getElementById("info_def");
let info_pos = document.getElementById("info_pos");
let info_phone = document.getElementById("info_phone");
let info_profile = document.getElementById("info_profile");
let info_Email = document.getElementById("info_Email");

let obj = {};

// affairs_team_div.addEventListener("click",function(){
//     if(affairs_team_span.innerText.trim() == '+'){
//         affairs_team_span.innerHTML = '-';
//         affairs_team_list.classList.remove("display_none");
//     }else{
//        affairs_team_span.innerText = '+';
//        affairs_team_list.classList.add("display_none");
        
//     }

// })
let basicModal = document.getElementById("basicModal");
async function emp_modal(e){
    console.log("target.id === " , e.target.id);
    const response = await fetch("/chat/getEmpInfo",{
        method:"POST",
        headers: {
            "Content-Type": "application/json",
          },
        body : JSON.stringify({
            employee_num : e.target.id
        })
    })
    const res = await response.json();
    basicModal.classList.remove("display_none");
    info_name.value = res.NAME;
    info_def.value = res.DEP_NAME;
    info_nick.value = res.NICKNAME;
    info_phone.value = res.PHONE;
    info_pos.value = res.POS_NAME;
    info_Email.value = res.USERNAME;

    console.log("get info == ", res);
    
}

window.onclick = function(event) {
    
    if (event.target == basicModal) {
      basicModal.classList.add ("display_none");
    }
  }

  let close = document.getElementsByClassName("close");

function close_modal(){
    basicModal.classList.add("display_none");
}




window.addEventListener("load",async function(){
    const response =  await fetch("/chat/department",{
        method : "POST"
    })
        const res = await response.json();
        res.forEach(element => {
            let div = this.document.createElement("div");
            if(element.upper_dep_code == null || element.upper_dep_code== 1){
                div.innerHTML+=  
                `<div id="div${element.dep_code}">
                <div id="div${element.dep_code}_div"  class="mt-1" onclick="displayOnOff('${element.dep_code}')">
                <b>
                <span id="div${element.dep_code}_span">+</span><i class="fa-solid fa-users"></i>
                ${element.dep_name}</b>
                </div>
                <div id="div${element.dep_code}_list" class="display_none mt-1">
                </div>
                </div>
                
                `
                messenger_emp_list.append(div);
                obj[element.dep_code] = div.querySelector(`#div${element.dep_code}_list`);
            }else{
                div.innerHTML+=  
                `<div id="div${element.dep_code}">
                <div id="div${element.dep_code}_div"  class="mt-1" onclick="displayOnOff('${element.dep_code}')">
                <b>
                <span id="div${element.dep_code}_span">&emsp;+</span><i class="fa-solid fa-users"></i>
                ${element.dep_name}</b>
                </div>
                <div id="div${element.dep_code}_list" class="display_none mt-1">
                </div>
                </div>
                
                `
                document.getElementById(`div${element.upper_dep_code}_list`).append(div);
                obj[element.dep_code] = div.querySelector(`#div${element.dep_code}_list`);
            }
            

          });
        })
//" class=" + "\"" + "display_none" + "\""
                            /* <div id="affairs_team_list" class="display_none">
							<div>&emsp;<i class="fa-solid fa-user"></i>박성제</div>
							<div>&emsp;<i class="fa-solid fa-user"></i>허석훈</div>
							<div>&emsp;<i class="fa-solid fa-user"></i>노지언</div>
							<div>&emsp;<i class="fa-solid fa-user"></i>윤상열</div>
						    </div> */

window.addEventListener("load",async function(){
    
    const response =  await fetch("/chat/list",{
        method:"POST"
    })
        const res = await response.json();
        res.forEach((element,index) => {
            console.log(element);

            obj[element.DEP_CODE].innerHTML = `<div id="${element.EMPLOYEE_NUM}" onclick="emp_modal(event)" style="color:black;" class="mt-1">&emsp;&emsp;<i class="fa-solid fa-user mr-1"></i>${element.POS_NAME} ${element.NAME} ( ${element.NICKNAME} )</div>`
            +`${obj[element.DEP_CODE].innerHTML}`
        
        
    })

}) 


function displayOnOff(name){
    
    let list = document.getElementById("div"+name+"_list")
    let span = document.getElementById("div"+name+"_span");
    
    if(name.length<3){

        if(list.classList.contains("display_none")){
            list.classList.remove("display_none");
            span.innerHTML="-";
        }else{
            list.classList.add("display_none");
            span.innerHTML="+";
        }
    }else{
        if(list.classList.contains("display_none")){
            list.classList.remove("display_none");
            span.innerHTML="&emsp;-";
        }else{
            list.classList.add("display_none");
            span.innerHTML="&emsp;+";
        }
    }
}
