package dto;

import lombok.Data;

@Data
public class Book {
	private long no;
	private String title;
	private int price;
	private String author;
	private String publisher;

}
