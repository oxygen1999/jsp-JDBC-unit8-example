<%@ page contentType="text/html; charset=gb2312"  language="java" errorPage=""%>
<%@ page import="java.sql.*" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
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
		System.out.println("加载驱动器类时出现异常");
	}
		conn = DriverManager.getConnection(url, userName, password);
		
		//创建Statement语句
		stmt = conn.createStatement();	
		
		url="select * from student where stu_id="+id;
		ResultSet rs=stmt.executeQuery(url);
		rs.next();
		%>
		<form method=post action="update2.jsp?id=<%=rs.getString(1)%>">
		<table border=0>
		 <tr>
 
	 <tr>
      <td height="54" align="center">用户名：</td>
      <td width="181" height=54>
        <input id=Username name=Username value=<%=rs.getString(2)%> >
      </TD>
   </TR>	
	 <tr>
      <td height="54" align="center">地址：</td>
      <td width="181" height=54>
        <input id=Address name=Address value=<%=rs.getString(3)%> >
      </TD>
   </TR>
    <tr>
      <td height="54" align="center">出生年月：</td>
      <td width="181" height=54>
        <input id=birth name=birth value=<%=rs.getString(4)%> >
      </TD>
   </TR>
		   <tr>
 <td>
        <input  type="submit"  value=修改 %> 
      </Td>
   </TR>	

	</table>
</body>
</html>