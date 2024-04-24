// initDataTables 함수는 데이터 테이블을 초기화하고, 서버로부터 데이터를 가져와 테이블에 채우는 역할을 합니다.
async function initDataTables() {
    try {
        // 서버로부터 데이터 가져오기
        const response = await $.ajax({
            url: "/hr/temp/ask",
            type: "GET"
        });

        // renderSelect 함수는 셀렉트 박스를 렌더링하는 역할을 합니다.
        const renderSelect = function (options, code, name) {
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

        // 테이블 초기화 및 데이터 채우기
        $('#tempList').DataTable({
            "data": response.tempMember,
            "columns": [
                { data: "userName", title: "가입요청 ID" },
                { data: "name", title: "이름" },
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
                        return '<button id="approve-btn" class="btn btn-rounded btn-light btn-xs mr-2">승인</button>' +
                            '<button id="reject-btn" class="btn btn-rounded btn-dark btn-xs">거절</button>';
                    }
                }
            ],
            "language": {
                "paginate": {
                    "previous": '<i class="icon-arrow-left"></i>',
                    "next": '<i class="icon-arrow-right"></i>'
                }
            }
        });

        // 상위 부서 선택 시 팀 셀렉트 박스 업데이트
        $(".upper_dep").change(function () {
            let selectUpper = $(this).val();
            let team = response.commons.dep.filter(item => item.upper_dep_code == selectUpper || item.dep_code == selectUpper);
            let tr = $(this).closest('tr')
            let selectTeam = tr.find(".dep");
            selectTeam.empty();
            selectTeam.append($('<option value="">선택</option>'))
            for (let i = 0; i < team.length; i++) {
                selectTeam.append($('<option>', {
                    value: team[i].dep_code,
                    text: team[i].dep_name
                }))
            }
        });

    } catch (error) {
        // 에러 발생 시 메시지 표시
        $('#tempList').html('<div style="color:red;">데이터를 가져오는 중 오류가 발생했습니다.</div>');
    }
}

// 문서가 준비되면 실행되는 함수
$(document).ready(async function () {
    // 데이터 테이블 초기화 함수 호출
    await initDataTables();

    // 테이블의 버튼 클릭 이벤트 핸들링
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

        // 버튼에 따라 다른 SweetAlert 모달 띄우기
        if ($(this).attr('id') === "approve-btn") {
            // 필수 사항 선택 여부 확인
            if (department == "" || position == "" || state == "") {
                return Swal.fire({
                    title: '필수 사항을 선택하세요',
                    text: '부서, 직급, 계약형태는 필수 선택 입니다.',
                    icon: 'warning',
                    confirmButtonText: '확인'
                });
            }
            // 승인 버튼 클릭 시 SweetAlert 모달 띄우기
            Swal.fire({
                title: '가입을 승인하시겠습니까?',
                text: '',
                icon: 'question',
                showCancelButton: true,
                confirmButtonText: '확인',
                cancelButtonText: '취소',
            }).then((result) => {
                if (result.value) {
                    // 승인 버튼 클릭 시 서버로 데이터 전송
                    $.ajax({
                        url: `/hr/temp/ask`,
                        type: "POST",
                        data: data,
                        success: function () {
                            // 테이블 다시 로드
                            if ($('#tempList').DataTable()) {
                                $('#tempList').DataTable().destroy();
                            }
                            initDataTables();
                        }
                    });
                }
            });
        }
        if ($(this).attr('id') === "reject-btn") {
            // 거절 버튼 클릭 시 SweetAlert 모달 띄우기
            Swal.fire({
                title: '가입을 거절하시겠습니까?',
                text: '요청이 삭제되며, 재가입 신청해야합니다.',
                icon: 'warning',
                showCancelButton: true,
                confirmButtonText: '확인',
                cancelButtonText: '취소',
            }).then((result) => {
                if (result.value) {
                    // 거절 버튼 클릭 시 서버로 데이터 전송
                    $.ajax({
                        url: `/hr/temp/del`,
                        type: "POST",
                        data: data,
                        success: function () {
                            // 테이블 다시 로드
                            if ($('#tempList').DataTable()) {
                                $('#tempList').DataTable().destroy();
                            }
                            initDataTables();
                        }
                    });
                }
            });
        }

    });
});
