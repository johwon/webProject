package co.kh.edu.product.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import co.kh.edu.common.ConnectionPool;

public class ProductDAO {
	private static ProductDAO instance;
	
	private ProductDAO() {}

	public static synchronized ProductDAO getInstance() {
		if(instance==null) {
			instance = new ProductDAO();
		}
		return instance;
	};
	
	private final String SELECT_SQL = "SELECT * FROM PRODUCT WHERE NUM=?";
	private final String SELECT_NAME_SQL = "SELECT * FROM PRODUCT WHERE NAME LIKE UPPER(?)";
	
	public ProductVO selectDB(ProductVO vo) {
		ConnectionPool cp = ConnectionPool.getInstance();
		Connection con = cp.dbCon();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			pstmt=con.prepareStatement(SELECT_SQL);
			pstmt.setInt(1, vo.getNum());
			rs = pstmt.executeQuery();
			if(rs.next()) {
				String name = rs.getString("name");
				int price = rs.getInt("price");
				vo.setName(name);
				vo.setPrice(price);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			cp.dbClose(con, pstmt, rs);
		}
		return vo;
	}
	
	public ArrayList<ProductVO> selectNameDB(ProductVO vo) {
		ConnectionPool cp = ConnectionPool.getInstance();
		Connection con = cp.dbCon();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<ProductVO> list = new ArrayList<ProductVO>();
		ProductVO pvo = null;
		
		try {
			pstmt=con.prepareStatement(SELECT_NAME_SQL);
			pstmt.setString(1, vo.getName());
			rs = pstmt.executeQuery();
			while(rs.next()) {
				String name = rs.getString("name");
				int num = rs.getInt("num");
				int price = rs.getInt("price");
				pvo = new ProductVO(num, name, price);
				list.add(pvo);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			cp.dbClose(con, pstmt, rs);
		}
		return list;
	}
}
