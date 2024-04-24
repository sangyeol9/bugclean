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
      //editable: false,
      events: [
        
      ],
      eventClick:function(info){
            getInfo(info.event.id)
        }
    });
  
    calendar.render();
  });


let sch_Id;
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
                   backgroundColor : color,
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

