<%@ page contentType="text/html; charset=gb2312"  language="java" errorPage=""%>
<%@ page import="java.sql.*" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%request.setCharacterEncoding("gb2312"); %>
<%
String name=request.getParameter("Username");
String Addr=request.getParameter("Address");
String b=request.getParameter("birth");
if(name!=null)
{
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
		//ResultSet rs=stmt.executeQuery("select Max() from student");
		//rs.next();
		//int id=Integer.parseInt(rs.getString(1))+1;
		url="insert into student(name,address,birthday) values('"+name+"','"+Addr+"','"+b+"')";
		stmt.executeUpdate(url);
		response.sendRedirect("select.jsp");
	}else {%>
<form method=post>
		<table border=0>
	 <tr>
      <td height="54" align="center">�û�����</td>
      <td width="181" height=54>
        <input id=Username name=Username > 
      </TD>
   </TR>	
	 <tr>
      <td height="54" align="center">��ַ��</td>
      <td width="181" height=54>
        <input id=Address name=Address > 
      </TD>
   </TR>
    <tr>
      <td height="54" align="center">�������£�</td>
      <td width="181" height=54>
        <input id=birth name=birth> 
      </TD>
   </TR>
		   <tr>
 <td>
        <input  type="submit"  value=���� %> 
      </Td>
   </TR>	

	</table>
	<%} %>
</body>
</html>
