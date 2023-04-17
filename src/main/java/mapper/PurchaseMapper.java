package mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import dto.Purchase;
import dto.PurchaseView;

public interface PurchaseMapper {
	
	// 주문하기
	@Insert({
		" INSERT INTO PURCHASE (cnt, itemno, customerid) ",
		" VALUES (#{obj.cnt}, #{obj.itemno}, #{obj.customerid}) "
	})
	
	public int insertPurchaseOne(@Param("obj") Purchase obj);
	
	// 현재 로그인한 사용자가 주문한 내역 조회(주문정보만 있음)
	@Select({
		" SELECT p.* FROM PURCHASE p WHERE customerid = #{id} "
	})
	public List<Purchase> selectPurchaseMember(@Param("id") String id);
	
	// 주문 + 고객 + 물품을 조인한 View 만들기
	// 주문번호, 주문수량, 주문일자, 주문자 아이디, 주문자 이름, 물품명, 물품가격 
	@Select({
		" SELECT pv.* FROM purchaseview pv WHERE customerid = #{id} "
	})
	public List<PurchaseView> selectPurchaseViewMember(@Param("id") String id);
	
	@Delete({
		"<script>",
		" DELETE FROM purchase WHERE customerid=#{map.id} AND no IN( ",
			"<foreach collection='map.chk' item='tmp' separator=','>",
				"#{tmp}",
			"</foreach>",
		") ",
		"</script>"
	})
	// DELETE FROM 테이블명 WHERE customerid='a' AND no(1, 2, 3, 4);
	public int deletePurchase(@Param("map") Map<String, Object> map);
	
	@Select({
		" SELECT customerid, SUM(cnt) cnt FROM purchase GROUP BY customerid "
	})
	public List<Map<String, Object>> selectMemberGroup();

}
