package co.kh.edu.noticeBoard.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;

import co.kh.edu.common.ConnectionPool;

public class NoticeBoardDAO {
	// 싱글톤방식
	// 1. 객체
	private static NoticeBoardDAO instance;

	// 2. 생성자
	private NoticeBoardDAO() {
	};

	// 3.
	public static NoticeBoardDAO getInstance() {
		if (instance == null) {
			synchronized (NoticeBoardDAO.class) {
				instance = new NoticeBoardDAO();
			}
		}
		return instance;
	}

	private final String SELECT_SQL = "select * from NOTICE order by num desc";
	private final String SELECT_START_END_SQL = " select * from "
			+ "(select rownum AS rnum, num, writer, email, subject, pass, regdate, readcount, ref, step, depth, content, ip "
			+ "from (select * from NOTICE order by ref desc, step asc)) where rnum>=? and rnum<=?";
	private final String SELECT_COUNT_SQL = "select count(*) as count from NOTICE";
	private final String SELECT_MAX_NUM_SQL = "select max(num) as num from NOTICE";
	private final String SELECT_ONE_SQL = "select * from NOTICE where num = ?";
	private final String SELECT_PASS_ID_CHECK_SQL = "select count(*) count from NOTICE where num = ? and pass = ?";
	private final String DELETE_SQL = "DELETE FROM NOTICE WHERE NUM = ? AND PASS = ?";
	private final String UPDATE_SQL = "update NOTICE set writer=?,email=?,subject=?,content=? where num=?";
	private final String INSERT_SQL = "insert into NOTICE(num, writer, email, subject, pass, regdate, ref, step, depth, content, ip) values(board_seq.nextval,?,?,?,?,?,?,?,?,?,?)";
	private final String UPDATE_STEP_SQL = "update NOTICE set step=step+1 where ref= ? and step > ?";
	private final String UPDATE_READCOUNT_SQL = "update NOTICE set readcount=readcount+1 where num = ?";
	private final String SEARCH_SUBJECT_SQL = "SELECT * FROM NOTICE WHERE SUBJECT LIKE ?";
	private final String SEARCH_SUBJECT_COUNT_SQL = "SELECT COUNT(*) AS COUNT FROM NOTICE WHERE SUBJECT LIKE ?";
	private final String SEARCH_WRITER_SQL = "SELECT * FROM NOTICE WHERE WRITER LIKE ?";
	private final String SEARCH_WRITER_COUNT_SQL = "SELECT COUNT(*) AS COUNT FROM NOTICE WHERE WRITER LIKE ?";

