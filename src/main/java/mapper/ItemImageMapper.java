package mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import dto.ItemImage;

@Mapper
public interface ItemImageMapper {
	
	// 물품번호를 받아서 해당하는 이미지 1개 반환, 없으면 0 반환
	@Select({
		" SELECT NVL(min(no), 0) FROM itemimage WHERE itemno = #{itemno} "
	})
	public long selectItemImageMinOne(@Param("itemno") long itemno);
	
	@Insert({
		" INSERT INTO ITEMIMAGE(filename, filetype, filesize, filedata, itemno) ",
		" VALUES (#{obj.filename}, #{obj.filetype}, #{obj.filesize}, #{obj.filedata}, #{obj.itemno}) "
	})
	public int insertImage(@Param("obj") ItemImage obj);
	
	@Select({
		" SELECT i.* FROM ItemImage i WHERE NO=#{no} "
	})
	public ItemImage selectItemImageOne(@Param("no") long no); // 이미지 1개 가져가기
	
	@Select({
		" SELECT i.NO FROM ItemImage i WHERE itemno = #{itemno} ORDER BY no DESC"
	})
	public List<Long> selectItemImageNo(@Param("itemno") long itemno); // 물품번호를 이용해서 관련된 이미지 전체 이미지번호 반환
	
	@Delete({
		" DELETE FROM itemimage WHERE NO=#{no} "
	})
	public int deleteItemImageNo(@Param("no") long no);
	
	@Update({
		" UPDATE itemimage SET filename=#{obj.filename}, filesize=#{obj.filesize}, ",
		" filetype=#{obj.filetype}, filedata=#{obj.filedata} ",
		" WHERE ITEMNO=#{obj.itemno} AND NO=#{obj.no} "
	})
	public int updateItemImageOne(@Param("obj") ItemImage obj);

}
