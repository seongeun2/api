<%@page import="java.io.IOException"%>
<%@page import="org.jsoup.nodes.Element"%>
<%@page import="org.jsoup.nodes.Document"%>
<%@page import="org.jsoup.select.Elements"%>
<%@page import="org.jsoup.Jsoup"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
String url ="http://info.finance.naver.com/marketindex/exchangeDetail.nhn?marketindexCd=FX_JPYKRW";

String line="";
try{
	Document doc;
	doc = Jsoup.connect(url).get();
	Elements media1 = doc.select("iframe");
		for(Element src : media1){
			String templine = src.toString();
			templine = templine.replace("src=\"","src=\"http://info.finance.naver.com/");
			line+=templine;
		}
}catch(IOException e){
	e.printStackTrace();
}
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<%=line %>
</body>
</html>