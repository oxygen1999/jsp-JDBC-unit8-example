<%@ page contentType="text/html; charset=gb2312"  language="java" errorPage=""%>
<%@ page import="java.sql.*" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>Insert title here</title>
</head>
<body>
<%request.setCharacterEncoding("gb2312"); %>
<%
String id=request.getParameter("id");
		String name=request.getParameter("Username");
		String Addr=request.getParameter("Address");
		String b=request.getParameter("birth");
		String url = "jdbc:mysql://localhost/ch08";
		String userName = "root";
		String password = "123";
		String sql = null;
		Connection conn = null;
		Statement stmt = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch(ClassNotFoundException e) {
			System.out.println("加载驱动器类时出现异常");
		}
			conn = DriverManager.getConnection(url, userName, password);
			
			//创建Statement语句
			stmt = conn.createStatement();	
		sql="update student set name='"+name+"',address='"+Addr+"',birthday='"+b+"'where stu_id='"+id+"'";
		stmt.executeUpdate(sql);
		response.sendRedirect("select.jsp");
	%>
</body>
</html>