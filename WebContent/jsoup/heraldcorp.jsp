<%@page import="java.io.IOException"%>
<%@page import="org.jsoup.nodes.Document"%>
<%@page import="org.jsoup.select.Elements"%>
<%@page import="org.jsoup.nodes.Element"%>
<%@page import="org.jsoup.Jsoup"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%  String url ="http://biz.heraldcorp.com/";
	String line="";
	try{
		Document doc;
		doc = Jsoup.connect(url).get();
		Elements media1 = doc.select("div[class=con_left] > div[class=main]");
		Elements media3 = doc.select("script");
		Elements media4 = doc.select("link");
		for(Element src : media1){
			String templine = src.toString();
			line+=templine;
		}
		for(Element src : media3){
			String templine = src.toString();
			line+=templine;
		}
		for(Element src : media4){
			String templine = src.toString();
			line+=templine;
		}
	}catch(IOException e){
		e.printStackTrace();
	}
%>
<%=line %>
</body>
</html>