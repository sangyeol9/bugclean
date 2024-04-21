// 게시판 데이터를 가져와 화면에 표시하는 함수
const pageLoad = async () => {
    let cate_code = $('#page-title').attr('data-target');
    await $.ajax({
        url: `board/mainPage?cate_code=${cate_code}`,
        type: "GET",
        success: function (response) {
            // 서버에서 받은 HTML 코드를 카드 바디에 추가
            $(".card-body").empty();
            $(".card-body").html(response);
        },
        error: function (xhr, status, error) {
            // 에러 처리
            console.error(xhr.responseText);
        }
    })

    const initialCode = $('.active').attr('data-source');
    const showTable = $(`#list-${initialCode}`);
    if (!showTable.hasClass('show')) {
        $('#list-1').removeClass('show').removeClass('active');
        showTable.addClass('show').addClass('active');
    }
    console.log("초기코드: {}", initialCode)

    fetchAndDisplayBoard(initialCode, 1);

    // 검색 버튼 클릭 이벤트 핸들러
    $('#search-btn').on('click', function () {
        const code = $('.active').attr('data-source');
        const search = $('#search').val();
        const kind = $('#kind').val();
        fetchAndDisplayBoard(code, 1, search, kind);
    });

// 검색 input 요소에 대한 keypress 이벤트 핸들러 추가
    $('#search').on('keypress', function (event) {
        if (event.keyCode === 13) {
            $('#search-btn').click();
        }
    });

    // 메뉴 클릭 이벤트 핸들러
    $('.nav-link').on('click', function () {
        if (!$(this).hasClass('active')) {
            $('#page-title').fadeOut(200).html("&ensp;" + $(this).text()).fadeIn(100);
            $('#title-a').html($(this).text());
            $('#search').val("");
            const code = $(this).attr('data-source');
            console.log(code)
            $('#page-title').attr('data-target',code);
            fetchAndDisplayBoard(code, 1);
        }
    });



    $('#creat-board').on('click',function (){
        createBoard();
    })
};

