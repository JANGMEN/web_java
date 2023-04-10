package mapper;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import dto.ItemImage;

@Mapper
public interface ItemImageMapper {
	
	@Insert({
		" INSERT INTO ITEMIMAGE(filename, filetype, filesize, filedata, itemno) ",
		" VALUES (#{obj.filename}, #{obj.filetype}, #{obj.filesize}, #{obj.filedata}, #{obj.itemno}) "
	})
	public int insertImage(@Param("obj") ItemImage obj);
	
	@Select({
		" SELECT i.* FROM ItemImage i WHERE NO=#{no} "
	})
	public ItemImage selectItemImageOne(@Param("no") long no); // 이미지 번호
	
	@Select({
		" SELECT i.NO FROM ItemImage i WHERE boardno = #{boardno} ORDER BY no DESC"
	})
	public List<Long> selectItemImageNo(@Param("boardno") long boardno);

}