	public Boolean insertDB(NoticeBoardVO vo) {
		ConnectionPool cp = ConnectionPool.getInstance();
		Connection con = cp.dbCon();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int number = 0;
		int step = 0;
		int depth = 0;
		int ref = 1;
		int count = 0;

		// num 현재 보드속에 가장최고값에 +1, 값이 하나도 없으면 1
		try {
			pstmt = con.prepareStatement(SELECT_MAX_NUM_SQL);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				number = rs.getInt("num") + 1;
			} else {
				number = 1;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		// getNum() = 0이면 새글, 0이 아니면 답변글이다
		try {
			if (vo.getNum() != 0) {// 답변글일경우
				pstmt = con.prepareStatement(UPDATE_STEP_SQL);
				pstmt.setInt(1, vo.getRef());
				pstmt.setInt(2, vo.getStep());
				pstmt.executeUpdate();
				ref = vo.getRef();
				step = vo.getStep() + 1;
				depth = vo.getDepth() + 1;
			} else {// 새 글일 경우
				ref = number; // 가장 최고값+1
				step = 0;
				depth = 0;
			} // 쿼리를 작성
		} catch (SQLException e) {
			e.printStackTrace();
		}

		// 게시판글 등록하기
		try {
			pstmt = con.prepareStatement(INSERT_SQL);
			pstmt.setString(1, vo.getWriter());
			pstmt.setString(2, vo.getEmail());
			pstmt.setString(3, vo.getSubject());
			pstmt.setString(4, vo.getPass());
			pstmt.setTimestamp(5, vo.getRegdate());
			pstmt.setInt(6, ref);
			pstmt.setInt(7, step);
			pstmt.setInt(8, depth);
			pstmt.setString(9, vo.getContent());
			pstmt.setString(10, vo.getIp());
			count = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			cp.dbClose(con, pstmt);
		}
		return (count > 0) ? true : false;
	}

	public int selectCountDB() {
		ConnectionPool cp = ConnectionPool.getInstance();
		Connection con = cp.dbCon();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int count = 0;
		try {
			pstmt = con.prepareStatement(SELECT_COUNT_SQL);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				count = rs.getInt("count");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			cp.dbClose(con, pstmt, rs);
		}
		return count;
	}

	public ArrayList<NoticeBoardVO> selectDB() {
		ConnectionPool cp = ConnectionPool.getInstance();
		Connection con = cp.dbCon();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<NoticeBoardVO> boardList = new ArrayList<NoticeBoardVO>();
		try {
			pstmt = con.prepareStatement(SELECT_SQL);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				int num = rs.getInt("num");
				String writer = rs.getString("writer");
				String email = rs.getString("email");
				String subject = rs.getString("subject");
				String pass = rs.getString("pass");
				Timestamp regdate = rs.getTimestamp("regdate");
				int readcount = rs.getInt("readcount");
				int ref = rs.getInt("ref");
				int step = rs.getInt("step");
				int depth = rs.getInt("depth");
				String content = rs.getString("content");
				String ip = rs.getString("ip");
				NoticeBoardVO vo = new NoticeBoardVO(num, writer, email, subject, pass, readcount, ref, step, depth,
						regdate, content, ip);
				boardList.add(vo);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			cp.dbClose(con, pstmt, rs);
		}
		return boardList;
	}

	public NoticeBoardVO selectBoardDB(NoticeBoardVO vo) {
		ConnectionPool cp = ConnectionPool.getInstance();
		Connection con = cp.dbCon();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		NoticeBoardVO bvo = null;
		int count = 0;
		try {
			// 조회수 증가

			pstmt = con.prepareStatement(UPDATE_READCOUNT_SQL);
			pstmt.setInt(1, vo.getNum());
			pstmt.executeUpdate();

			// 글 전체내용 조회
			pstmt = con.prepareStatement(SELECT_ONE_SQL);
			pstmt.setInt(1, vo.getNum());
			rs = pstmt.executeQuery();
			if (rs.next()) {
				int num = rs.getInt("num");
				String writer = rs.getString("writer");
				String email = rs.getString("email");
				String subject = rs.getString("subject");
				String pass = rs.getString("pass");
				Timestamp regdate = rs.getTimestamp("regdate");
				int readcount = rs.getInt("readcount");
				int ref = rs.getInt("ref");
				int step = rs.getInt("step");
				int depth = rs.getInt("depth");
				String content = rs.getString("content");
				String ip = rs.getString("ip");
				bvo = new NoticeBoardVO(num, writer, email, subject, pass, readcount, ref, step, depth, regdate,
						content, ip);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			cp.dbClose(con, pstmt, rs);
		}
		return bvo;
	}

	public NoticeBoardVO selectBoardOneDB(NoticeBoardVO vo) {
		ConnectionPool cp = ConnectionPool.getInstance();
		Connection con = cp.dbCon();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		NoticeBoardVO bvo = null;
		int count = 0;
		try {
			// 글 전체내용 조회
			pstmt = con.prepareStatement(SELECT_ONE_SQL);
			pstmt.setInt(1, vo.getNum());
			rs = pstmt.executeQuery();
			if (rs.next()) {
				int num = rs.getInt("num");
				String writer = rs.getString("writer");
				String email = rs.getString("email");
				String subject = rs.getString("subject");
				String pass = rs.getString("pass");
				Timestamp regdate = rs.getTimestamp("regdate");
				int readcount = rs.getInt("readcount");
				int ref = rs.getInt("ref");
				int step = rs.getInt("step");
				int depth = rs.getInt("depth");
				String content = rs.getString("content");
				String ip = rs.getString("ip");
				bvo = new NoticeBoardVO(num, writer, email, subject, pass, readcount, ref, step, depth, regdate,
						content, ip);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			cp.dbClose(con, pstmt, rs);
		}
		return bvo;
	}

	public ArrayList<NoticeBoardVO> selectStartEndDB(int start, int end) {
		ConnectionPool cp = ConnectionPool.getInstance();
		Connection con = cp.dbCon();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<NoticeBoardVO> boardList = new ArrayList<NoticeBoardVO>(end - start + 1); // arrayList갯수정해줌
		try {
			pstmt = con.prepareStatement(SELECT_START_END_SQL);
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				int num = rs.getInt("num");
				String writer = rs.getString("writer");
				String email = rs.getString("email");
				String subject = rs.getString("subject");
				String pass = rs.getString("pass");
				Timestamp regdate = rs.getTimestamp("regdate");
				int readcount = rs.getInt("readcount");
				int ref = rs.getInt("ref");
				int step = rs.getInt("step");
				int depth = rs.getInt("depth");
				String content = rs.getString("content");
				String ip = rs.getString("ip");
				NoticeBoardVO vo = new NoticeBoardVO(num, writer, email, subject, pass, readcount, ref, step, depth,
						regdate, content, ip);
				boardList.add(vo);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			cp.dbClose(con, pstmt, rs);
		}
		return boardList;
	}

	public int updateDB(NoticeBoardVO vo) {
		// 1: 성공, 2. 패스워드문제, 3 수정문제
		ConnectionPool cp = ConnectionPool.getInstance();
		Connection con = cp.dbCon();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int passCheckCount = 0;
		int count = 0;
		int returnValue = 1;

		// 패스워드가 맞는지 점검필요
		try {
			pstmt = con.prepareStatement(SELECT_PASS_ID_CHECK_SQL);
			pstmt.setInt(1, vo.getNum());
			pstmt.setString(2, vo.getPass());
			rs = pstmt.executeQuery();
			if (rs.next()) {
				passCheckCount = rs.getInt("COUNT");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		if (passCheckCount != 0) {
			try {
				pstmt = con.prepareStatement(UPDATE_SQL);
				pstmt.setString(1, vo.getWriter());
				pstmt.setString(2, vo.getEmail());
				pstmt.setString(3, vo.getSubject());
				pstmt.setString(4, vo.getContent());
				pstmt.setInt(5, vo.getNum());
				count = pstmt.executeUpdate();
				if (count == 0)
					returnValue = 3;
				else
					returnValue = 1;
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				cp.dbClose(con, pstmt);
			}
		} else {
			returnValue = 2;
		}
		return returnValue;
	}

	public boolean deleteDB(NoticeBoardVO vo) {
		ConnectionPool cp = ConnectionPool.getInstance();
		Connection con = cp.dbCon();
		PreparedStatement pstmt = null;
		int count = 0;

		// 패스워드가 맞는지 점검필요
		try {
			pstmt = con.prepareStatement(DELETE_SQL);
			pstmt.setInt(1, vo.getNum());
			pstmt.setString(2, vo.getPass());
			count = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return (count != 0) ? (true) : (false);
	}

	public ArrayList<NoticeBoardVO> searchSubjectDB(NoticeBoardVO vo) {
		ConnectionPool cp = ConnectionPool.getInstance();
		Connection con = cp.dbCon();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<NoticeBoardVO> boardList = new ArrayList<NoticeBoardVO>();
		try {
			pstmt = con.prepareStatement(SEARCH_SUBJECT_SQL);
			pstmt.setString(1, vo.getSubject());
			rs = pstmt.executeQuery();
			while (rs.next()) {
				int num = rs.getInt("num");
				String writer = rs.getString("writer");
				String email = rs.getString("email");
				String subject = rs.getString("subject");
				String pass = rs.getString("pass");
				Timestamp regdate = rs.getTimestamp("regdate");
				int readcount = rs.getInt("readcount");
				int ref = rs.getInt("ref");
				int step = rs.getInt("step");
				int depth = rs.getInt("depth");
				String content = rs.getString("content");
				String ip = rs.getString("ip");
				NoticeBoardVO bvo = new NoticeBoardVO(num, writer, email, subject, pass, readcount, ref, step, depth,
						regdate, content, ip);
				boardList.add(bvo);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			cp.dbClose(con, pstmt, rs);
		}
		return boardList;
	}

	public int searchSubjectCountDB(NoticeBoardVO vo) {
		ConnectionPool cp = ConnectionPool.getInstance();
		Connection con = cp.dbCon();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int count = 0;
		try {
			pstmt = con.prepareStatement(SEARCH_SUBJECT_COUNT_SQL);
			pstmt.setString(1, vo.getSubject());
			rs = pstmt.executeQuery();
			if (rs.next()) {
				count = rs.getInt("count");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			cp.dbClose(con, pstmt, rs);
		}
		return count;
	}

	public ArrayList<NoticeBoardVO> searchWriterDB(NoticeBoardVO vo) {
		ConnectionPool cp = ConnectionPool.getInstance();
		Connection con = cp.dbCon();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<NoticeBoardVO> boardList = new ArrayList<NoticeBoardVO>();
		try {
			pstmt = con.prepareStatement(SEARCH_WRITER_SQL);
			pstmt.setString(1, vo.getWriter());
			rs = pstmt.executeQuery();
			while (rs.next()) {
				int num = rs.getInt("num");
				String writer = rs.getString("writer");
				String email = rs.getString("email");
				String subject = rs.getString("subject");
				String pass = rs.getString("pass");
				Timestamp regdate = rs.getTimestamp("regdate");
				int readcount = rs.getInt("readcount");
				int ref = rs.getInt("ref");
				int step = rs.getInt("step");
				int depth = rs.getInt("depth");
				String content = rs.getString("content");
				String ip = rs.getString("ip");
				NoticeBoardVO bvo = new NoticeBoardVO(num, writer, email, subject, pass, readcount, ref, step, depth,
						regdate, content, ip);
				boardList.add(bvo);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			cp.dbClose(con, pstmt, rs);
		}
		return boardList;
	}

	public int searchWriterCountDB(NoticeBoardVO vo) {
		ConnectionPool cp = ConnectionPool.getInstance();
		Connection con = cp.dbCon();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int count = 0;
		try {
			pstmt = con.prepareStatement(SEARCH_WRITER_COUNT_SQL);
			pstmt.setString(1, vo.getWriter());
			rs = pstmt.executeQuery();
			if (rs.next()) {
				count = rs.getInt("count");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			cp.dbClose(con, pstmt, rs);
		}
		return count;
	}

}
