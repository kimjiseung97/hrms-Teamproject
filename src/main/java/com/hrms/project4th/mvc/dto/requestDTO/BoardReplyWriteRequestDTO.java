package com.hrms.project4th.mvc.dto.requestDTO;

import com.hrms.project4th.mvc.entity.BoardReply;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@ToString
@Getter
public class BoardReplyWriteRequestDTO {
    //게시글 번호
    private long boardNo;

    // 댓글 내용
    private String repContent;

    // 작성자의 사원 번호
    private long empNo;


    public BoardReply changeEntity() {
        return BoardReply.builder()
                .boardNo(this.boardNo)
                .empNo(this.empNo)
                .repContent(this.repContent)
                .build();
    }



}
