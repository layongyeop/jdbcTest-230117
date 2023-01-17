<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보 리스트</title>
</head>
<body>
	<%!
		String driverName = "com.mysql.jdbc.Driver";
		String url = "jdbc:mysql://localhost:3306/webdb";
		String username = "root";
		String password = "1234";
		
		String sql=	"SELECT * FROM members";
		
		Connection conn;//DB 연결 선언
		Statement stmt;//stmt 선언
		ResultSet rs;// rs선언
		
		
		
	%>
	<%
		try {
			Class.forName(driverName);//드라이버 불러오기	
			
			conn = DriverManager.getConnection(url, username, password);//DB 연동
			
			stmt = conn.createStatement();
			
			rs = stmt.executeQuery(sql); // select문이 반환하는 레코드 저장
			
			
			while(rs.next()){
				String db_id = rs.getString("id");
				String db_pw = rs.getString("password");
				String db_name = rs.getString("name");
				String db_email = rs.getString("email");
				String db_jointime = rs.getString("jointime");
				 
				out.println(db_id+"/ "+db_pw+"/ "+db_name+"/ "+db_email+"/ "+db_jointime+"<br>");
				
			}
			
			
	
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs != null) {
					rs.close();
				}
				if(stmt != null) {
					stmt.close();
				}
				
				if(conn != null) {
					conn.close();
				}
			} catch(Exception e) {
				e.printStackTrace();
			}
		}
	
	
	%>
		<br>
		<a href="join.jsp">회원가입으로 가기</a>
		<br>
		<a href="withdraw.jsp">회원탈퇴로 가기</a>

</body>
</html>