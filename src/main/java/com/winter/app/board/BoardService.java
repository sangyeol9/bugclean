package com.winter.app.board;

import com.winter.app.util.commons.FileManager;
import com.winter.app.util.pagination.Pagination;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
@Slf4j
public class BoardService {

    @Autowired
    BoardDAO boardDAO;

    @Value("${app.upload.basePath}")
    private String uploadPath;

    @Autowired
    FileManager fileManager;

    public List<BoardCateVO> getCateList() throws Exception {
        return boardDAO.getCateList();
    }

    public Map<String, Object> getBoardList(Pagination pagination) throws Exception {

        Long totalCount = boardDAO.getTotalCount(pagination);
        pagination.makeNum(totalCount);
        pagination.makeRow();

        Map<String, Object> map = new HashMap<>();
        map.put("boardList",boardDAO.getBoardList(pagination));
        map.put("pagination",pagination);

        log.info("{}",map);

        return map;
    }

    public int setBoard(BoardVO boardVO, MultipartFile [] files) throws Exception{

        Pagination pagination = new Pagination();
        pagination.setCode(boardVO.getCate_code());
        boardVO.setBoard_code(boardDAO.getTotalCount(pagination)+1L);

        int result = boardDAO.addBoard(boardVO);
        if(files != null){

            for (MultipartFile multipartFile : files) {
                if (multipartFile.isEmpty()) {
                    continue;
                }

                String fileName = fileManager.fileSave(uploadPath, multipartFile);
                BoardFileVO fileVO = new BoardFileVO();
                fileVO.setBoard_code(boardVO.getBoard_code());
                fileVO.setFile_name(fileName);
                fileVO.setOrigin_name(multipartFile.getOriginalFilename());
                fileVO.setCate_code(boardVO.getCate_code());
                fileVO.setFile_code(boardDAO.getSeq());
                result = boardDAO.addFile(fileVO);

                if (result == 0) {
                    throw new Exception();
                }
            }
        }
        return result;
    }

}
