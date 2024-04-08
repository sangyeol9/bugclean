
function initDataTables(){
    $.ajax({
        url:"/hr/vacation/list",
        type: "GET",
        success: function (response){
            console.log(response);
            for (let item of response) {
                item.근속연수 += "년";
                item.총연차일수 = (item.총연차일수 / 8) + `일 (${item.총연차일수})`;
                item.사용연차일수 = (item.사용연차일수 / 8) + `일 (${item.사용연차일수})`;
                item.잔여연차일수 = (item.잔여연차일수 / 8) + `일 (${item.잔여연차일수})`;
            }
            console.log(response);

            $('#vacationList').DataTable({
                "data": response,
                "columns":[
                    {data: "사번", title: "사번"},
                    {data: "이름", title: "이름"},
                    {data: "총연차일수", title: "총연차일수(시간)"},
                    {data: "사용연차일수", title: "사용연차일수(시간)"},
                    {data: "잔여연차일수", title: "잔여연차일수(시간)"},
                    {data: "근속연수", title: "근속연수"},
                    {data: "부서", title: "부서"}
                ]
            })
        },
        error: function(jqXHR, textStatus, errorThrown) {
            $('#tempList').html('<div style="color:red;">데이터를 가져오는 중 오류가 발생했습니다.</div>');
        }
    })
}

$(document).ready(async function (){
    await initDataTables();
})