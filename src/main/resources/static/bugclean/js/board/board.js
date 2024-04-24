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

            $('#page-title').attr('data-target', code);
            fetchAndDisplayBoard(code, 1);
        }
    });

    $('.board-body').on('click', 'tr', function () {
        let board_code = ($(this).attr('data-board-code').trim());
        let cate_code = $('#page-title').attr('data-target');

        let formData = new FormData;
        formData.append("board_code", board_code);
        formData.append("cate_code", cate_code);
        boardDetail(formData);
    })


    $('#creat-board').on('click', function () {
        createBoard(null);
    })

};

const deleteFile = (file_code) => {
    return Swal.fire({
        title: '첨부파일을 삭제 하시겠습니까?',
        text: '삭제하면 첨부파일 관련 정보가 초기화 됩니다.',
        icon: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#3085d6',
        cancelButtonColor: '#d33',
        confirmButtonText: '확인',
        cancelButtonText: '취소'
    }).then((result) => {
        if (result.value) {
            let fileForm = new FormData;
            fileForm.append("file_code", file_code);
            return fetch('board/deleteFile', {
                method: "POST",
                body: fileForm
            }).then(response => {
                if (response.ok) {
                    let board_code = ($('#board-title').attr('data-board-code').trim());
                    createBoard(board_code);
                    return 1;
                } else {
                    return 0;
                }
            });
        }
    });
};

const boardDetail = async (formData) => {
    await fetch("board/detail", {
        method: 'POST',
        body: formData
    }).then(response => {
        return response.text();
    }).then(data => {
        $('.card-body').empty();
        $('.card-body').html(data);
    })

    $('#list-btn').on('click', function () {
        pageLoad();
    })

    $('#update-btn').on('click', function () {
        createBoard(formData.get("board_code"));
    })

}

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
                const {BOARD_CODE, BOARD_TITLE, NAME, BOARD_DATE, BOARD_HIT} = item;
                const newRow = `
                    <tr data-board-code="${BOARD_CODE}">
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

    paginationList.append(`<li class="page-item page-indicator ${pagination.startNum <= 1 ? 'disabled' : ''}"><a class="page-link" onclick="moveToPage(${pagination.startNum - 1}, '${code}', '${search}', '${kind}')"><i class="icon-arrow-left"></i></a></li>`);

    for (let i = pagination.startNum; i <= pagination.lastNum; i++) {
        paginationList.append(`<li class="page-item ${i === pagination.page ? 'active' : ''}"><a class="page-link" onclick="moveToPage(${i}, '${code}', '${search}', '${kind}')">${i}</a></li>`);
    }

    paginationList.append(`<li class="page-item page-indicator ${pagination.lastNum >= pagination.totalPage ? 'disabled' : ''}"><a class="page-link" onclick="moveToPage(${pagination.lastNum + 1}, '${code}', '${search}', '${kind}')"><i class="icon-arrow-right"></i></a></li>`);
};

// 페이지 이동 함수
const moveToPage = (page, code, search, kind) => {
    fetchAndDisplayBoard(code, page, search, kind);
};

const createBoard = async (board_code) => {
    let cate_code = $('#page-title').attr("data-target");
    await $.ajax({
        url: `board/create?cate_code=${cate_code}${board_code == null ? '' : '&board_code=' + board_code}`,
        type: "GET",
        success: function (response) {
            // 서버에서 받은 HTML 코드를 카드 바디에 추가s
            $(".card-body").empty();
            $(".card-body").html(response);
        },
        error: function (xhr, status, error) {
            // 에러 처리
            console.error(xhr.responseText);
        }
    });

    $(".summernote").summernote({
        height: 350,       // 에디터의 높이
        minHeight: 350, // 최소 높이
        maxHeight: 500, // 최대 높이
        focus: true,     // 에디터 로드 후 포커스 여부
        toolbar: [
            // [groupName, [list of button]]
            ['fontsize', ['fontsize']],
            ['font', ['strikethrough', 'superscript', 'subscript']],
            ['style', ['bold', 'italic', 'underline', 'strikethrough', 'clear']],
            ['color', ['forecolor']],
            ['table', ['table']],
            ['para', ['ul', 'ol', 'paragraph']],
            ['insert', ['picture', 'link']],
        ],
        fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New', '맑은 고딕', '궁서', '굴림체', '굴림', '돋움체', '바탕체'],
        fontSizes: ['8', '9', '10', '11', '12', '14', '16', '18', '20', '22', '24', '28', '30', '36', '50', '72'],
        callbacks: {
            onImageUpload: function(files) {
                // 이미지를 서버에 업로드하고 imgNode를 생성하는 코드를 작성합니다.
                    uploadSummerImg(files[0]);
            }
        }
    });

    const uploadSummerImg = (file)=>{
        let imgForm = new FormData;
        imgForm.append("file",file);

        fetch('board/upload/image',{
            method: 'POST',
            body: imgForm
        }).then((response) => {
            // 서버에서 이미지 URL을 받아옴
            return response.text(); // JSON 형태의 응답을 파싱
        }).then((data) => {
            const imgUrl = data; // 서버에서 받은 이미지 URL
            console.log(imgUrl)
            const imgNode = document.createElement('img');
            imgNode.src = imgUrl;
            $('.summernote').summernote('insertNode', imgNode);
        })
    }

    let attachmentCounter = $('#files .attached-index').length;
    let filesCounter = $('#files .input-group').length;
    const maxAttachments = 3;

// 플러스 버튼 클릭 이벤트
    $('#attachment-group').on('click', '.plus-file', function () {
        if (attachmentCounter + filesCounter < maxAttachments) {
            filesCounter++;
            let newAttachmentId = 'attachment-' + filesCounter;
            let newAttachmentHtml = `
    <div class="input-group mb-1" id="${newAttachmentId}">
        <div class="input-group-prepend">
            <span class="input-group-text">첨부파일</span>
        </div>
        <div class="custom-file col">
            <input type="file" class="custom-file-input" id="file-input-${filesCounter}">
            <label class="custom-file-label" for="file-input-${filesCounter}">파일을 선택하세요</label>
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
    $('#attachment-group').on('change', '.custom-file-input', function () {
        let fileName = $(this).val().split('\\').pop();
        $(this).next('.custom-file-label').html(fileName);
    });

