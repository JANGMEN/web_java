package mapper;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import dto.Board;
import dto.Item;

@Mapper
public interface ItemMapper {
	
	// insert, update, delete => int
	// select => list, object, int 등 다양함
	
	// 조회수 증가(글번호가 오면 해당 글번호 조회수만 1 증가)
	@Update({
		" UPDATE BOARD SET hit=hit+1 WHERE no=#{no} "
	})
	public int updateBoardHit(@Param("no") long no);
	
	// 글쓰기
	@Insert({
		" INSERT INTO Item (name, content, price, quantity) ",
		" VALUES (#{obj.name}, #{obj.content}, #{obj.price}, #{obj.quantity}) "
		})
	public int insertItemOne(@Param("obj") Item obj);
	
	// 전체 목록
	@Select({
		" SELECT i.* FROM item i ORDER BY no DESC "
	})
	public List<Item> selectItemAll();

	// 전체 개수 (페이지네이션 용)
	@Select({ 
		" SELECT COUNT(*) cnt FROM item " 
	})
	public long countItemList();
	
	// 페이지네이션
	@Select({
		" SELECT i.* FROM ( " ,
		" SELECT i.*, ROW_NUMBER() OVER (ORDER BY no DESC) rown FROM ITEM i " ,
		" ) i WHERE rown >= #{start} AND rown <=#{end} ORDER BY no DESC "
	})
	public List<Item> selectItemListPage(@Param("start") int start, @Param("end") int end);
}
