





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

//지도
function selectMapList() {
    var map = new naver.maps.Map("map", {
        center: new naver.maps.LatLng(37.3595316, 127.1052133),
        zoom: 15,
        mapTypeControl: true
    });

var map = new naver.maps.Map('map', {
        center: new naver.maps.LatLng(37.3595704, 127.105399),
        zoom: 10
    });
}

var map = new naver.maps.Map('map', {
        center: new naver.maps.LatLng(37.3595704, 127.105399),
        zoom: 10
    });
    



function moveMap(len, lat) {
    var mapOptions = {
            center: new naver.maps.LatLng(len, lat),
            zoom: 15,
            mapTypeControl: true
        };
        var map = new naver.maps.Map('map', mapOptions);
        var marker = new naver.maps.Marker({
            position: new naver.maps.LatLng(len, lat),
            map: map
        });
}
    
function insertAddress() {


    // var map = new naver.maps.Map('map', {
    //     center: new naver.maps.LatLng(37.3595704, 127.105399),
    //     zoom: 100
    // });
    var marker = new naver.maps.Marker({
        map: map,
        position: new naver.maps.LatLng(37.3595704, 127.105399),
        icon: {
            // content: '<img src="<c:url value="/focus-bootstrap-main/theme/images/logo-text.png"/>" alt="" style="margin: 0px; padding: 0px; border: 0px solid transparent; display: block; max-width: none; max-height: none; -webkit-user-select: none; position: absolute; width: 32px; height: 32px; left: 0px; top: 0px;">',
            // size: new naver.maps.Size(32, 32),
            // anchor: new naver.maps.Point(16, 32)
            url: '/focus-bootstrap-main/theme/images/marker.png',
            size: { width: 500, height: 500 }
        }
    });
    var marker = new naver.maps.Marker({
        map: map,
        position: new naver.maps.LatLng(37.40477775043365, 126.94888048324393),
        
    });
    var marker = new naver.maps.Marker({
        map: map,
        position: new naver.maps.LatLng(37.26789682108881, 127.43529412436473),
    });
    var marker = new naver.maps.Marker({
        map: map,
        position: new naver.maps.LatLng(37.36210588898155, 126.95035433674495),
    });
    var marker = new naver.maps.Marker({
        map: map,
        position: new naver.maps.LatLng(37.45879032013797, 127.2193863041188),
    });
}
insertAddress()
