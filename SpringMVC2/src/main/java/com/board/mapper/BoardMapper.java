package com.board.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Update;

import com.board.entity.Board;


//CRUD 클래스
//Mybatis API - 메이븐에 추가

@Mapper
public interface BoardMapper {
	public List<Board> getBoardList();  //게시판 전체 리스트 - JPA와 다르게 단순조회도 커리문이 필요함. 1. 어노테이션 2. Mapper.xml(마이바티스)
	public void boardInsert(Board dto);
	public Board getBoard(int idx);
	public void boardDelete(int idx);
	public void boardUpdate(Board dto);
	
	
	@Update("update myboard set count=count+1 where idx=#{idx}")
	public void boardCnt(int idx);
	
}
