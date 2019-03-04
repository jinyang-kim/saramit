package com.member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.companies.CompaniesDTO;
import com.util.DBConn;

public class MemberDAO {
	private Connection conn;
	
	public MemberDAO() {
		conn = DBConn.getConnection();
	}
	
	public UserDTO readUser(String email){
		UserDTO dto = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;
		
		try {
			sql = "select levelCode, memberPwd, userName "
					+ "from member m1 join member_user m2 "
					+ "on m1.memberEmail=m2.userEmail where memberEmail=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, email);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				dto = new UserDTO();
				dto.setUserEmail(email);
				dto.setLevelCode(rs.getInt(1));
				dto.setUserPwd(rs.getString(2));
				dto.setUserName(rs.getString(3));
				dto.setStatusCode(rs.getInt(4));
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(rs != null) {
				try {
					if(!rs.isClosed()) {
						rs.close();
					}
				}catch(Exception e) {
				}
			}
			if(pstmt != null) {
				try {
					if(!pstmt.isClosed()) {
						pstmt.close();
					}
				}catch(Exception e) {
				}
			}
		}
		return dto;
	}

	public CompaniesDTO readCompany(String email) {
		// TODO Auto-generated method stub
		CompaniesDTO dto = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;
		
		try {
			sql = "select levelCode, memberPwd, companyName from member m1 join company c on m1.memberEmail = c.companyEmail where memberEmail=?";
			System.out.println(email);
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, email);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				dto = new CompaniesDTO();
				dto.setCompanyEmail(email);
				dto.setLevelCode(rs.getInt(1));
				dto.setCompanyPwd(rs.getString(2));
				dto.setCompanyName(rs.getString(3));
				dto.setStatusCode(rs.getInt(4));
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(rs != null) {
				try {
					if(!rs.isClosed()) {
						rs.close();
					}
				}catch(Exception e) {
				}
			}
			if(pstmt != null) {
				try {
					if(!pstmt.isClosed()) {
						pstmt.close();
					}
				}catch(Exception e) {
				}
			}
		}
		return dto;
	}
	
	public UserDTO readUpd_user(String email) {
		UserDTO dto = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		StringBuffer sb = new StringBuffer();
		
		try {
			sb.append("SELECT memberEmail, memberPwd, levelcode, userName, address, birth, gender");
			sb.append("	FROM member m");
			sb.append("	JOIN member_user mu");
			sb.append("		ON m.memberEmail = mu.userEmail");
			sb.append("	WHERE m.memberEmail = ?");
			
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setString(1, email);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				dto = new UserDTO();
				dto.setUserEmail(rs.getString("memberEmail"));
				dto.setUserPwd(rs.getString("memberPwd"));
				dto.setUserName(rs.getString("userName"));
				dto.setAddress(rs.getString("address"));
				dto.setBirth(rs.getDate("birth").toString());
				dto.setGender(rs.getString("gender"));
				dto.setLevelCode(rs.getInt("levelCode"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(rs != null) {
				try {
					rs.close();
				} catch (Exception e2) {
					
				}
			}
			
			if(pstmt != null) {
				try {
					pstmt.close();
				} catch (Exception e2) {
					
				}
			}
		}
		
		return dto;
	}
}
