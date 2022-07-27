package com.board.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import org.springframework.web.bind.annotation.RestController;

import com.board.entity.Board;
import com.board.mapper.BoardMapper;


@RequestMapping("/board")
@RestController
public class BoardRestController {

	@Autowired
	BoardMapper mapper;
	
	
	//@RequestMapping("/all")
	@GetMapping("/all")
	public  List<Board> boardList(){
		List<Board> list = mapper.getBoardList();
		return list; // JSON 리턴 
	}
	
	//@RequestMapping("/boardInsert")
	@PostMapping("/new")
	public  void boardInsert(Board dto) {
		
		mapper.boardInsert(dto);
	}
	
	//@RequestMapping("/boardDelete")
	@DeleteMapping("/{idx}")
	public void boardDelete(@PathVariable("idx") int idx) {
		
		mapper.boardDelete(idx);
	}
	
	//@RequestMapping("/boardUpdate")
	@PutMapping("/update")
	public void boardUpdate(Board dto) {
		System.out.println("게시글 수정");
		mapper.boardUpdate(dto);
	}
	
	//@RequestMapping("/boardContent")
	@GetMapping("/{idx}")
	public  Board boardContent(@PathVariable("idx") int idx) {
		
		Board dto = mapper.getBoard(idx);
		return dto;
	}
	
	//@RequestMapping("/boardCnt")
	@GetMapping("/cnt/{idx}")
	public Board BoardCnt(@RequestParam("idx") int idx) {
		mapper.boardCnt(idx);
		Board dto = mapper.getBoard(idx);
		return dto;
	}
}
