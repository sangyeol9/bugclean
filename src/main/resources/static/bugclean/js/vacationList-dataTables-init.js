function initDataTables() {
    let currentYear = new Date().getFullYear();
    $.ajax({
        url: `/hr/vacation/list?year=${currentYear}`,
        type: "GET",
        success: function (response) {
            for (let item of response) {
                item.근속연수 += "년";
                item.총연차일수 = (item.총연차일수 / 8) + `일 (${item.총연차일수})`;
                item.사용연차일수 = (item.사용연차일수 / 8) + `일 (${item.사용연차일수})`;
                item.잔여연차일수 = (item.잔여연차일수 / 8) + `일 (${item.잔여연차일수})`;
            }
            $('#vacationList').DataTable({
                "data": response,
                "columns": [
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
        error: function (jqXHR, textStatus, errorThrown) {
            $('#tempList').html('<div style="color:red;">데이터를 가져오는 중 오류가 발생했습니다.</div>');
        }
    })
}

$(document).ready(async function () {
    await initDataTables(); // 데이터 테이블 초기화
    $('#yearSelect').select2({
        placeholder: 'Select Year', // 플레이스홀더 설정
        width: '20%', // 셀렉트 박스의 너비 설정
        minimumResultsForSearch: Infinity
    });
    let currentYear = new Date().getFullYear();
    $('#yearSelect').val(currentYear).trigger('change');
    $('#yearSelect').on('change', async function () {
        // 데이터 테이블의 데이터를 삭제하지 않고 업데이트
        let table = $('#vacationList').DataTable();
        let newData = await getData(); // 새로운 데이터 가져오기
        table.clear().rows.add(newData).draw(); // 데이터 업데이트
    });
});

async function getData() {
    // 새로운 데이터를 가져오는 비동기 함수
    let response = await $.ajax({
        url: "/hr/vacation/list?year=" + $('#yearSelect').val(),
        type: "GET"
    });
    for (let item of response) {
        item.근속연수 += "년";
        item.총연차일수 = (item.총연차일수 / 8) + `일 (${item.총연차일수})`;
        item.사용연차일수 = (item.사용연차일수 / 8) + `일 (${item.사용연차일수})`;
        item.잔여연차일수 = (item.잔여연차일수 / 8) + `일 (${item.잔여연차일수})`;
    }
    return response;
}