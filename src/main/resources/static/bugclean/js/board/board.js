// readBoard 함수 수정
const readBoard = (code) => {
    return fetch(`board/list?code=${code}`)
        .then(response => response.json())
        .then(data => {
            let tbody = $(`#list-${code} tbody`);
            tbody.empty();
            data.forEach(item => {
                const { BOARD_CODE, BOARD_TITLE, NAME, BOARD_DATE, BOARD_HIT } = item;
                const newRow = `
                    <tr>
                        <td>${BOARD_CODE}</td>
                        <td>${BOARD_TITLE}</td>
                        <td>${NAME}</td>
                        <td>${BOARD_DATE}</td>
                        <td>${BOARD_HIT}</td>
                    </tr>
                `;
                tbody.append(newRow);
            });
        })
        .catch(error => {
            console.error('Error:', error);
        });
};

// Search 함수 수정
const Search = (code, search, kind) => {
    return fetch(`board/list?code=${code}&search=${search}&kind=${kind}`)
        .then(response => response.json())
        .then(data => {
            let tbody = $(`#list-${code} tbody`);
            tbody.empty();
            if (data.length === 0) {
                const noResultRow = `
                    <tr>
                        <td colspan="5">검색 결과가 없습니다.</td>
                    </tr>
                `;
                tbody.append(noResultRow);
                return;
            }
            data.forEach(item => {
                const { BOARD_CODE, BOARD_TITLE, NAME, BOARD_DATE, BOARD_HIT } = item;
                const newRow = `
                    <tr>
                        <td>${BOARD_CODE}</td>
                        <td>${BOARD_TITLE}</td>
                        <td>${NAME}</td>
                        <td>${BOARD_DATE}</td>
                        <td>${BOARD_HIT}</td>
                    </tr>
                `;
                tbody.append(newRow);
            });
        })
        .catch(error => {
            console.error('Error:', error);
        });
};

// 클릭 이벤트 핸들러 수정
$('.nav-link').on('click', function () {
    if (!$(this).hasClass('active')) {
        $('#page-title').fadeOut(200);
        $('#page-title').html("&ensp;" + $(this).text()).fadeIn(100);
        $('#title-a').html($(this).text());
        $('#search').val("");
        const code = $(this).attr('data-source');
        console.log(code);
        readBoard(code);
    }
});

// 검색 버튼 클릭 이벤트 핸들러 수정
$('#search-btn').on('click', function () {
    const code = $('.active').attr('data-source');
    const search = $('#search').val();
    const kind = $('#kind').val();
    console.log(code);
    Search(code, search, kind);
});

// 페이지 로드 시 초기 데이터 로드
const initialCode = $('.active').attr('data-source');
let showTable = $(`#list-${initialCode}`);
if (!showTable.hasClass('show')) {
    $('#list-1').removeClass('show').removeClass('active');
    showTable.addClass('show').addClass('active');
}
console.log("초기코드: {}", initialCode)
readBoard(initialCode);
