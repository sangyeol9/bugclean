var calenar;
let start_first;


/*
    function create_sch(date){
        console.log("일정추가 : " + date);
        var inputTitle = document.getElementById("inputTitle").value;
        var inputStart = document.getElementById("inputStart").value;
        var inputEnd = document.getElementById("inputEnd").value;
    
        calendar.addEvent({
        title: inputTitle,
        start: date+'T'+inputStart,
        end: date+'T'+inputEnd,
        id : inputTitle+date+'T'+inputStart
        })

        closeModal(); // 추가 후 모달 닫기
    // 입력 필드 초기화
    document.getElementById("inputTitle").value = "";
    document.getElementById("inputStart").value = "";
    document.getElementById("inputEnd").value = "";
    // FullCalendar 날짜 선택 해제
        calendar.unselect(); // FullCalendar에서 날짜 선택 초기화
        console.log("calendar unselect");
    }
*/


document.addEventListener('DOMContentLoaded', function() {
    var calendarEl = document.getElementById('calendar');
    calendar = new FullCalendar.Calendar(calendarEl, {
        initialView : 'dayGridMonth',
        selectable : true,
        locale : "kr",
        editable: true,
        eventDrop: function(info) {
                alert("일정을 이동했습니다!"); // 이벤트를 이동할 때 알림창을 띄울 수 있습니다.
        },dateClick : function(info) {
            // 클릭시 삭제
            /* console.log("Clicked event occurs date = " + info.dateStr);

            console.log("Clicked event occurs id = "
                    + info.getEventSourceById);
            removeEventFromCalender(info.dateStr); */
            
            
            // 클릭시 추가
            // addEventToCalendar({
            // 	start:info.dateStr
            // })
            
            //일정 클릭시 상세정보
            openModal(info.title,info.dateStr);
        }
        ,
        eventClick:function(info){
            console.log("event Click");
            console.log("info = " +info.event.title);
            openModal(info.event.title,info.event.start,info.event.id)
        }

    });
    calendar.render();
});

function addEventToCalendar(event) {
    calendar.addEvent(event);
}

function removeEventFromCalender(id) {
    let calenderEvent = calendar.getEventById(id);
    calenderEvent.remove();
}

/* 모달창 */

function openModal(content,date,id) {
carAllocation.selectedIndex=0; // 배차 셀렉트박스 선택 값 초기화

var modal = document.getElementById("myModal");
var modalTitle = document.getElementById("modal-title"); // 모달 타이틀 엘리먼트
var modalContent = document.getElementById("modal-content");
var start_Time_Date = document.getElementById("start_Time_Date");
var end_Time_Date = document.getElementById("end_Time_Date");
let span_start_time = document.getElementById("start_Time");

let create_sch_btn = document.getElementById("create_sch_btn");
let inputStart = document.getElementById("inputStart");
modal.style.display = "block";
modalTitle.innerText="일정 등록";

span_start_time.innerHTML = start_first;



console.log("date"+date);
console.log("id"+id);
//일정추가

create_sch_btn.addEventListener("click",function(){

    create_sch(date);
})

//외부 공간 클릭시 닫기 
window.onclick = function(event) {
      var modal = document.getElementById("myModal");
      if (event.target == modal) {
        modal.style.display = "none";
      }
    }
    calendar.unselect();
}
// 모달 닫기
function closeModal() {
var modal = document.getElementById("myModal");
modal.style.display = "none";
}

    function create_sch(date){
        console.log("일정추가 : " + date);
        var inputTitle = document.getElementById("inputTitle").value;
        var inputStart = document.getElementById("inputStart").value;
        var inputEnd = document.getElementById("inputEnd").value;
    
        calendar.addEvent({
        title: inputTitle,
        start: date+'T'+inputStart,
        end: date+'T'+inputEnd,
        id : inputTitle+date+'T'+inputStart
        })

        closeModal(); // 추가 후 모달 닫기
    // 입력 필드 초기화
    document.getElementById("inputTitle").value = "";
    document.getElementById("inputStart").value = "";
    document.getElementById("inputEnd").value = "";
    // FullCalendar 날짜 선택 해제
        calendar.unselect(); // FullCalendar에서 날짜 선택 초기화
        console.log("calendar unselect");
    }

// 배차 요청 셀렉트박스
let carAllocation = document.getElementById("carAllocation");
function changeSelect(){
    let car_temp = carAllocation.value;
    
    if(car_temp.value != ""){
        let check = confirm(car_temp+" 차량으로 배차요청 하시겠습니까?");
        if(check == false){
            carAllocation.selectedIndex=0;
            
        }
        else{
            carAllocation.value=car_temp;
        }
    }

}
    
window.addEventListener("load",function(){
    fetch("/schedule/getList",{
        method : "GET"
    })
    .then(res => res.json())
    .then(res => {
            calendar.getEvents().forEach(function(event) {
            event.remove();
            });

            console.log("h2");
            console.log("test = ",res);
            res.forEach(element => {
               console.log("start = ", element.start_Time);
               start_first = element.start_Time.substr(0,10);
               console.log("start_first = ", start_first);
               let start_last = element.start_Time.substring(11,19);
              
                  calendar.addEvent({
                   title : element.business_Name  + element.ceo_Name,
                   start : start_first +"T"+ start_last,
                   end : element.end_Time,
                   id : element.ceo_Name+start_first
                  })
            });
    })

})
