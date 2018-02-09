<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="array.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
    <script src="Chart.bundle.js"></script>
    <style>
    canvas {
        -moz-user-select: none;
        -webkit-user-select: none;
        -ms-user-select: none;
    }
    </style>
</head>
<body>
<div style="width: 75%">
        <canvas id="canvas"></canvas>
    </div>
    <button id="randomizeData">Randomize Data</button>
    <script>
    
    var randomScalingFactor = function() {
        return (Math.random() > 0.5 ? 1.0 : -1.0) * Math.round(Math.random() * 100);
    };
    var randomColorFactor = function() {
        return Math.round(Math.random() * 255);
    };
    var randomColor = function() {
        return 'rgba(' + randomColorFactor() + ',' + randomColorFactor() + ',' + randomColorFactor() + ',.7)';
    };

    var barChartData = {
        labels: ["<%=labels[0]%>", "<%=labels[1]%>", "<%=labels[2]%>", "<%=labels[3]%>", "<%=labels[4]%>", "<%=labels[5]%>", "<%=labels[6]%>"],
        datasets: [{
            label: 'Dataset 1',
            backgroundColor: "rgba(220,220,220,0.5)",
            yAxisID: "y-axis-1",
            data: [<%=value1[0]%>, <%=value1[1]%>, <%=value1[2]%>, <%=value1[3]%>, <%=value1[4]%>, <%=value1[5]%>, <%=value1[6]%>]
        }, {
            label: 'Dataset 2',
            backgroundColor: "rgba(151,187,205,0.5)",
            yAxisID: "y-axis-2",
            data: [<%=value2[0]%>, <%=value2[1]%>, <%=value2[2]%>, <%=value2[3]%>, <%=value2[4]%>, <%=value2[5]%>, <%=value2[6]%>]
        }, {
            label: 'Dataset 3',
            backgroundColor: [randomColor(), randomColor(), randomColor(), randomColor(), randomColor(), randomColor(), randomColor()],
            yAxisID: "y-axis-1",
            data: [<%=value3[0]%>, <%=value3[1]%>, <%=value3[2]%>, <%=value3[3]%>, <%=value3[4]%>, <%=value3[5]%>, <%=value3[6]%>]
        }]

    };
    window.onload = function() {
        var ctx = document.getElementById("canvas").getContext("2d");
        window.myBar = Chart.Bar(ctx, {
            data: barChartData, 
            options: {
                responsive: true,
                hoverMode: 'label',
                hoverAnimationDuration: 400,
                stacked: false,
                title:{
                    display:true,
                    text:"Chart.js Bar Chart - Multi Axis"
                },
                scales: {
                    yAxes: [{
                        type: "linear", // only linear but allow scale type registration. This allows extensions to exist solely for log scale for instance
                        display: true,
                        position: "left",
                        id: "y-axis-1",
                    }, {
                        type: "linear", // only linear but allow scale type registration. This allows extensions to exist solely for log scale for instance
                        display: true,
                        position: "right",
                        id: "y-axis-2",
                        gridLines: {
                            drawOnChartArea: false
                        }
                    }],
                }
            }
        });
    };

    $('#randomizeData').click(function() {
        $.each(barChartData.datasets, function(i, dataset) {
            if (Chart.helpers.isArray(dataset.backgroundColor)) {
                dataset.backgroundColor= [randomColor(), randomColor(), randomColor(), randomColor(), randomColor(), randomColor(), randomColor()];
            } else {
                dataset.backgroundColor= randomColor();
            }

            dataset.data = [randomScalingFactor(), randomScalingFactor(), randomScalingFactor(), randomScalingFactor(), randomScalingFactor(), randomScalingFactor(), randomScalingFactor()];

        });
        window.myBar.update();
    });
    </script>
</body>
</html>