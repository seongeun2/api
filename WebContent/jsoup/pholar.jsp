<%@page import="java.net.URLDecoder"%>
<%@page import="org.jsoup.nodes.Element"%>
<%@page import="org.jsoup.select.Elements"%>
<%@page import="org.jsoup.Jsoup"%>
<%@page import="org.jsoup.nodes.Document"%>
<%@page import="java.io.IOException"%>
<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<html>
<head>
<title>Insert title here</title>

<meta charset="EUC-KR">
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
html,body,h1,h2,h3,h4 {font-family:"Raleway", sans-serif}
.community {display:hidden; }
a { text-decoration:none }
</style>
</head>
<%  //String url ="http://www.pholar.co/gallery/postTag?tag="+encode;
request.setCharacterEncoding("euc-kr");
String name = "미디움레이어드컷";
System.out.println(request.getParameter("name"));
if(request.getParameter("name")!=null)
   name = request.getParameter("name");
String encode= URLEncoder.encode(name,"utf-8");
String decode= URLDecoder.decode(encode);
String url ="http://www.pholar.co/gallery/postTag?tag="+encode;
System.out.println("["+url+"]"+decode+":"+encode);
String line="";
try{Document doc; doc = Jsoup.connect(url).get();
Elements media = doc.select(".gallery_wrap");
Elements link = doc.select("link");
Elements script = doc.select("script");
for(Element src :media){String templine = src.toString();
line+=templine;}

for(Element src :link){String templine = src.toString();
line+=templine;}
for(Element src :script){String templine = src.toString();
line+=templine;}

   
   
}catch(IOException e){e.printStackTrace();}
%><body><form method ="post">
   <input type ="text" name="name" id ="name"/>
   <input type = "submit" value ="입력"/>
</form><%=line %></body>
</html>