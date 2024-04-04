<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script>
	var calenar;
	document.addEventListener('DOMContentLoaded', function() {
		var calendarEl = document.getElementById('calendar');
		calendar = new FullCalendar.Calendar(calendarEl, {
			initialView : 'dayGridMonth',
			selectable : true,
			locale : "kr",
			events : [ {
				id : "2024-04-04",
				title : "스케줄",
				start : "2024-04-04"
			}, {
				id : "2024-04-15",
				title : "스케줄",
				start : "2024-04-15"
			}, {
				id : "2024-04-06",
				title : "스케줄",
				start : "2024-04-06T12:30:00",
				
				extendedProps : {
					comment : "테스트"
				}
			} ],
			dateClick : function(info) {
				// 클릭시 삭제
				/* console.log("Clicked event occurs date = " + info.dateStr);

				console.log("Clicked event occurs id = "
						+ info.getEventSourceById);
				removeEventFromCalender(info.dateStr); */
				
				
				// 클릭시 추가
				// addEventToCalendar({
				// 	start:info.dateStr
				// })
			
				openModal(info.title,info.dateStr);
			
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
	
	function openModal(content,date) {
	var modal = document.getElementById("myModal");
	var modalTitle = document.getElementById("modal-title"); // 모달 타이틀 엘리먼트
	var modalContent = document.getElementById("modal-content");
	var start_Time_Date = document.getElementById("start_Time_Date");
	var end_Time_Date = document.getElementById("end_Time_Date");
	let create_sch_btn = document.getElementById("create_sch_btn");
	modal.style.display = "block";
	modalTitle.innerText="일정 등록";
	start_Time.innerText=date;
	console.log(date);
	//일정추가
	create_sch_btn.addEventListener("click",function(){
		console.log("일정추가 : " + date);
		var inputTitle = document.getElementById("inputTitle").value;
		var inputStart = document.getElementById("inputStart").value;
		var inputEnd = document.getElementById("inputEnd").value;
	
		calendar.addEvent({
        title: inputTitle,
        start: date+'T'+inputStart,
        end: date+'T'+inputEnd
		})


	closeModal1(); // 추가 후 모달 닫기
		// 입력 필드 초기화
		document.getElementById("inputTitle").value = "";
		document.getElementById("inputStart").value = "";
		document.getElementById("inputEnd").value = "";
		// FullCalendar 날짜 선택 해제
		
			calendar.unselect(); // FullCalendar에서 날짜 선택 초기화
    	
		
	})

	function closeModal1() {
    var modal = document.getElementById("myModal");
    modal.style.display = "none";

    // 선택한 날짜 초기화
    var selectedDate = calendar.getDate(); // FullCalendar에서 선택한 날짜 가져오기
    selectedDate && selectedDate.setHours(0, 0, 0, 0); // 선택한 날짜가 존재하면 시간 부분을 초기화
    calendar.gotoDate(selectedDate || new Date()); // 선택한 날짜가 존재하면 해당 날짜로 이동
}
	



	// 모달 닫기
	function closeModal() {
	var modal = document.getElementById("myModal");
	modal.style.display = "none";
	}
	//외부 공간 클릭시 닫기 
	window.onclick = function(event) {
		  var modal = document.getElementById("myModal");
		  if (event.target == modal) {
		    modal.style.display = "none";
		  }
		}
	}
</script>