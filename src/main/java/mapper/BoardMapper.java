package mapper;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import dto.Board;

@Mapper
public interface BoardMapper {
	
	// insert, update, delete => int
	// select => list, object, int 등 다양함
	
	// 조회수 증가(글번호가 오면 해당 글번호 조회수만 1 증가)
	@Update({
		" UPDATE BOARD SET hit=hit+1 WHERE no=#{no} "
	})
	public int updateBoardHit(@Param("no") long no);
	
	// 글쓰기
	@Insert({" INSERT INTO BOARD (title, content, writer) ",
			 " VALUES (#{obj.title}, #{obj.content}, #{obj.writer}) "})
	public int insertBoardOne(@Param("obj") Board obj);
	
	// 전체 목록
	@Select({
		" SELECT b.* FROM board b ORDER BY no DESC "
	})
	public List<Board> selectBoardAll();

	// 전체 개수 (페이지네이션 용)
	@Select({ 
		" SELECT COUNT(*) cnt FROM board " 
	})
	public long countBoardList();
	
	// 페이지네이션
	@Select({
		" SELECT b.* FROM ( " ,
		" SELECT b.*, ROW_NUMBER() OVER (ORDER BY no DESC) rown FROM board b " ,
		" ) b WHERE rown >= #{start} AND rown <=#{end} ORDER BY no DESC "
	})
	public List<Board> selectBoardListPage(@Param("start") int start, @Param("end") int end);
}
