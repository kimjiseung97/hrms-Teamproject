package com.hrms.project4th.mvc.repository;

import com.hrms.project4th.mvc.dto.page.BoardPage;
import com.hrms.project4th.mvc.dto.page.BoardSearch;
import com.hrms.project4th.mvc.entity.BdType;
import com.hrms.project4th.mvc.entity.Board;
import com.hrms.project4th.mvc.entity.BoardReply;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.List;

import static org.junit.jupiter.api.Assertions.*;

@SpringBootTest
class BoardReplyMapperTest {

    @Autowired
    BoardReplyMapper boardReplyMapper;
    @Autowired
    BoardMapper boardMapper;

    @Test
    @DisplayName("댓글 저장 기능")
    void save() {
//        for (int i = 1; i <= 301; i++) {
//            Board b = Board.builder()
//                    .boardNo(i)
//                    .bdType(BdType.valueOf("FREE"))
//                    .bdTitle("board title" + i)
//                    .bdContent("board content / board content" + i)
//                    .empNo(i)
//                    .build();
//            boolean flag = boardMapper.boardSave(b);
//            assertTrue(flag);
//        }
        for (int i = 1; i <= 1000; i++) {

            BoardReply build = BoardReply.builder()
                    .repContent("reply content" + i)
                    .boardNo((long) (Math.random() * 301 + 1))
                    .empNo((long) (Math.random() * 301 + 1))
                    .build();
            boardReplyMapper.save(build);

        }

    }

    @Test
    void findAll() {
        BoardPage p =new BoardPage();

        List<BoardReply> all = boardReplyMapper.findAll(300, p);
        System.out.println(all);


    }
}

