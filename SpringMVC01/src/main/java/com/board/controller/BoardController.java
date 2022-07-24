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

import com.board.entity.Board;
import com.board.mapper.BoardMapper;

@Controller
public class BoardController {

	@Autowired
	private BoardMapper mapper;
	
	@RequestMapping("/boardList")
	public String boardList(Model model) {
		
		List<Board> list = mapper.getBoardList();
		
		model.addAttribute("list",list);
		
		return "boardList";	// /WEB-INF/Views/boardForm.jsp -> forward
	}
	
	@GetMapping("/boardForm")
	public String  boardForm() {
		
		
		
		return "boardForm";  // /WEB-INF/Views/boardForm.jsp -> forward  //WEB-INF를 통해 경로를 숨긴다.
	}
	
	
	@PostMapping("/boardInsert")
	public String boardInsert(Board dto) { //파라메터 수직 - 인터풀레이션 알아서 있으면 변수 잡아줌 - 스프링 프레임워크가 해줌
		
		mapper.boardInsert(dto);
		
		return "redirect:/boardList"; //리다이렉트 경로
	}
	
	@GetMapping("/boardContent")
	public String boardContent(@RequestParam("idx") int idx, Model model) {
		
		Board dto = mapper.getBoard(idx);
		//
		mapper.boardCnt(idx);
		model.addAttribute("dto",dto); //${vo.}
		return "boardContent";
	}
	
	@GetMapping("/boardDelete/{idx}")
	public String boardDelete(@PathVariable("idx") int idx) {
		
		mapper.boardDelete(idx);
		
		return "redirect:/boardList";
	}
	
	@GetMapping("/boardUpdateForm/{idx}")
	public String boardUpdate(@PathVariable("idx") int idx, Model model) {
		
		Board dto = mapper.getBoard(idx);
		model.addAttribute("dto",dto);
		return "boardUpdate";
	}
	@PostMapping("/boardUpdate")
	public String boardUpdate(Board dto) {
		mapper.boardUpdate(dto);
		
		return "redirect:/boardList";
	}
}
