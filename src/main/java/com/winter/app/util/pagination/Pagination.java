package com.winter.app.util.pagination;

import lombok.Data;
import org.springframework.stereotype.Component;

@Data
@Component
public class Pagination {

    private Long startRow;
    private Long lastRow;
    private Long perPage;
    private Long page;

    private Long totalPage;
    private Long startNum;
    private Long lastNum;

    private Long code; //board 카테고리 코드 매칭용 필드
    private String kind;
    private String search;

    public void setKind(String kind) {
        if(kind==null){
            kind="";
        }
        this.kind = kind;
    }

    public void setSearch(String search) {
        if(search==null){
            search="";
        }
        this.search = search;
    }

    //이전 블럭이 없으면 true;
    private boolean start;

    //다음 블럭이 없으면 true;
    private boolean last;

    public Long getPerPage() {
        if(this.perPage==null||this.perPage<1) {
            this.perPage=10L;
        }
        return perPage;
    }
    public Long getPage() {
        if(this.page==null||this.page<1) {
            this.page=1L;
        }
        return page;
    }
    public String getSearch() {
        if(this.search==null) {
            this.setSearch("");
        }
        return search;
    }
    //startRow, lastRow 계산하는 메서드
    public void makeRow() {
        this.startRow=this.getPage()*this.getPerPage()-(this.getPerPage()-1);
        this.lastRow=this.getPage()*this.getPerPage();
    }

    public void makeNum(Long totalCount) {
        if(totalCount==0){
            return;
        }
        totalPage = totalCount/this.getPerPage();
        if(totalCount%this.getPerPage()!=0) {
            totalPage = totalPage+1L;
        }
        this.setTotalPage(totalPage);

        //2. 총블럭의 수 구하기
        Long perBlock=5L; //블럭당 번호 갯수
        long totalBlock=0L;
        totalBlock=totalPage/perBlock;
        if(totalPage%perBlock!=0) {
            totalBlock++;
        }

        //3. Page의 값으로 현재 블럭 번호 구하기
        long curBlock=0L; //블럭번호
        curBlock=this.getPage()/perBlock;
        if(this.getPage()%perBlock!=0) {
            curBlock++;
        }

        //4. 현재 블럭번호로 시작번호와 끝번호 구하기
        Long lastNum=perBlock*curBlock;
        Long startNum=lastNum-perBlock+1L;
        this.setStartNum(startNum);
        this.setLastNum(lastNum);

        //이전, 다음 블럭 유무
        if(curBlock==1) {
            this.setStart(true);
        }

        if(curBlock==totalBlock) {
            this.setLastNum(this.getTotalPage());
            this.setLast(true);
        }
    }

}
