


function initDataTables(){
    $.ajax({
        url:"/hr/temp/ask",
        type: "GET",
        success: function (response){
            let renderSelect = function (options) {
                let select = '<select>';
                select += '<option value="">선택</option>'; // 기본 선택 옵션
                options.forEach(option => {
                    select += '<option value="' + option + '">' + option + '</option>';
                });
                select += '</select>';
                return select;
            }

            $('#tempList').DataTable({
                "data": response.tempMember,
                "columns":[
                    {data: "userName", title: "가입요청 ID"},
                    {data: "name", title: "가입요청 사원"},
                    {
                        data: null,
                        title: "부서",
                        orderable: false,
                        render: function(data, type, row) {
                            return renderSelect(response.commons.dep);
                        }
                    },
                    {
                        data: null,
                        title: "직책",
                        orderable: false,
                        render: function(data, type, row) {
                            return renderSelect(response.commons.rnr);
                        }
                    },
                    {
                        data: null,
                        title: "직급",
                        orderable: false,
                        render: function(data, type, row) {
                            return renderSelect(response.commons.pos);
                        }
                    }
                ],
                "language": {
                    "paginate": {
                        "previous": '<i class="icon-arrow-left"></i>',
                        "next": '<i class="icon-arrow-right"></i>'
                    }
                }
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