
function initDataTables(){
    $.ajax({
        url:"/hr/member/list",
        type: "GET",
        success: function (response){
            $('#vacationList').DataTable({
                "data": response,
                "columns":[
                    {data: "employee_num", title: "사번"},
                    {data: "name", title: "이름"},
                    {data: "nickname", title: "닉네임"},
                    {data: "phone", title: "연락처"},
                    {data: "address", title: "주소"},
                    {data: "dep_code", title: "부서"},
                    {data: "pos_code", title: "직급"},
                    {data: "join_date", title: "입사일"}
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