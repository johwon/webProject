package co.kh.edu.basket.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import co.kh.edu.common.ConnectionPool;

public class BasketDAO {
	//싱글톤
	private static BasketDAO instance;
	
	//생성자
	private BasketDAO() {};

	public static synchronized BasketDAO getInstance() {
		if(instance==null) {
			synchronized (BasketDAO.class) {
				instance = new BasketDAO();
			}
		}
		return instance;
	}
	
	private static String size = "B.\"SIZE\"";
	public static String SELECT_SQL="SELECT B.NUM, B.C_ID, B.P_NUM,"+size+", B.COLOR, P.NAME, P.PRICE FROM BASKET B INNER JOIN PRODUCT P ON B.P_NUM=P.NUM WHERE C_ID=?";
	public static String SELECT_COUNT_SQL="SELECT COUNT(*) AS COUNT FROM BASKET WHERE C_ID=?";
	public static String INSERT_SQL="INSERT INTO BASKET VALUES(BASKET_SEQ.NEXTVAL, ?, ?, ?, ?)";
	public static String DELETE_SQL="DELETE FROM BASKET WHERE NUM = ?";
	
	
	public ArrayList<BasketVO> selectDB(BasketVO vo) {
		ConnectionPool cp = ConnectionPool.getInstance();
		Connection con = cp.dbCon();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<BasketVO> list = new ArrayList<BasketVO>();
	    
		try {
			pstmt=con.prepareStatement(SELECT_SQL);
			pstmt.setString(1, vo.getcId());
			rs = pstmt.executeQuery();
			while(rs.next()) {
				int num = rs.getInt("NUM");
				int pNum = rs.getInt("P_NUM");
				String size = rs.getString("SIZE");
				String color = rs.getString("COLOR");
				String name = rs.getString("NAME");
				int price = rs.getInt("price");
				BasketVO bvo = new BasketVO(num, vo.getcId(), pNum, size, color, name, price);
				list.add(bvo);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			cp.dbClose(con, pstmt, rs);
		}
		return list;
	}
	
	public int selectCountDB(BasketVO vo) {
		ConnectionPool cp = ConnectionPool.getInstance();
		Connection con = cp.dbCon();
		PreparedStatement pstmt = null;
		int count = 0;
		ResultSet rs = null;
		
		try {
			pstmt=con.prepareStatement(SELECT_COUNT_SQL);
			pstmt.setString(1, vo.getcId());
			rs = pstmt.executeQuery();
			if(rs.next()) {
				count = rs.getInt("COUNT");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			cp.dbClose(con, pstmt, rs);
		}
		return count;
	}
	
	
	public boolean insertDB(BasketVO vo){
		ConnectionPool cp = ConnectionPool.getInstance();
		Connection con = cp.dbCon();
		PreparedStatement pstmt = null;
		int count = 0;
		
		try {
			pstmt = con.prepareStatement(INSERT_SQL);
			pstmt.setString(1, vo.getcId());
			pstmt.setInt(2, vo.getpNum());
			pstmt.setString(3, vo.getSize());
			pstmt.setString(4, vo.getColor());
			count = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			cp.dbClose(con, pstmt);
		}
		return (count!=0)?(true):(false);
	}
	
	public boolean deleteDB(BasketVO vo){
		ConnectionPool cp = ConnectionPool.getInstance();
		Connection con = cp.dbCon();
		PreparedStatement pstmt = null;
		int count = 0;
		
		try {
			pstmt = con.prepareStatement(DELETE_SQL);
			pstmt.setInt(1, vo.getNum());
			count = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			cp.dbClose(con, pstmt);
		}
		return (count!=0)?(true):(false);
	}
	
	
	
}
