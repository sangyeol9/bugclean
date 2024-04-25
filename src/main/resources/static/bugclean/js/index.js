// 시간
const clock = document.getElementById("clock");
        function getClock(){
            const date = new Date();	//현재날짜,시간
            const hour = String(date.getHours()).padStart(2,"0");
            const minutes = String(date.getMinutes()).padStart(2,"0");
            const second = String(date.getSeconds()).padStart(2,"0");
            clock.innerText = hour+":"+minutes+":"+second;
            //clock.innerText = `${hour}:${minutes}:${second}`;
        }
        getClock();
        setInterval(getClock, 1000);
    


//캘린더
let calendar;
document.addEventListener('DOMContentLoaded', function() {
    var calendarEl = document.getElementById('calendar');
  
    calendar = new FullCalendar.Calendar(calendarEl, {
      timeZone: 'local',
      locale: 'ko',
      initialView: 'dayGridWeek',
      height : 450,
      headerToolbar: {
        left: 'prev,next',
        center: 'title',
        right: 'dayGridWeek,listMonth'
      },
      //editable: true,
      events: [
        
      ],
      eventClick:function(info){
            getInfo(info.event.id)
        }
    });
  
    calendar.render();
  });

//cl
let sch_Id;
// content 요소 선택
const content = document.getElementById('content');

let isContentVisible = false;


  function getInfo(id){
	
    sch_Id = id.substring(id.lastIndexOf('-')+1,id.length);
    console.log("id====",sch_Id);
    fetch("/schedule/getSchedule",{
        method : "POST",
        headers: {
            "Content-Type": "application/json",
          },
        body : JSON.stringify({
           site_Num : sch_Id
            })
    }).then(res=>res.json())
    .then(res=>{
        console.log("res====",res);


        $("#content").html(`<div class="row justify-content-between">
                                        
        <div class="col-12">
            <br>
            <hr>
            <br>
        </div>
        <div class="col-lg-6">
            <div class="mb-4">
                <h4 class="card-title card-intro-title">Details</h4>
            </div>

            <div class="card-content" >
                <p class="text-sm-left"> 현장 번호 : ${res.site_Num}</p>
                <p class="text-sm-left"> 거래처 번호 : ${res.customer_Num}</p>
                <p class="text-sm-left"> 작업 시작일시 : ${res.start_Time}</p>
                <p class="text-sm-left"> 작업 종료일시 : ${res.end_Time}</p>
                <p class="text-sm-left"> 주소 : ${res.address}</p>
                <p class="text-sm-left"> 사업자 이름 : ${res.business_Name}</p>
                <p class="text-sm-left"> 대표자 이름 : ${res.ceo_Name}</p>
                <p class="text-sm-left"> 기안서 번호 : ${res.draft_Num}</p>
                <p class="text-sm-left"> 담당사원 : ${res.employee_Num}</p>
                <p class="text-sm-left"> 배차코드 : ${res.manage_Code}</p>
                <p class="text-sm-left"> 단가 : ${res.price}</p>
                <p class="text-sm-left"> 영업 담당자 : ${res.sales_Manager}</p>
                <p class="text-sm-left"> 현장구분 : ${res.site_Type}</p>

            </div>
        </div>
        <div class="col-lg-6">
            <div class="mb-4">
                <h4 class="card-title card-intro-title">Map</h4>
            </div>

            <div id="map" style="width:100%;height:500px;"></div>
        </div>`);



        //지도
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
mapOption = {
    center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
    level: 3 // 지도의 확대 레벨
};  

// 지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 

// 주소-좌표 변환 객체를 생성합니다
var geocoder = new kakao.maps.services.Geocoder();

// 주소로 좌표를 검색합니다
geocoder.addressSearch(`${res.address}`, function(result, status) {

// 정상적으로 검색이 완료됐으면 
 if (status === kakao.maps.services.Status.OK) {

    var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

    // 결과값으로 받은 위치를 마커로 표시합니다
    var marker = new kakao.maps.Marker({
        map: map,
        position: coords
    });

    // 인포윈도우로 장소에 대한 설명을 표시합니다
    var infowindow = new kakao.maps.InfoWindow({
        content: '<div style="width:150px;text-align:center;padding:6px 0;">우리회사</div>'
    });
    infowindow.open(map, marker);

    // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
    map.setCenter(coords);
} 
});


        // content.innerText = res.site_Num // 현장번호

        // + res.customer_Num // 거래처 번호
        // + res.start_Time //작업 시작일시
        // + res.end_Time //작업 종료일시
        // + res.address // 주소
        // + res.business_Name // 사업자 이름
        // + res.ceo_Name //대표자 이름
        // + res.draft_Num //기안서 번호
        // + res.employee_Num //담당사원
        // + res.manage_Code //배차코드
        // + res.price //단가
        // + res.sales_Manager// 영업 담당자
        // + res.site_Type //현장구분



        // //내용 그..보였다안보였다 해야해...
        // if (isContentVisible) {
        //     content.style.display = 'none';
        // } else {
        //     content.style.display = 'block';
        // }
        
        // isContentVisible = !isContentVisible;

    })

    
}

function openWindow(e){
    let param
    console.log("e === == " , e);
    param = e;
    if(e == null || e =='undefined'){
        param  = "";
        console.log("null or undef")
    } 
    fetch("/schedule/getList?search="+param,{
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
               console.log("site_Num === ", element.site_Num)
               let start_last = element.start_Time.substring(11,19);
                
                if(element.site_Type == '긴급'){
                    color = "red";
                    textDeco = "none";
                } 
                else if(element.site_Type =='일반'){
                    color = "black";
                    textDeco = "none"
                } 
                else if(element.site_Type == '취소'){
                    color = 'gray';
                    textDeco = "line-through";
                }else if (element.site_Type == '완료'){
                    color = 'blue';
                    textDeco = 'none';
                }
                console.log("color == ", color);
                  calendar.addEvent({
                   title : element.business_Name  + element.ceo_Name,
                   start : start_first +"T"+ start_last,
                   color : color,
                   classNames : textDeco,
                   end : element.end_Time,
                   id : element.ceo_Name+start_first+"-"+element.site_Num
                  })
            });
    })
}

window.addEventListener("load",function(){
    openWindow();    

})


// document.addEventListener('DOMContentLoaded', function() {
//   var calendarEl = document.getElementById('calendar');
//   var calendar = new FullCalendar.Calendar(calendarEl, {
//     //initialView: 'dayGridMonth',
//     initialView: 'listWeek',
//     initialDate: '2024-03-07',
//     headerToolbar: {
//       left: 'prev,next today',
//       center: 'title',
//       right: 'dayGridMonth,timeGridWeek,timeGridDay'
//     },
//     events: [
//       {
//         title: 'All Day Event',
//         start: '2024-03-01'
//       },
//       {
//         title: 'Long Event',
//         start: '2024-03-07',
//         end: '2024-03-10',
//         backgroundColor: 'green',
//         borderColor: 'green'
//       },
//       {
//         title: 'Conference',
//         start: '2024-03-11',
//         end: '2024-03-13'
//       },
//       {
//         title: 'Click for Google',
//         url: 'https://google.com/',
//         start: '2024-03-28'
//       }
//     ]
//   });

//   calendar.render();
// });

//지도

