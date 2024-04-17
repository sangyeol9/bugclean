function memberList() {
    $.ajax({
        url: "/hr/member/list",
        type: "GET",
        success: function (response) {
            $('#memberList').DataTable({
                "data": response,
                "columns": [
                    {data: "EMPLOYEE_NUM", title: "사번"},
                    {data: "NAME", title: "이름"},
                    {data: "NICKNAME", title: "닉네임"},
                    {data: "PHONE", title: "연락처"},
                    {data: "ADDRESS", title: "주소"},
                    {data: "DEP_NAME", title: "부서"},
                    {data: "POS_NAME", title: "직급"},
                    {data: "JOIN_DATE", title: "입사일"}
                ],
                "language": {
                    "paginate": {
                        "previous": '<i class="icon-arrow-left"></i>',
                        "next": '<i class="icon-arrow-right"></i>'
                    }
                }
            })
        },
        error: function (jqXHR, textStatus, errorThrown) {
            $('#memberList').html('<div style="color:red;">데이터를 가져오는 중 오류가 발생했습니다.</div>');
        }
    })
}

function resignationList() {
    $.ajax({
        url: "/hr/resignation/list",
        type: "GET",
        success: function (response) {
            console.log(response);
            $('#possibleList').DataTable({
                "data": response.possible,
                "columns": [
                    {data: "EMPLOYEE_NUM", title: "사번"},
                    {data: "NAME", title: "이름"},
                    {data: "NICKNAME", title: "닉네임"},
                    {data: "PHONE", title: "연락처"},
                    {data: "ADDRESS", title: "주소"},
                    {data: "DEP_NAME", title: "부서"},
                    {data: "POS_NAME", title: "직급"},
                    {data: "JOIN_DATE", title: "입사일"},
                    {data: "RETIRED_DATE", title: "퇴사일"},
                    {
                        orderable: false,
                        render: function (data, type, row) {
                            return '<button id="restore-btn" class="btn btn-rounded btn-light btn-xs mr-2">' +
                                "복구" +
                                '</button>';
                        }
                    }
                ]
            })

            $('#impossibleList').DataTable({
                "data": response.impossible,
                "columns": [
                    {data: "EMPLOYEE_NUM", title: "사번"},
                    {data: "NAME", title: "이름"},
                    {data: "NICKNAME", title: "닉네임"},
                    {data: "PHONE", title: "연락처"},
                    {data: "ADDRESS", title: "주소"},
                    {data: "DEP_NAME", title: "부서"},
                    {data: "POS_NAME", title: "직급"},
                    {data: "JOIN_DATE", title: "입사일"},
                    {data: "RETIRED_DATE", title: "퇴사일"}
                ]
            })
        },
        error: function (jqXHR, textStatus, errorThrown) {
            $('#possibleList').html('<div style="color:red;">데이터를 가져오는 중 오류가 발생했습니다.</div>');
            $('#impossibleList').html('<div style="color:red;">데이터를 가져오는 중 오류가 발생했습니다.</div>');
        }
    })
}


$(document).ready(async function () {
    await memberList();
    await resignationList();

    $('#memberList tbody').on('click', 'tr', function() {
        $('#EmployeeModalCenter').modal('show');
        let tr = $(this);
        let table = $("#memberList").DataTable();
        let rowData = table.row(tr).data();
        console.log(rowData);
    });

    $("#possibleList tbody").on('click', 'button', function (event) {
        let tr = $(this).closest('tr');
        let table = $("#possibleList").DataTable();
        let rowData = table.row(tr).data();
        let data = {
            employee_num: rowData.EMPLOYEE_NUM
        }
        if ($(this).attr('id') === "restore-btn") {
            if (confirm("정말 복구하시겠습니까?")) {
                $.ajax({
                    url: `/hr/resignation/update`,
                    type: "POST",
                    data: data,
                    success: function (){
                        if ($('#possibleList').DataTable()) {
                            $('#possibleList').DataTable().destroy();
                            $('#impossibleList').DataTable().destroy();
                            console.log("=========={}=========",data)
                        }
                        // 데이터 테이블 다시 초기화
                        resignationList();
                    }
                });
            }
        }
    })
})