// initDataTables 함수는 데이터 테이블을 초기화하고, 서버로부터 데이터를 가져와 테이블에 채우는 역할을 합니다.
 const initDataTables = async ()=> {
    try {
        // 서버로부터 데이터 가져오기
        const response = await $.ajax({
            url: "/general/carManage/list",
            type: "GET"
        });

        // 가져온 데이터를 데이터 테이블로 변환하여 표시
        $('#carManageList').DataTable({
            "data": response.data,
            "columns": [
                { data: "MANAGE_CODE", title: "신청번호" },
                { data: "NAME", title: "배차신청 사원" },
                { data: "DEP_NAME", title: "신청부서" },
                { data: "CAR_NUM", title: "신청차량" },
                { data: "BOOKING_START", title: "신청일시" },
                { data: "BOOKING_DONE", title: "종료일시" },
                {
                    orderable: false,
                    render: function (data, type, row) {
                        return `<button id="approve-btn" class="btn btn-rounded btn-light btn-xs mr-2">승인</button>
                                <button id="reject-btn" class="btn btn-rounded btn-dark btn-xs">거절</button>`;
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
    } catch (error) {
        // 에러 발생 시 메시지 표시
        $('#carManageList').html('<div style="color:red;">데이터를 가져오는 중 오류가 발생했습니다.</div>');
    }
}

// 문서가 준비되면 실행되는 함수
$(document).ready(async function () {
    // 데이터 테이블 초기화 함수 호출
    await initDataTables();

    // 테이블의 버튼 클릭 이벤트 핸들링
    $("#carManageList tbody").on('click', 'button', function () {
        let tr = $(this).closest('tr');
        let table = $("#carManageList").DataTable();
        let rowData = table.row(tr).data();

        let data = {
            manage_code: rowData.MANAGE_CODE,
            booking_agree: 1
        };

        // 버튼에 따라 다른 SweetAlert 모달 띄우기
        if ($(this).attr('id') === "approve-btn") {
            Swal.fire({
                title: '배차를 승인하시겠습니까?',
                text: '',
                icon: 'question',
                showCancelButton: true,
                confirmButtonText: '확인',
                cancelButtonText: '취소',
            }).then((result) => {
                if (result.value) {
                    // 승인 버튼 클릭 시 서버로 데이터 전송
                    $.ajax({
                        url: `/general/carManage`,
                        type: "POST",
                        data: data,
                        success: function () {
                            // 테이블 다시 로드
                            if ($('#carManageList').DataTable()) {
                                $('#carManageList').DataTable().destroy();
                            }
                            initDataTables();
                        }
                    });
                }
            });
        }
        if ($(this).attr('id') === "reject-btn") {
            Swal.fire({
                title: '배차를 거절하시겠습니까?',
                text: '요청이 삭제되며, 배차를 재신청해야합니다.',
                icon: 'warning',
                showCancelButton: true,
                confirmButtonText: '확인',
                cancelButtonText: '취소',
            }).then((result) => {
                if (result.value) {
                    // 거절 버튼 클릭 시 서버로 데이터 전송
                    $.ajax({
                        url: `/general/carManage/delete`,
                        type: "POST",
                        data: data,
                        success: function () {
                            // 테이블 다시 로드
                            if ($('#carManageList').DataTable()) {
                                $('#carManageList').DataTable().destroy();
                            }
                            initDataTables();
                        }
                    });
                }
            });
        }

    });
});
