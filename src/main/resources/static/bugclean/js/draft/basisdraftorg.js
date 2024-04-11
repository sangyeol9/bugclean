
let plusIcon = document.getElementsByClassName("plusIcon");
let minusIcon = document.getElementsByClassName("minusIcon");
let orgPepleDiv = document.getElementsByClassName("orgPepleDiv");
let orgPepleSpan = document.getElementsByClassName("orgPepleSpan");
let draftBtnMinus = document.getElementById("draftBtnMinus");
let draftBtnPlus = document.getElementById("draftBtnPlus");
let draftBoxTd = document.getElementById('draftBoxTd')
const draftBoxTdDiv = document.getElementById('draftBoxTdDiv')

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
    let temp = orgPepleSpan[i];
    temp
            .addEventListener(
                    "click",
                    function() {


                       if (temp.style.backgroundColor != "rgb(196, 232, 230)") {
                        temp.style.backgroundColor = "#C4E8E6";
                       } else {
                        temp.style.backgroundColor = "white";
                        }
                        
                    })


}

draftBtnPlus
.addEventListener(
        "click",
        function() {
            for(let j =0; j<orgPepleSpan.length; j++){
            if (getComputedStyle(orgPepleSpan[j]).backgroundColor == "rgb(196, 232, 230)") {
                let moveOps=orgPepleSpan[j];
                console.log(moveOps)
                draftBoxTd
                        .appendChild(moveOps)
                orgPepleSpan[j].style.backgroundColor = "white";
            }
        }
        })
 

