package config;

import org.apache.commons.dbcp2.BasicDataSource;
import org.apache.ibatis.mapping.Environment;
import org.apache.ibatis.session.Configuration;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.apache.ibatis.transaction.TransactionFactory;
import org.apache.ibatis.transaction.jdbc.JdbcTransactionFactory;

import mapper.AddressMapper;
import mapper.BoardMapper;
import mapper.BookMapper;
import mapper.ItemImageMapper;
import mapper.ItemMapper;
import mapper.MemberMapper;
import mapper.PurchaseMapper;

//import mapper.BoardImageMapper;
//import mapper.BoardMapper;
//import mapper.ItemMapper;
//import mapper.MemberMapper;

public class MyBatisContext {
	
	// 정적 객체 생성
	private static SqlSession sqlSession;
	
	// controller에서 사용할 객체 반환
	public static SqlSession getSqlSession() {
		return sqlSession;
	}
	
	// 최초 1번만 생성
	static {
		try {
			//DB접속용 dataSource 객체 생성
			
			BasicDataSource dataSource = new BasicDataSource();
			
			//오라클 기준
			//dataSource.setDriverClassName("oracle.jdbc.driver.OracleDriver");
			//@서버주소:포트번호:SID
			//dataSource.setUrl("jdbc:oracle:thin:@1.234.5.158:11521:xe");
			//dataSource.setUsername("ds216");
			//dataSource.setPassword("pw216");
			
			// h2 테스트용 database
			dataSource.setDriverClassName("org.h2.Driver");
			//@서버주소:포트번호:SID
			dataSource.setUrl("jdbc:h2:tcp://1.234.5.158:41521/ds216;Mode=Oracle");
			dataSource.setUsername("sa");
			dataSource.setPassword("");
			
			TransactionFactory transacionFactory = new JdbcTransactionFactory();
			Environment environment = new Environment("development", transacionFactory, dataSource);
			Configuration config = new Configuration(environment);
			
			//만든 Mapper 등록
			config.addMapper(MemberMapper.class);
			config.addMapper(BoardMapper.class);
			config.addMapper(ItemMapper.class);
			config.addMapper(ItemImageMapper.class);
			config.addMapper(PurchaseMapper.class);
			config.addMapper(AddressMapper.class);
			config.addMapper(BookMapper.class);
			
			
			SqlSessionFactory factory = new SqlSessionFactoryBuilder().build(config);			
			sqlSession =  factory.openSession(true); //true면 자동으로 commit 수행			
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

}
