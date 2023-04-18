package mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import dto.Address;

@Mapper
public interface AddressMapper {
	
	@Insert({
		" INSERT INTO MEMBERADDRESS (postcode, address, memberid) ",
		" VALUES (#{obj.postcode}, #{obj.address}, #{obj.memberid}) "
	})
	public int insertAddress(@Param("obj") Address obj);
	
	@Select({
		" SELECT a.* FROM memberaddress a WHERE memberid=#{id} "
	})
	public List<Address> selectAddressList(@Param("id") String id);
	
	@Delete({
		" DELETE FROM memberaddress WHERE no=#{obj.no} AND memberid=#{obj.memberid} "
	})
	public int deleteAddressOne(@Param("obj") Address obj);
}
