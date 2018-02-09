<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	String[] labels = {"January", "February", "March", "April", "May", "June", "July", "August", "September", "October",
			"November", "December" };
	int[] value1 = new int[labels.length];
	int[] value2 = new int[labels.length];
	int[] value3 = new int[labels.length];
	
	for(int i=0; i<labels.length; i++){
		int temp = (int) (Math.random()*100);
		value1[i] = temp;
		temp = (int) (Math.random()*100);
		value2[i] = temp;
		temp = (int) (Math.random()*100);
		value3[i] = 65;
	}
	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>

</body>
</html>