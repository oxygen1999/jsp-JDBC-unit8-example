<%@ page contentType="text/html; charset=gb2312"  language="java" errorPage=""%>
<%@ page import="java.sql.*" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

  <table width="740" border="1" cellspacing="0" cellpadding="6">
    <tr> 
      <td width="120" align="center" valign="middle">���</td>
      <td width="145" align="center">����</td>
      <td width="100" align="center">��ַ</td>
      <td width="148" align="center">��������</td>
      <td >����</td> 
       <td >����</td>       
    </tr>
<%
	String url = "jdbc:mysql://localhost/ch08";
	String userName = "root";
	String password = "123";
	String sql = null;
	Connection conn = null;
	Statement stmt = null;
	try {
		Class.forName("com.mysql.jdbc.Driver");
	} catch(ClassNotFoundException e) {
		System.out.println("������������ʱ�����쳣");
	}
		conn = DriverManager.getConnection(url, userName, password);
		
		//����Statement���
		stmt = conn.createStatement();	
		url="select * from student";
		ResultSet rs=stmt.executeQuery(url);
		while(rs.next())
		{String id=rs.getString(1);%>
		
	<tr> 
      <td ><%=id%></td>
      <td ><%=rs.getString(2)%></td>
      <td ><%=rs.getString(3)%></td>
      <td align="center" valign="middle"><%=rs.getString(4)%></td>
      <td><a href="update.jsp?id=<%=id %>">�޸�</a></td>
      <td><a href="delete.jsp?id=<%=id %>">ɾ��</a></td>
    </tr>
			
	<%	}%>
	</table>
	<a href="insert.jsp"> �����ѧ��</a>
</body>
</html>