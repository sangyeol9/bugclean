
let plusIcon = document.getElementsByClassName("plusIcon");
let minusIcon = document.getElementsByClassName("minusIcon");
let orgPepleDiv = document.getElementsByClassName("orgPepleDiv");
let orgPepleSpan = document.getElementsByClassName("orgPepleSpan");
let draftBtnMinus = document.getElementById("draftBtnMinus");
let draftBtnPlus = document.getElementById("draftBtnPlus");
let draftBoxTd = document.getElementById('draftBoxTd')
const draftBoxTdDiv = document.getElementById('draftBoxTdDiv')
let orgBoxTd = document.getElementById("orgBoxTd");
let orgAll = document.getElementsByClassName("orgAll");
let orgDep = document.getElementsByClassName("orgDep");
let refBoxTd = document.getElementById("refBoxTd");
let refMinusBtn = document.getElementById("refMinusBtn")
let refPlusBtn = document.getElementById("refPlusBtn");
let modalResetBtn = document.getElementById("modalResetBtn");
console.log("basis js")


console.log("조직도오오오오오오오오오오")
for(let i =0; i<plusIcon.length; i++){
plusIcon[i].addEventListener("click", function() {
    console.log("여기는 조직도 여기는 조직도")
    if (plusIcon[i].style.display != "none") {
        plusIcon[i].style.setProperty("display", "none");
        minusIcon[i].style.display = "inline-block";
        orgPepleDiv[i].style.display = "inline-block";
    } else {
        plusIcon[i].style.display = "inline-block";
        minusIcon[i].style.display = "none";
        orgPepleDiv[i].style.display = "inline-block";
    }

})
minusIcon[i].addEventListener("click", function() {
    console.log("여기는 조직도 여기는 조직도")
    if (plusIcon[i].style.display != "none") {
        plusIcon[i].style.setProperty("display", "none");
        minusIcon[i].style.display = "inline-block";
        orgPepleDiv[i].style.display = "none";
    } else {
        plusIcon[i].style.display = "inline-block";
        minusIcon[i].style.display = "none";
        orgPepleDiv[i].style.display = "none";
    }

})
}
for (let i = 0; i < orgPepleSpan.length; i++) {
    let drTemp = orgPepleSpan[i];
    drTemp.addEventListener(
                    "click",
                    function() {


                       if (drTemp.style.backgroundColor != "rgb(196, 232, 230)") {
                        drTemp.style.backgroundColor = "#C4E8E6";
                       } else {
                        drTemp.style.backgroundColor = "white";
                        }
                        
                    })

}
let b = orgAll[0].textContent.split(" ");
console.log("b : "+ b[0]);
console.log(orgAll[0].textContent);
console.log(orgDep[0].textContent);
draftBtnPlus
.addEventListener(
        "click",
        function() {
            for(let j =0; j<orgPepleSpan.length; j++){
                let orTemp = orgPepleSpan[j];
            if (getComputedStyle(orTemp).backgroundColor == "rgb(196, 232, 230)") {
                draftBoxTd
                        .appendChild(orTemp)
                        orTemp.style.backgroundColor = "white";
            }
        }
        })

       // let ddn = document.querySelector("div[data-dep-name='영업팀']")
        draftBtnMinus.addEventListener("click", function(){
            for(let n=0; n<orgDep.length;n++){
                let orgAllArr = [...orgAll];
                let peopleSpanArr = [...orgPepleSpan];

                for(let j =0; j<orgPepleSpan.length; j++){

                let a = orgAllArr[j].getAttribute("data-dep-name");
                let orTemp = peopleSpanArr[j];
               
                if (getComputedStyle(orTemp).backgroundColor == "rgb(196, 232, 230)") {
                        console.log(a);
                        console.log(orgDep[n].textContent, a,orgDep[n].textContent == a)
                        if(orgDep[n].textContent == a){
                        orgPepleDiv[n].appendChild(orTemp)
                        orTemp.style.backgroundColor = "white";
                        }                    
                }
            }
            }
        })

        ////////////////////////////////참조

        let c = orgAll[0].textContent.split(" ");
refPlusBtn.addEventListener(
        "click",
        function() {
            console.log("dddddddddd")
            for(let j =0; j<orgPepleSpan.length; j++){
                let orTemp = orgPepleSpan[j];
            if (getComputedStyle(orTemp).backgroundColor == "rgb(196, 232, 230)") {
                refBoxTd
                        .appendChild(orTemp)
                        orTemp.style.backgroundColor = "white";
            }
        }
        })

       // let ddn = document.querySelector("div[data-dep-name='영업팀']")
        refMinusBtn.addEventListener("click", function(){
            console.log("bbbbbbbbbbbbb")
            for(let n=0; n<orgDep.length;n++){
                let orgAllArr = [...orgAll];
                let peopleSpanArr = [...orgPepleSpan];
                for(let j =0; j<orgPepleSpan.length; j++){

                let a = orgAllArr[j].getAttribute("data-dep-name");
                let orTemp = peopleSpanArr[j];
               
                if (getComputedStyle(orTemp).backgroundColor == "rgb(196, 232, 230)") {
                        console.log(a);
                        console.log(orgDep[n].textContent, a,orgDep[n].textContent == a)
                        if(orgDep[n].textContent == a){
                        orgPepleDiv[n].appendChild(orTemp)
                        orTemp.style.backgroundColor = "white";
                        }                    
                } 
            }
            }
        })

//////////////////////////////초기화
                modalResetBtn.addEventListener("click", function(){
            console.log("bbbbbbbbbbbbb")
            for(let n=0; n<orgDep.length;n++){
                let orgAllArr = [...orgAll];
                let peopleSpanArr = [...orgPepleSpan];
                for(let j =0; j<orgPepleSpan.length; j++){

                let a = orgAllArr[j].getAttribute("data-dep-name");
                let orTemp = peopleSpanArr[j]
               
                
                        console.log(a);
                        console.log(orgDep[n].textContent, a,orgDep[n].textContent == a)
                        if(orgDep[n].textContent == a){
                        orgPepleDiv[n].appendChild(orTemp)
                        orTemp.style.backgroundColor = "white";
                        }                    
                
            }
            }
        })