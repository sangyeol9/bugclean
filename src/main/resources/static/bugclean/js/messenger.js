let affairs_team_list = document.getElementById("affairs_team_list");
let affairs_team_span = document.getElementById("affairs_team_span");
let affairs_team_div = document.getElementById("affairs_team_div"); 
affairs_team_div.addEventListener("click",function(){
    if(affairs_team_span.innerText.trim() == '+'){
        affairs_team_span.innerHTML = '-';
        affairs_team_list.classList.remove("display_none");
    }else{
       affairs_team_span.innerText = '+';
       affairs_team_list.classList.add("display_none");
        
    }

})

window.addEventListener("load",function(){
    console.log("onload");
    fetch("/chat/list",{
        method:"POST"
    }).then(res=>res.json())
    .then(res=>{
        console.log(res);
    })

}) 


