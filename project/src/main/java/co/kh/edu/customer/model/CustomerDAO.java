package co.kh.edu.customer.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import co.kh.edu.common.ConnectionPool;

public class CustomerDAO {
	public final String SELECT_SQL = "SELECT ID, PWD FROM CUSTOMER WHERE ID = ?";
	public final String SELECT_ONE_SQL = "SELECT ID,PWD,NAME,PHONE1,PHONE2,PHONE3,SUBSTR(EMAIL, 1, INSTR(EMAIL,'@' ,-1)-1) AS EMAIL,ZIPCODE,ADDRESS1,ADDRESS2 FROM CUSTOMER WHERE ID = ?";
	public final String SELECT_ID_SQL = "SELECT COUNT(*) AS COUNT FROM CUSTOMER WHERE ID = ?";
	public final String INSERT_SQL = "INSERT INTO CUSTOMER VALUES(?,?,?,?,?,?,?,?,?,?)";
	public final String UPDATE_SQL = "UPDATE CUSTOMER SET PWD = ?, NAME = ?, PHONE1 = ?, PHONE2 = ?, PHONE3 = ?, EMAIL = ?, ZIPCODE = ?, ADDRESS1 = ?, ADDRESS2 = ? WHERE ID = ?";
	public final String DELETE_SQL = "DELETE FROM CUSTOMER WHERE ID = ?";

	public int selectLoginCheck(CustomerVO cvo) {
		ConnectionPool cp = ConnectionPool.getInstance();
		Connection con = cp.dbCon();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int check = -1; // id가 없음
		String pwd = null;
		try {
			pstmt = con.prepareStatement(SELECT_SQL);
			pstmt.setString(1, cvo.getId());
			rs = pstmt.executeQuery();
			if (rs.next()) {
				pwd = rs.getString("pwd");
				// 1일떄는 모두 맞음, 0일때는 아이디 맞고 비밀번호 틀림
				check = (pwd.equals(cvo.getPwd())) ? (1) : (0);
			}
		} catch (SQLException e) {
			System.out.println(e.toString());
		} finally {
			cp.dbClose(con, pstmt, rs);
		}
		return check;
	}

	public CustomerVO selectOneDB(CustomerVO cvo) {
		ConnectionPool cp = ConnectionPool.getInstance();
		Connection con = cp.dbCon();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		CustomerVO vo = null;

		String id = null;
		String pwd = null;
		String name = null;
		String phone1 = null;
		String phone2 = null;
		String phone3 = null;
		String email = null;
		String zipcode = null;
		String address1 = null;
		String address2 = null;

		try {
			pstmt = con.prepareStatement(SELECT_ONE_SQL);
			pstmt.setString(1, cvo.getId());
			rs = pstmt.executeQuery();
			if (rs.next()) {
				id = rs.getString("id");
				pwd = rs.getString("pwd");
				name = rs.getString("name");
				phone1 = rs.getString("phone1");
				phone2 = rs.getString("phone2");
				phone3 = rs.getString("phone3");
				email = rs.getString("email");
				zipcode = rs.getString("zipcode");
				address1 = rs.getString("address1");
				address2 = rs.getString("address2");
				vo = new CustomerVO(id, pwd, name, phone1, phone2, phone3, email, zipcode, address1, address2);
			}
		} catch (SQLException e) {
			System.out.println(e.toString());
		} finally {
			cp.dbClose(con, pstmt, rs);
		}
		return vo;
	}

	public boolean idCheck(CustomerVO cvo) {
		ConnectionPool cp = ConnectionPool.getInstance();
		Connection con = cp.dbCon();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int count = 0;
		try {
			pstmt = con.prepareStatement(SELECT_ID_SQL);
			pstmt.setString(1, cvo.getId());
			rs = pstmt.executeQuery();
			if (rs.next()) {
				count = rs.getInt("COUNT");
			}
		} catch (SQLException e) {
			System.out.println(e.toString());
		} finally {
			cp.dbClose(con, pstmt, rs);
		}
		return (count == 0) ? (true) : (false);
	}

	public boolean insertDB(CustomerVO cvo) {
		ConnectionPool cp = ConnectionPool.getInstance();
		Connection con = cp.dbCon();
		PreparedStatement pstmt = null;
		int count = 0;

		try {
			pstmt = con.prepareStatement(INSERT_SQL);
			pstmt.setString(1, cvo.getId());
			pstmt.setString(2, cvo.getPwd());
			pstmt.setString(3, cvo.getName());
			pstmt.setString(4, cvo.getPhone1());
			pstmt.setString(5, cvo.getPhone2());
			pstmt.setString(6, cvo.getPhone3());
			pstmt.setString(7, cvo.getEmail());
			pstmt.setString(8, cvo.getZipcode());
			pstmt.setString(9, cvo.getAddress1());
			pstmt.setString(10, cvo.getAddress2());
			count = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println(e.toString());
		} finally {
			cp.dbClose(con, pstmt);
		}
		return (count != 0) ? (true) : (false);
	}

	public boolean updateDB(CustomerVO cvo) {
		ConnectionPool cp = ConnectionPool.getInstance();
		Connection con = cp.dbCon();
		PreparedStatement pstmt = null;
		int count = 0;

		try {
			pstmt = con.prepareStatement(UPDATE_SQL);
			pstmt.setString(1, cvo.getPwd());
			pstmt.setString(2, cvo.getName());
			pstmt.setString(3, cvo.getPhone1());
			pstmt.setString(4, cvo.getPhone2());
			pstmt.setString(5, cvo.getPhone3());
			pstmt.setString(6, cvo.getEmail());
			pstmt.setString(7, cvo.getZipcode());
			pstmt.setString(8, cvo.getAddress1());
			pstmt.setString(9, cvo.getAddress2());
			pstmt.setString(10, cvo.getId());
			count = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println(e.toString());
		} finally {
			cp.dbClose(con, pstmt);
		}
		return (count != 0) ? (true) : (false);
	}

	public boolean deleteDB(CustomerVO cvo) {
		ConnectionPool cp = ConnectionPool.getInstance();
		Connection con = cp.dbCon();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int count = 0;
		String pwd = null;

		try {
			pstmt = con.prepareStatement(SELECT_SQL);
			pstmt.setString(1, cvo.getId());
			rs = pstmt.executeQuery();
			if (rs.next()) {
				pwd = rs.getString("pwd");
				if (pwd.equals(cvo.getPwd())) {
					pstmt = con.prepareStatement(DELETE_SQL);
					pstmt.setString(1, cvo.getId());
					count = pstmt.executeUpdate();
				}
			}
		} catch (SQLException e) {
			System.out.println(e.toString());
		} finally {
			cp.dbClose(con, pstmt);
		}
		return (count != 0) ? (true) : (false);
	}

}
