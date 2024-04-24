const linebtn = document.getElementById("lineBtn");
const modal = document.getElementById("modal");
const modalBack = document.getElementById("modalBack");
const modalCloseBtn = document.getElementById("modalCloseBtn");



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