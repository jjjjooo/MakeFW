package com.board.entity;

import lombok.Data;

//lombok - getter,setter,toString 등의 다이어트 코드 지원자 - 메이븐에 등록
@Data
public class Board {
	private int idx; // DB번호
	private String title; //제목
	private String content; //글 내용
	private String writer; // 작성자
	private String indate; //작성일
	private String count; //조회수
}
