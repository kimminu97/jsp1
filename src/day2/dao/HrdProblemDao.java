package day2.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import day1.OracleConnectUtil;
import day2.vo.Member;
import day2.vo.SaleSum;

public class HrdProblemDao {	//Data Access Object : db의 sql 실행 메소드정의 클래스
	
	//singleton
	private static HrdProblemDao hrdproblemdao = new HrdProblemDao();
	private HrdProblemDao() {
	}
	public static HrdProblemDao getHrdProblemDao() {
		return hrdproblemdao;
	}
	
	
	//회원 insert		: insert
	public void insert(Member vo) {
		Connection conn = OracleConnectUtil.connect();
		String sql = "INSERT INTO MEMBER_TBL_02" + 
				"(CUSTNO, CUSTNAME, PHONE, ADDRESS, JOINDATE, GRADE, CITY)" + 
				"VALUES(member_seq02.nextval, ?,? ,? ,sysdate ,? ,? )";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, vo.getCustname());
			pstmt.setString(2, vo.getPhone());
			pstmt.setString(3, vo.getAddress());
			pstmt.setString(4, vo.getGrade());
			pstmt.setInt(5, vo.getCity());
			
			pstmt.execute();
			pstmt.close();
			System.out.println("회원 1건이 새로 등록되었습니다.");
		}catch(SQLException e) {
			System.out.println("SQL 실행 오류 : " + e.getMessage());
		}
		OracleConnectUtil.close(conn);
	}
	
	//회원 update		: update 회원번호를 조건으로 전화번호,주소,거주지역 컬럼을 변경
	public void update(Member vo) {
		Connection conn = OracleConnectUtil.connect();
		String sql = "UPDATE MEMBER_TBL_02" + 
				"SET PHONE=?, ADDRESS=?,  CITY=?" + 
				"WHERE CUSTNO=?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getPhone());
			pstmt.setString(2, vo.getAddress());
			pstmt.setInt(3, vo.getCity());
			pstmt.setString(4, vo.getCustNo());
			
			pstmt.execute();
			pstmt.close();
		}catch(SQLException e) {
			System.out.println("SQL 실행 오류 : " + e.getMessage());
		}
		System.out.println("회원정보가 변경 되었습니다.");
		OracleConnectUtil.close(conn);
	}
	
	//회원 전체 select	: selectMemberAll
	public List<Member> selectMemberAll(){
		Connection conn = OracleConnectUtil.connect();
		String sql = "select * from MEMBER_TBL_02";
		ResultSet rs=null;
		List<Member> members = new ArrayList<Member>();
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			while(rs.next()) {
				members.add(new Member(rs.getString(1),rs.getString(2),rs.getString(3),
						rs.getString(4),rs.getString(5),rs.getString(6),rs.getInt(7)));
			}
			pstmt.close();
			System.out.println("회원이 조회되었습니다.");
		}catch(SQLException e) {
			System.out.println("SQL 실행 오류 : " +e.getMessage());
		}
		OracleConnectUtil.close(conn);
		return members;
	}
	
	//회원 pk select	: selectMember
	public Member selectMember(String custNo) {
		Connection conn = OracleConnectUtil.connect();
		String sql = "Select * from MEMBER_TBL_02 where custno=?";
		ResultSet rs = null;
		Member vo = null;
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			pstmt.setString(1, custNo);
			if (rs.next()) { // 조회결과가 1개 행 있으면
				vo = new Member();
				vo.setCustNo(rs.getString(1));
				vo.setCustname(rs.getString(2));
				vo.setPhone(rs.getString(3));
				vo.setAddress(rs.getString(4));
				vo.setJoindate(rs.getString(5));
				vo.setGrade(rs.getString(6));
				vo.setCity(rs.getInt(7));
				pstmt.close();
			}
			pstmt.close();
			System.out.println("회원이 조회되었습니다.");
		} catch (SQLException e) {
			System.out.println("SQL 실행 오류 : " + e.getMessage());
		}
		OracleConnectUtil.close(conn);
		return vo;
	}
	
	//매출집계 select	: selectSale
	public List<SaleSum> selectSale(){
		Connection conn = OracleConnectUtil.connect();
		String sql="SELECT mt.CUSTNO , CUSTNAME ," + 
				" decode(grade,'A','VIP','B','일반','C','직원') AS agrade," + 
				" asum FROM MEMBER_TBL_02 mt ," + 
				" (SELECT custno, sum(price) AS asum FROM MONEY_TBL_02 mt " + 
				" GROUP BY CUSTNO" + 
				" ORDER BY asum desc) sale" + 
				" WHERE mt.CUSTNO = sale.custno";

		PreparedStatement pstmt = null;
		ResultSet rs= null;		
		List<SaleSum> sales = new ArrayList<>();
		try {
			pstmt = conn.prepareStatement(sql);
			rs=pstmt.executeQuery();	//select 
			
			while(rs.next()) {
				sales.add(new SaleSum(rs.getInt(1),rs.getString(2),rs.getString(3),
						rs.getInt(4)));
			}
			pstmt.close();
			System.out.println("매출집계가 조회되었습니다.");
		}catch (SQLException e) {
			System.out.println("SQL 실행 오류 : " + e.getMessage());
		
		}
		
		OracleConnectUtil.close(conn);
		return sales;
	}
}

