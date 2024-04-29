// 직원 목록을 불러와 DataTable에 표시하는 함수
function propertyList(code) {
    $.ajax({
        url: `/general/property/list?code=${code}`,
        type: "GET",
        success: function (response) {
            $(`#propertyList-${code}`).DataTable({
                "data": response.data,
                "columns": [
                    {data: "CAR_CODE", title: "자산번호"},
                    {data: "CAR_NUM", title: "차량번호"},
                    {data: "TYPE_NAME", title: "차량종류"},
                    {data: "CAR_STATUS", title: "운용상태"},
                    {data: "PRO_INT_DATE", title: "등록날짜"},
                    {data: "CAR_TYPE", visible: false}
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
            $(`#propertyList-${code}`).html('<div style="color:red;">데이터를 가져오는 중 오류가 발생했습니다.</div>');
        }
    })
}


$(document).ready(async function () {
    // 페이지 로드 시 직원 목록과 퇴사 직원 목록을 표시
    await propertyList(100);

    const modiBtn = $('#modi-btn');
    const saveBtn = $('#save-btn');
    const selects = $('.custom-select');
    const carNum = $('#car_num');
    const proName = $('#pro_name')
    const fireBtn = $('#fire-btn');

    // 수정 버튼 클릭 시 수정 입력 필드 활성화
    modiBtn.on('click', function (){
        modiBtn.prop('hidden', true);
        saveBtn.prop('hidden', false);
        selects.prop('disabled', false);
        carNum.removeClass('user_name').prop('disabled', false);
        proName.removeClass('user_name').prop('disabled', false);
    });

    let checkModi = false;

    // 입력 필드 변경 시 수정 여부 체크
    selects.on('change',function (){
        checkModi = true;
    });

    carNum.on('change', function (){
        checkModi = true;
    });

    // 저장 버튼 클릭 시 수정된 정보 서버에 전송
    saveBtn.on('click', function (){
        $('#property-modal').modal('hide');
        let data = {
            CAR_CODE: $('#car_code').html(),
            CAR_NUM: $('#car_num').val(),
            CAR_STATUS: $('#car_status').val(),
            CAR_TYPE: $('#car_type').val()
        };
        if(checkModi) {
            fetch(`/general/carUpdate`, {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify(data)
            }).then(response => {
                if (response.ok) {
                    if ($('#propertyList-100').DataTable()) {
                        $('#propertyList').DataTable().destroy();
                    }
                    // 데이터 테이블 다시 초기화
                    propertyList(100);
                }
            })
        }
    });

    // 퇴사 버튼 클릭 시 직원 퇴사 처리
    fireBtn.on('click', function () {
        Swal.fire({
            title: '해당 자산을 삭제처리 하시겠습니까?',
            text: '삭제하면 복구할 수 없습니다.',
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: '확인',
            cancelButtonText: '취소'
        }).then((result) => {
            if (result.value) {
                $('#property-modal').modal('hide');

                let data = {
                    CAR_CODE: $('#car_code').html()
                };

                fetch(`/general/carDelete`, {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/json'
                    },
                    body: JSON.stringify(data)
                }).then(response => {
                    if (response.ok) {
                        if ($('#propertyList-100').DataTable()) {
                            $('#propertyList-100').DataTable().destroy();
                        }
                        // 데이터 테이블 다시 초기화
                        propertyList(100);
                    }
                });
            }
        });
    });

    // 직원 목록 테이블에서 행 클릭 시 모달에 직원 상세 정보 표시
    $('.property tbody').on('click', 'tr', function() {
        let id = $(this).parent().parent().attr('id');
        console.log("부모아이디:",id);
        $('#property-modal').modal('show');

        if (!$(`#${id}`).hasClass("show")) {
            saveBtn.prop('hidden', true);
            modiBtn.prop('hidden', false);
            selects.prop('disabled', true);
            $('#fire-btn').prop('hidden',false);
            carNum.addClass('user_name').prop('disabled', true);
            proName.addClass('user_name').prop('disabled', true);
        }

        let tr = $(this);
        let table = $(`#${id}`).DataTable();
        let rowData = table.row(tr).data();
        console.log(rowData);
        if(id === 'propertyList-100'){
            $("#car_code").html(rowData.CAR_CODE);
            $("#pro_name").val(rowData.PROPERTY_NAME);
            $("#car_num").val(rowData.CAR_NUM);
            $("#car_status").val(`${(rowData.CAR_STATUS === "운용가능" ? 0 : 1)}`);
            $("#car_type").val(rowData.CAR_TYPE);
            $("#join_date").html(rowData.PRO_INT_DATE);
        }
    });

    $('#car-add').on('click',function (){
        $('#property-modal').modal('show');
        $('#car_num').removeClass('user_name').prop('disabled', false);
        $('#pro_name').removeClass('user_name').prop('disabled', false);
        $('.custom-select').prop('disabled', false);
        $('#modi-btn').prop('hidden',true)
        $('#save-btn').prop('hidden',false);
        $('#fire-btn').prop('hidden',true);
        if(id === 'propertyList-100'){
            $("#car_code").html("");
            $("#pro_name").val("");
            $("#car_num").val("");
            $("#car_status").val(0);
            $("#car_type").val(0);
            $("#join_date").html("");
        }
    })
});
