package com.hrms.project4th.mvc.controller;

import com.hrms.project4th.mvc.dto.BoardListResponseDTO;
import com.hrms.project4th.mvc.dto.BoardSaveRequestDTO;
import com.hrms.project4th.mvc.service.BoardService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequiredArgsConstructor
@RequestMapping("/hrms")
@Slf4j
public class BoardController {

    private final BoardService boardService;

    // 게시글을 보여주는 기능
    @GetMapping("/board-list")
    public String boardFindAll(Model model) {
        List<BoardListResponseDTO> boardListResponseDTOS = boardService.boardFindAll();
//        log.info("/hrms/board-list : GET {}",boardListResponseDTOS);

        model.addAttribute("allList", boardListResponseDTOS);
        return "/board/boardList";
    }


    // 게시글 저장 페이지를 보여주는 기능
    @GetMapping("/board-save")
    public String showBoardSave(){

        return "/board/boardSave";
    }

    // 저장 페이지의 정보를 저장하는 기능
    @PostMapping("/board-save")
    public String boardSave(BoardSaveRequestDTO dto){
        boardService.boardSave(dto);
//        log.info("BoardSaveRequestDTO {}",dto);
        return "redirect:/hrms/board-list";
    }

    // 상세 보기 페이지를 보여주는 기능
    @GetMapping("/board-detail")
    public String boardDetail(){


        return "";
    }



}
