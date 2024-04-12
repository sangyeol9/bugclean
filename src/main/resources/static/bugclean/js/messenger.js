let affairs_team_list = document.getElementById("affairs_team_list");
let affairs_team_span = document.getElementById("affairs_team_span");
let affairs_team_div = document.getElementById("affairs_team_div"); 
let messenger_emp_list = document.getElementById("messenger_emp_list");

let ceo;
let affairs = document.getElementById("총무팀");
let personal = document.getElementById("인사팀_list");
let sales = document.getElementById("영업팀");
let field = document.getElementById("현장팀");

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
console.log(ceo);   
window.addEventListener("load",function(){
    fetch("/chat/department",{
        method : "POST"
    }).then(res => res.json())
    .then(res => {
        console.log("department" , res);
        res.forEach(element => {
            let div = this.document.createElement("div");
            div.innerHTML+=  
                    `<div id="${element.dep_name}">
                        <div id="${element.dep_name}_div"  class="mt-1" onclick="displayOnOff('${element.dep_name}')">
                        <b>
                            <span id="${element.dep_name}_span">+</span><i class="fa-solid fa-users"></i>
                        ${element.dep_name}</b>
                        </div>
                        <div id="${element.dep_name}_list" class="display_none mt-1">
                        </div>
                        </div>

                    `
                    messenger_emp_list.append(div);
            obj[element.dep_name] = div.querySelector(`#${element.dep_name}_list`);
            console.log(element.dep_name);

        });

        console.log(obj);
    })
})
//" class=" + "\"" + "display_none" + "\""
                            /* <div id="affairs_team_list" class="display_none">
							<div>&emsp;<i class="fa-solid fa-user"></i>박성제</div>
							<div>&emsp;<i class="fa-solid fa-user"></i>허석훈</div>
							<div>&emsp;<i class="fa-solid fa-user"></i>노지언</div>
							<div>&emsp;<i class="fa-solid fa-user"></i>윤상열</div>
						    </div> */

window.addEventListener("load",function(){
    console.log("onload");
    fetch("/chat/list",{
        method:"POST"
    }).then(res=>res.json())
    .then(res=>{
        res.forEach((element,index) => {
            console.log("ele = ",element);
            obj[element.DEP_NAME].innerHTML += `<div id="${element.NAME}_${index}" class="mt-1">&emsp;<i class="fa-solid fa-user"></i>${element.NAME}</div>`
        })
        console.log(res);
    })

}) 

function displayOnOff(name){
    console.log("name = ",name);
    let list = document.getElementById(name+"_list")
    let span = document.getElementById(name+"_span");
    console.log("list = " + list)
    if(list.classList.contains("display_none")){
        list.classList.remove("display_none");
        span.innerHTML="-";
    }else{
        list.classList.add("display_none");
        span.innerHTML="+";
    }
}
