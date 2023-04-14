package dto;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class Purchase {
	
	private long no; // 시퀀스
	private long cnt;
	private long itemno;
	private String customerid;
	private Date regdate; // 자동

}
