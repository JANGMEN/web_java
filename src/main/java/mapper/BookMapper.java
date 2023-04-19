package mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import dto.Book;

public interface BookMapper {
	@Delete({
		" DELETE FROM BOOK WHERE no = #{no} "
	})
	public int deleteBookOne(@Param("no") long no);
	
	@Update({
		"UPDATE BOOK SET title=#{obj.title}, price=#{obj.price}, publisher=#{obj.publisher} WHERE no=#{obj.no} "
	})
	public int updateBookOne(@Param("obj") Book obj);
	
	@Select({
		" SELECT b.* FROM book b "
	})
	public List<Book> selectBook();
	
	@Select({
		" SELECT b.* FROM book b WHERE no=#{no}"
	})
	public Book selectBookOne(@Param("no") long no);

	@Insert({
		" INSERT INTO BOOK (title, price, author, publisher) ",
		" VALUES (#{obj.title}, #{obj.price}, #{obj.author}, #{obj.publisher}) "
	})
	public int insertBookOne(@Param("obj") Book obj);
}
