package dto;

import lombok.Data;

@Data
public class PurchaseView {
	
	// 주문번호, 주문수량, 주문일자, 주문자 아이디, 주문자 이름, 물품명, 물품가격 
	private long no;
	private long cnt;
	private int regdate;
	private String customerid;
	private String customername;
	private long itemno;
	private String itemname;
	private long itemprice;
}
