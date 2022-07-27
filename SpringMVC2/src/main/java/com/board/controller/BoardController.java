package com.board.controller;


import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.board.entity.Board;
import com.board.mapper.BoardMapper;

@Controller
public class BoardController {
	
	@Autowired
	BoardMapper mapper;
	
	@RequestMapping("/")
	public String main() {
		return "main";
	}
	
//	//@ResponseBody -> jackson-databind(객체를 -> JSON 포캣으로 직렬화)
//	@RequestMapping("/boardList")
//	public @ResponseBody List<Board> boardList(){
//		List<Board> list = mapper.getBoardList();
//		return list; // JSON 리턴 
//	}
//	
//	@RequestMapping("/boardInsert")
//	public @ResponseBody void boardInsert(Board dto) {
//		
//		mapper.boardInsert(dto);
//	}
//	
//	@RequestMapping("/boardDelete")
//	public @ResponseBody void boardDelete(@RequestParam("idx") int idx) {
//		
//		mapper.boardDelete(idx);
//	}
//	
//	@RequestMapping("/boardUpdate")
//	public @ResponseBody void boardUpdate(Board dto) {
//		System.out.println("게시글 수정");
//		mapper.boardUpdate(dto);
//	}
//	
//	@RequestMapping("/boardContent")
//	public @ResponseBody Board boardContent(@RequestParam("idx") int idx) {
//		
//		Board dto = mapper.getBoard(idx);
//		return dto;
//	}
//	
//	@RequestMapping("/boardCnt")
//	public @ResponseBody Board BoardCnt(@RequestParam("idx") int idx) {
//		mapper.boardCnt(idx);
//		Board dto = mapper.getBoard(idx);
//		return dto;
//	}
}	
