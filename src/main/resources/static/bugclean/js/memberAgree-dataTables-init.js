function initDataTables() {
    $.ajax({
        url: "/hr/temp/ask",
        type: "GET",
        success: function (response) {
            let renderSelect = function (options, code, name) {
                let select = `<select name='${name}'>`;
                if (name === "dep") {
                    select = `<select class="dep" name='${name}'><option value="">부서선택</option>`;
                }
                if (name === "upper_dep") {
                    select = `<select class="upper_dep" name='${name}'>`;
                }
                if (name === "rnr") {
                    select += '<option value="99">선택</option>' +
                        '<option value="">팀원</option>'; // 기본 선택 옵션
                } else {
                    select += '<option value="">선택</option>'; // 기본 선택 옵션
                }
                for (let i = 0; i < options.length; i++) {
                    select += `<option value="${code[i]}">${options[i]}</option>`;
                }
                select += '</select>';
                return select;
            }

            $('#tempList').DataTable({
                "data": response.tempMember,
                "columns": [
                    {data: "userName", title: "가입요청 ID"},
                    {data: "name", title: "가입요청 사원"},
                    {
                        data: "upper_department",
                        title: "부서",
                        orderable: false,
                        render: function (data, type, row) {
                            let filter = response.commons.dep.filter(item => item.upper_dep_code === 1);
                            let upOptions = filter.map(item => item.dep_name);
                            let upCodes = filter.map(item => item.dep_code);
                            return renderSelect(upOptions, upCodes, "upper_dep");
                        }
                    },
                    {
                        data: "department",
                        title: "팀",
                        orderable: false,
                        render: function (data, type, row) {
                            return renderSelect([], [], "dep");
                        }
                    },
                    {
                        data: "rank",
                        title: "직급",
                        orderable: false,
                        render: function (data, type, row) {
                            let posOptions = response.commons.pos.map(item => item.pos_name);
                            let posCodes = response.commons.pos.map(item => item.pos_code);
                            return renderSelect(posOptions, posCodes, "pos");
                        }
                    },
                    {
                        data: "state",
                        title: "계약형태",
                        orderable: false,
                        render: function (data, type, row) {
                            let stateOptions = ["계약직", "정규직"];
                            let stateCodes = [0, 1];
                            return renderSelect(stateOptions, stateCodes, "state");
                        }
                    },
                    {
                        orderable: false,
                        render: function (data, type, row) {
                            return '<button id="approve-btn" class="btn btn-rounded btn-light btn-xs mr-2">' +
                                "승인" +
                                '</button>' +
                                '<button id="reject-btn" class="btn btn-rounded btn-dark btn-xs">' +
                                "거절" +
                                '</button>';
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

            $(".upper_dep").change(function () {
                let selectUpper = $(this).val();
                let team = response.commons.dep.filter(item => item.upper_dep_code == selectUpper||item.dep_code == selectUpper);
                let tr = $(this).closest('tr')
                let selectTeam = tr.find(".dep");
                selectTeam.empty();
                selectTeam.append($('<option value="">선택</option>'))
                for(let i=0;i<team.length;i++){
                    selectTeam.append($('<option>', {
                        value: team[i].dep_code,
                        text: team[i].dep_name
                    }))
                }
            })

        },
        error: function (jqXHR, textStatus, errorThrown) {
            $('#tempList').html('<div style="color:red;">데이터를 가져오는 중 오류가 발생했습니다.</div>');
        }
    })
}

$(document).ready(async function () {
    await initDataTables();

    $("#tempList tbody").on('click', 'button', function (event) {
        let tr = $(this).closest('tr');
        let table = $("#tempList").DataTable();
        let rowData = table.row(tr).data();
        let department = tr.find('select[name="dep"]').val(); // 부서 셀렉트 박스의 값 가져오기
        let position = tr.find('select[name="pos"]').val(); // 직급 셀렉트 박스의 값 가져오기
        let state = tr.find('select[name="state"]').val(); // 직급 셀렉트 박스의 값 가져오기

        let data = {
            username: rowData.userName,
            name: rowData.name,
            dep_code: department,
            pos_code: position,
            type_code: state
        };

        if (department == "" || position == "" || state == "") {
            return alert("부서, 직급, 계약형태는 필수 선택 입니다.")
        }

        if (confirm("정말 가입을 승인하시겠습니까?")) {
            console.log(data);

            $.ajax({
                url: `/hr/temp/ask`,
                type: "POST",
                data: data
            });
        }

    });
})