const fetchAndDisplayBoard = (code, page, search = '', kind = '') => {
    let url = `board/list?code=${code}&page=${page}`;
    if (search !== '' && kind !== '') {
        url += `&search=${search}&kind=${kind}`;
    }

    return fetch(url)
        .then(response => response.json())
        .then(data => {
            const tbody = $(`#list-${code} tbody`);
            tbody.empty();

            if (data.boardList.length === 0) {
                const noResultRow = `<tr><td colspan="5">검색 결과가 없습니다.</td></tr>`;
                tbody.append(noResultRow);
                return;
            }

            data.boardList.forEach(item => {
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

            createPager(data.pagination, code, search, kind);
        })
        .catch(error => {
            console.error('Error:', error);
        });
};

// 페이지 인디케이터 생성 함수
const createPager = (pagination, code, search, kind) => {
    const paginationList = $('.pagination');
    paginationList.empty();

    paginationList.append(`<li class="page-item page-indicator ${pagination.startNum<=1 ? 'disabled' : ''}"><a class="page-link" onclick="moveToPage(${pagination.startNum-1}, '${code}', '${search}', '${kind}')"><i class="icon-arrow-left"></i></a></li>`);

    for (let i = pagination.startNum; i <= pagination.lastNum; i++) {
        paginationList.append(`<li class="page-item ${i === pagination.page ? 'active' : ''}"><a class="page-link" onclick="moveToPage(${i}, '${code}', '${search}', '${kind}')">${i}</a></li>`);
    }

    paginationList.append(`<li class="page-item page-indicator ${pagination.lastNum>=pagination.totalPage ? 'disabled' : ''}"><a class="page-link" onclick="moveToPage(${pagination.lastNum+1}, '${code}', '${search}', '${kind}')"><i class="icon-arrow-right"></i></a></li>`);
};

// 페이지 이동 함수
const moveToPage = (page, code, search, kind) => {
    fetchAndDisplayBoard(code, page, search, kind);
};

const createBoard = async () => {
    let cate_code = $('#page-title').attr("data-target");
    await $.ajax({
        url: `board/create?cate_code=${cate_code}`,
        type: "GET",
        success: function (response) {
            // 서버에서 받은 HTML 코드를 카드 바디에 추가
            $(".card-body").empty();
            $(".card-body").html(response);
        },
        error: function (xhr, status, error) {
            // 에러 처리
            console.error(xhr.responseText);
        }
    });
    // 일반 에디터 설정
    $(".summernote").summernote({
        height: 600,     // 에디터의 높이
        minHeight: 600, // 최소 높이 (null로 설정하면 제한 없음)
        maxHeight: 900, // 최대 높이 (null로 설정하면 제한 없음)
        focus: true     // 에디터 로드 후 포커스 여부
    });

    let attachmentCounter = $('#attachment-group .input-group').length;
    const maxAttachments = 3;

// 플러스 버튼 클릭 이벤트
    $('#attachment-group').on('click', '.plus-file', function() {
        if (attachmentCounter < maxAttachments) {
            attachmentCounter++;
            let newAttachmentId = 'attachment-' + attachmentCounter;
            let newAttachmentHtml = `
    <div class="input-group mb-1" id="${newAttachmentId}">
        <div class="input-group-prepend">
            <span class="input-group-text">첨부파일</span>
        </div>
        <div class="custom-file col">
            <input type="file" class="custom-file-input" id="file-input-${attachmentCounter}">
            <label class="custom-file-label" for="file-input-${attachmentCounter}">파일을 선택하세요</label>
        </div>
        <div class="input-group-append">
            <button type="button" class="btn btn-sm btn-dark plus-file" >+</button>
            <button type="button" class="btn btn-sm btn-dark minus-file" data-target="${newAttachmentId}">−</button>
        </div>
    </div>`;
            $('#attachment-group').append(newAttachmentHtml);

            // 첨부파일 갯수에 따라 플러스/마이너스 버튼 활성화/비활성화 설정
            updateButtonStatus();
        }
    });

// 파일 선택 시 라벨 변경 이벤트
    $('#attachment-group').on('change', '.custom-file-input', function() {
        let fileName = $(this).val().split('\\').pop();
        $(this).next('.custom-file-label').html(fileName);
    });

// 마이너스 버튼 클릭 이벤트
    $('#attachment-group').on('click', '.minus-file', function() {
        $(`#${$(this).data('target')}`).remove();
        attachmentCounter--;

        // 첨부파일 갯수에 따라 플러스/마이너스 버튼 활성화/비활성화 설정
        updateButtonStatus();
    });

// 플러스/마이너스 버튼 활성화/비활성화 함수
    function updateButtonStatus() {
        if (attachmentCounter >= maxAttachments) {
            $('.plus-file').prop('disabled', true);
        } else {
            $('.plus-file').prop('disabled', false);
        }

        if (attachmentCounter <= 1) {
            $('.minus-file').prop('disabled', true);
        } else {
            $('.minus-file').prop('disabled', false);
        }
    }

// 페이지 로드시 버튼 초기화
    updateButtonStatus();

    $('#close-btn').on('click',function (){
        pageLoad()
    });

    $('#save-btn').on('click', async (e) => {
        e.preventDefault(); // 기본 동작 방지
        let new_cate_code = $('#page-title').attr("data-target");
        if(new_cate_code===undefined){
            new_cate_code = $('.nav-item .active').attr("data-source");
        }
        console.log(new_cate_code)
        // 제목 입력 값 가져오기
        const title = $('#board-title').val();

        // 작성자 정보 가져오기
        const employeeNum = $('#employee_num').val();

        // 에디터 내용 가져오기
        const content = $('.summernote').summernote('code');

        // 첨부 파일 처리
        const files = Array.from($('.custom-file-input')).flatMap(input => [...input.files]);

        // 폼 데이터 객체 생성
        const formData = new FormData();
        formData.append('cate_code', new_cate_code);
        formData.append('board_title', title);
        formData.append('employee_num', employeeNum);
        formData.append('board_contents', content);
        files.forEach(file => formData.append('files', file));

        console.log(formData)

        try {
            // 서버로 데이터 전송
            const response = await fetch('board/create', {
                method: 'POST',
                body: formData
            });

            if (response.ok) {
                const responseData = await response.json();
                console.log('Data successfully sent:', responseData);
                // 성공 메시지 표시 또는 리다이렉션 등의 후속 작업 수행
                await pageLoad();
            } else {
                console.error('Error:', response.statusText);
                // 에러 메시지 표시 또는 다른 처리 수행
            }
        } catch (error) {
            console.error('Error:', error);
            // 에러 메시지 표시 또는 다른 처리 수행
        }
    });

}

// 페이지 로드 시 초기 데이터 로드
$(document).ready(async function() {
    await pageLoad();


});
