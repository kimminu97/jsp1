package day2.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import day1.OracleConnectUtil;
import day2.vo.Member;
import day2.vo.MemberReg_Test;

public class MemberReg_TestDao {
	private static MemberReg_TestDao dao = new MemberReg_TestDao();
	private MemberReg_TestDao() {
		
	}
	public static MemberReg_TestDao getMemberRegDao() {
		return dao;
	}
	
	public void insert(MemberReg_Test vo) {
		Connection conn = OracleConnectUtil.connect();
		String sql = "INSERT INTO TBL_MEMBER#" + 
				" (NAME, PASSWORD, EMAIL, AGE, ADDR, GENDER,hobby)" + 
				" VALUES(?, ?, ?, ?, ?, ?,?)"; 
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getName());
			pstmt.setString(2, vo.getPassword());
			pstmt.setString(3, vo.getEmail());
			pstmt.setString(4, vo.getAge());
			pstmt.setString(5, vo.getAddr());
			pstmt.setString(6, vo.getGender());
			pstmt.setString(7, vo.getHobby());
			
			pstmt.execute();
			System.out.println("회원 등록이 완료 되었습니다.");
			pstmt.close();
		}catch (SQLException e) {
			System.out.println("SQL 실행 오류 : " +  e.getMessage());
		}
		OracleConnectUtil.close(conn);	
	}
	
}
