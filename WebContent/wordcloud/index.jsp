<%@page import="java.util.Set"%>
<%@page import="ch01.DataMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<meta name="description" content="A Word Cloud plugin for jQuery.">
<meta name="viewport" content="width=device-width,initial-scale=1">
<title>jsoup awesomeCloud Plugin Demos</title>
</head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.0/jquery.min.js"></script>
<script src="jquery.awesomeCloud-0.2.js"></script>
<style type="text/css">
.wordcloud {
	border: 1px solid #036;
	height: 7in;
	margin: 0.5in auto;
	padding: 0;
	page-break-after: always;
	page-break-inside: avoid;
	width: 7in;
}
</style>
<link href="http://www.jqueryscript.net/css/jquerysctipttop.css"
	rel="stylesheet" type="text/css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" 
href="https://www.w3schools.com/w3css/4/w3.css">
<body>

<form name="f" class="w3-container"  method="post">
  <label>URL</label>
  <input class="w3-input" type="text" name="url"  
   value="https://search.naver.com/search.naver?where=nexearch&sm=top_hty&fbm=1&ie=utf8&query=">
  <label>선택자 </label>
  <input class="w3-input" type="text" name="selector"   
  value="div[class~=section]">
   <input class="w3-input" type="text" name="searchKey"   
  value="홍대카페">
 <input class="w3-input" type="submit" 
 value="wordcloud 출력하기"> 
</form>
<%
request.setCharacterEncoding("euc-kr");
if(request.getParameter("url")!=null && !request.getParameter("url").equals("")){
	String url = request.getParameter("url");
	String selector = request.getParameter("selector");
	String querytemp = request.getParameter("searchKey");
%>
<h1>url: <%=url %></h1>
<h2>select: <%=request.getParameter("selecter") %></h2>
<%
	url = url+URLEncoder.encode(querytemp, "utf-8");
	System.out.println(querytemp+"-----"+url);
	Map <String, Long> map = DataMap.map(url, selector, 0);
	Set <Map.Entry<String, Long>> set = map.entrySet();
	int cnt = set.size();
%>
<header style = "margin-top: 50px;">
</header>
<div role="main">
	<div id="wordcloud1" class="wordcloud">
	<%for(Map.Entry<String, Long> m : set) {
		if(m.getValue()>1){	%>
	<span data-weight="<%=m.getValue()*5 %>"><%=m.getKey() %></span>
	<%}} %>
	</div>
</div>
<script>
		$(document).ready(function() {
			
			$("#wordcloud1").awesomeCloud({
				"size" : {
					"grid" : 9,
					"factor" : 1
				},
				"options" : {
					"color" : "random-dark",
					"rotationRatio" : 0.35
				},
				"font" : "'Times New Roman', Times, serif",
				"shape" : "circle"
			});
			
		});
	</script>
	<script type="text/javascript">
		var _gaq = _gaq || [];
		_gaq.push([ '_setAccount', 'UA-36251023-1' ]);
		_gaq.push([ '_setDomainName', 'jqueryscript.net' ]);
		_gaq.push([ '_trackPageview' ]);

		(function() {
			var ga = document.createElement('script');
			ga.type = 'text/javascript';
			ga.async = true;
			ga.src = ('https:' == document.location.protocol ? 'https://ssl'
					: 'http://www')
					+ '.google-analytics.com/ga.js';
			var s = document.getElementsByTagName('script')[0];
			s.parentNode.insertBefore(ga, s);
		})();
	</script>
	
	<% } %>
</body>
</html>