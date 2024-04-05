
let renderSelect = function (options) {
    let select = '<select>';
    select += '<option value="">선택</option>'; // 기본 선택 옵션
    options.forEach(option => {
        select += '<option value="' + option + '">' + option + '</option>';
    });
    select += '</select>';
    return select;
}

function initDataTables(){
    $.ajax({
        url:"/hr/temp/ask",
        type: "GET",
        success: function (response){
            $('#tempList').DataTable({
                "data": response[0].tempMember,
                "columns":[
                    {data: "userName", title: "가입요청 ID"},
                    {data: "name", title: "가입요청 사원"},
                    {
                        data: null,
                        title: "부서",
                        orderable: false,
                        render: function(data, type, row) {
                            // 여기에 셀렉트 인풋을 생성하는 로직을 작성합니다.
                            // 예를 들어, 셀렉트 박스를 생성하고 데이터를 채워넣을 수 있습니다.
                            return renderSelect(response[1].dep);
                        }
                    },
                    {
                        data: null,
                        title: "직책",
                        orderable: false,
                        render: function(data, type, row) {
                            // 여기에 셀렉트 인풋을 생성하는 로직을 작성합니다.
                            // 예를 들어, 셀렉트 박스를 생성하고 데이터를 채워넣을 수 있습니다.
                            return renderSelect(response[1].pos);
                        }
                    },
                    {
                        data: null,
                        title: "직급",
                        orderable: false,
                        render: function(data, type, row) {
                            // 여기에 셀렉트 인풋을 생성하는 로직을 작성합니다.
                            // 예를 들어, 셀렉트 박스를 생성하고 데이터를 채워넣을 수 있습니다.
                            return renderSelect(response[1].rnr);
                        }
                    }
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