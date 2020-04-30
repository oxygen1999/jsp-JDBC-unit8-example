<%@ page contentType="text/html; charset=gb2312"  language="java" errorPage=""%>
<%@ page import="java.sql.*" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%String id=request.getParameter("id");
	String url = "jdbc:mysql://localhost/ch08";
	String userName = "root";
	String password = "123";
	String sql = null;
	Connection conn = null;
	Statement stmt = null;
	try {
		Class.forName("com.mysql.jdbc.Driver");
	} catch(ClassNotFoundException e) {
		System.out.println("¼ÓÔØÇý¶¯Æ÷ÀàÊ±³öÏÖÒì³£");
	}
		conn = DriverManager.getConnection(url, userName, password);
		
		//´´½¨StatementÓï¾ä
		stmt = conn.createStatement(ResultSet.TYPE_FORWARD_ONLY,
				                    ResultSet.CONCUR_UPDATABLE);	
		url="delete from student where stu_id="+id;
		stmt.executeUpdate(url);
		response.sendRedirect("select.jsp");
		%>
</body>
</html>