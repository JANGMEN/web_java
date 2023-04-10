package dto;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString(exclude = {"regdate"}) // exclude : 포함하고 싶지 않을 때
@NoArgsConstructor
@AllArgsConstructor
public class Item {
	
	private long no; // 게시글 번호
	private String name; // 게시글 제목
	private String content; // 게시글 내용
	//private String writer; // 작성자
	private long price; // 조회수
	private long quantity;
	private Date regdate; // 작성일자

}