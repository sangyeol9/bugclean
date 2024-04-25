function initDataTables(data) {
    $('#salaryList').DataTable({
        "data": data,
        "columns": [
            {data: "EMPLOYEE_NUM", title: "사번"},
            {data: "NAME", title: "이름"},
            {data: "SALARY_ACCOUNT", title: "급여계좌번호"},
            {data: "SALARY_BANK", title: "급여은행"},
            {data: "SALARY_PAY", title: "연봉금액"},
            {data: "DEP_NAME", title: "부서"},
        ],
        "language": {
            "paginate": {
                "previous": '<i class="icon-arrow-left"></i>',
                "next": '<i class="icon-arrow-right"></i>'
            }
        }
    })
}

const saveData = {}; //비동기 통신으로 가져온 데이터를 저장하는 객체
async function getData(year) {

    if(saveData[year]){
        return saveData[year]; //해당하는 연도를 통신으로 데이터를 가져온적 있으면 해당 데이터를 리턴
    }

    // 새로운 데이터를 가져오는 비동기 함수
    let response = await $.ajax({
        url: "/hr/salary/list?year=" + $('#yearSelect').val(),
        type: "GET"
    });
    for (let item of response) {
        item.SALARY_PAY += "만원";
    }
    saveData[year] = response; //비동기 통신으로 가져온 데이터를 해당연도 데이터로 저장
    console.log(response);
    return response;
}

$(document).ready(async function () {
    let year = $('#yearSelect').val();
    let data = await getData(year);
    $('#yearSelect').select2({
        placeholder: 'Select Year', // 플레이스홀더 설정
        width: '20%', // 셀렉트 박스의 너비 설정
        minimumResultsForSearch: Infinity //셀렉트 박스 검색창 표기 설정
    });
    let currentYear = new Date().getFullYear();
    $('#yearSelect').val(currentYear).trigger('change');
    $('#yearSelect').on('change', async function () {
        let table = $('#salaryList').DataTable()
        year = $('#yearSelect').val();
        let newData = await getData(year); // 새로운 데이터 가져오기
        table.clear().rows.add(newData).draw(); // 데이터 업데이트
    });
    initDataTables(data); // 데이터 테이블 초기화
});

