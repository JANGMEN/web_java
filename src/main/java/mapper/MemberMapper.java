package mapper;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import dto.Member;

public interface MemberMapper {
	
	// 아이디 중복확인
	@Select({
		" SELECT COUNT(*) cnt FROM member m WHERE ID=#{id} "
	})
	
	public int selectMemberIDCheck(@Param("id") String id);

	// 회원가입
	@Insert({
		" INSERT INTO member(id, password, name, age) ",
		" VALUES ( #{obj.id}, #{obj.password}, #{obj.name}, #{obj.age} ) "
	})
	public int insertMemberOne(@Param("obj") Member obj);
	
	@Select({
		" SELECT m.id, m.name, m.age FROM member m ",
		" WHERE ID = #{obj.id} AND PASSWORD = #{obj.password} "
	})
	public Member selectMemberLogin(@Param("obj") Member obj);
	
	@Update({
		" UPDATE member SET name=#{obj.name}, age=#{obj.age} WHERE id=#{obj.id} "
	})
	public int updateMemberConfig(@Param("obj") Member obj);
	
	@Update({
		" UPDATE member SET password=#{obj.newPassword} WHERE id=#{obj.id} AND password=#{obj.password} "
	})
	public int updateMemberPassword(@Param("obj") Member obj);
	
	@Delete({
		" DELETE FROM member WHERE id=#{obj.id} AND password=#{obj.password} "
		
	})
	public int deleteMember(@Param("obj") Member obj);
}
