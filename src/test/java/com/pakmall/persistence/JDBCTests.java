package com.pakmall.persistence;

import static org.junit.Assert.fail;

import java.sql.Connection;
import java.sql.DriverManager;

import org.junit.Test;

import lombok.extern.log4j.Log4j;

// 특징> 스프링기반에서 본작업 들어가기전에 jdbc orcale driver를 이용한 연동테스트 

@Log4j
public class JDBCTests {
	static {
		try {
			// DriverManager객체생성이되어 메모리상에 로딩 
			Class.forName("oracle.jdbc.OracleDriver");
		}catch(Exception ex) {
			ex.printStackTrace();
		}
	}
	
	@Test
	public void testConnection() {
		String url = "jdbc:oracle:thin:@mydemoserver.c20iswl2q06v.ap-northeast-2.rds.amazonaws.com:1521:orcl";
		String uid = "pakmall01";
		String pwd = "pakmall01";
		try (Connection con = DriverManager.getConnection(url, uid, pwd)){
			log.info(con);
		}catch (Exception ex) {
			fail(ex.getMessage());
		}
	}
}
