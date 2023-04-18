package dto;

import java.util.Date;

import lombok.Data;

@Data
public class Address {
	private long no;
	private String postcode;
	private String address;
	private String memberid;
	private Date regdate;

}
