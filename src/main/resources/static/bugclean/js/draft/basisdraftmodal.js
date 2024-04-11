linebtn = document.getElementById("lineBtn");
let modal = document.getElementById("modal");
let modalBack = document
        .getElementById("modalBack");
let modalCloseBtn = document
        .getElementById("modalCloseBtn");

linebtn.addEventListener("click", function() {
    console.log("여기는 모달 여기는 모달")
    modalBack.classList.remove("noshow")
    modal.classList.remove("noshow")
})

modalCloseBtn.addEventListener("click", function() {
    console.log("여기는 닫기버튼 여기는 닫기버튼")
    modalBack.classList.add("noshow")
    modal.classList.add("noshow")
})