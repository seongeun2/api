<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="array.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.0/jquery.min.js"></script>
	<script src="./Chart.min.js"></script>
<title>Insert title here</title>
</head>
<body>
<div style="width: 60%">
		<canvas id="canvas" height="450" width="600"></canvas>
	</div>
	<input type="button" id="btnAdd" value="add data">

	<script type="text/javascript">
		var randomScalingFactor = function(){ return Math.round(Math.random()*100)};
		var months = [	"<%=labels[0]%>","<%=labels[1]%>",
						"<%=labels[2]%>","<%=labels[3]%>",
						"<%=labels[4]%>","<%=labels[5]%>",
					  	"<%=labels[6]%>","<%=labels[7]%>",
					  	"<%=labels[8]%>","<%=labels[9]%>",
					  	"<%=labels[10]%>","<%=labels[11]%>"];
		var barChart = null;
		var barChartData = {
			labels : [	"<%=labels[0]%>","<%=labels[1]%>",
						"<%=labels[2]%>","<%=labels[3]%>",
						"<%=labels[4]%>","<%=labels[5]%>",
						"<%=labels[6]%>"],
			datasets : [
				{
					fillColor : "rgba(220,220,220,0.5)",
					strokeColor : "rgba(220,220,220,0.8)",
					highlightFill: "rgba(220,220,220,0.75)",
					highlightStroke: "rgba(220,220,220,1)",
					data : [<%=value1[0]%>,
							<%=value1[1]%>,
							<%=value1[2]%>,
							<%=value1[3]%>,
							<%=value1[4]%>,
							<%=value1[5]%>,
							<%=value1[6]%>]
				},
				{
					fillColor : "rgba(151,187,205,0.5)",
					strokeColor : "rgba(151,187,205,0.8)",
					highlightFill : "rgba(151,187,205,0.75)",
					highlightStroke : "rgba(151,187,205,1)",
					data : [<%=value2[0]%>,
							<%=value2[1]%>,
							<%=value2[2]%>,
							<%=value2[3]%>,
							<%=value2[4]%>,
							<%=value2[5]%>,
							<%=value2[6]%>]
				}
			]

		};

		$(function() {
			var ctx = document.getElementById("canvas").getContext("2d");
			barChart = new Chart(ctx).Bar(barChartData, {
				//Boolean - Whether the scale should start at zero, or an order of magnitude down from the lowest value
				scaleBeginAtZero : false,
				//Boolean - Whether grid lines are shown across the chart
				scaleShowGridLines : true,
				//String - Colour of the grid lines
				scaleGridLineColor : "rgba(0,0,0,0.05)",
				//Number - Width of the grid lines
				scaleGridLineWidth : 1,
				//Boolean - If there is a stroke on each bar
				barShowStroke : false,
				//Number - Pixel width of the bar stroke
				barStrokeWidth : 2,
				//Number - Spacing between each of the X value sets
				barValueSpacing : 5,
				//Number - Spacing between data sets within X values
				barDatasetSpacing : 1,
				onAnimationProgress: function() {
					console.log("onAnimationProgress");
				},
				onAnimationComplete: function() {
					console.log("onAnimationComplete");
				}
			});
		});

		$("input#btnAdd").on("click", function() {
			barChart.addData(
				[randomScalingFactor(),randomScalingFactor()], 
				months[(barChart.datasets[0].bars.length)%12]
			);
		});

		$("canvas").on("click", function(e) {
			var activeBars = barChart.getBarsAtEvent(e);
			console.log(activeBars);

			for(var i in activeBars) {
				console.log(activeBars[i].value);
			}
		});

	</script>
</body>
</html>