// 마이너스 버튼 클릭 이벤트
    $('#attachment-group').on('click', '.minus-file', function () {
        $(`#${$(this).data('target')}`).remove();
        filesCounter--;

        // 첨부파일 갯수에 따라 플러스/마이너스 버튼 활성화/비활성화 설정
        updateButtonStatus();
    });

// 플러스/마이너스 버튼 활성화/비활성화 함수
    function updateButtonStatus() {

        if (attachmentCounter + filesCounter >= maxAttachments) {
            $('.plus-file').prop('disabled', true);
        } else {
            $('.plus-file').prop('disabled', false);
        }

        if (filesCounter <= 1) {
            $('.minus-file').prop('disabled', true);
        } else {
            $('.minus-file').prop('disabled', false);
        }
    }

// 페이지 로드시 버튼 초기화
    updateButtonStatus();

    $('.file-code').on('click', async function () {

        let result = await deleteFile($(this).attr("data-file-code"));

        if (result === 1) {
            attachmentCounter--;
        }
    })

    $('#close-btn').on('click', function () {
        pageLoad()
    });

    $('#delete-btn').on('click', function () {
        Swal.fire({
            title: '게시글을 삭제 하시겠습니까?',
            text: '삭제하면 복구 불가능 합니다.',
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: '확인',
            cancelButtonText: '취소'
        }).then(async (result) => {
            if (result.value) {
                let new_cate_code = $('#page-title').attr("data-target");
                if (new_cate_code === undefined) {
                    new_cate_code = $('.nav-item .active').attr("data-source");
                }
                let board_code = $('#board-title').attr('data-board-code');
                let formDataDel = new FormData;
                formDataDel.append("board_code", board_code);
                formDataDel.append("cate_code", new_cate_code);

                await fetch("board/delete", {
                    method: 'POST',
                    body: formDataDel
                }).then((response) => {
                    if (response.ok) {
                        pageLoad();
                    }
                })
            }
        })
    })


    $('#save-btn').on('click', async (e) => {
        e.preventDefault(); // 기본 동작 방지
        let new_cate_code = $('#page-title').attr("data-target");
        if (new_cate_code === undefined) {
            new_cate_code = $('.nav-item .active').attr("data-source");
        }


        // 제목 입력 값 가져오기
        const title = $('#board-title').val();
        if (title === "") {
            return Swal.fire({
                title: '제목은 필수입력 사항입니다.',
                icon: 'warning',
                showCancelButton: true,
                confirmButtonText: '확인',
                cancelButtonText: '취소',
            })
        }
        // 작성자 정보 가져오기
        const employeeNum = $('#employee_num').val();

        // 에디터 내용 가져오기
        const content = $('.summernote').summernote('code');

        // 첨부 파일 처리
        const files = Array.from($('.custom-file-input')).flatMap(input => [...input.files]);

        // 폼 데이터 객체 생성
        const formData = new FormData();
        formData.append("board_code", $('#board-title').attr('data-board-code'));
        formData.append('cate_code', new_cate_code);
        formData.append('board_title', title);
        formData.append('employee_num', employeeNum);
        formData.append('board_contents', content);
        files.forEach(file => formData.append('files', file));


        try {
            // 서버로 데이터 전송
            const response = await fetch('board/create', {
                method: 'POST',
                body: formData
            });

            if (response.ok) {
                const responseData = await response.json();
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

