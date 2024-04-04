<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>BugClean</title>
    <!-- Favicon icon -->
	<c:import url="./temp/css.jsp"></c:import>



</head>

<body>
    
    <c:import url="./temp/header.jsp"></c:import>
    <c:import url="./temp/sidebar.jsp"></c:import>
        
        <div class="content-body">
            <div class="container-fluid mb-5">

                <h3 style="font-weight: bold;">안녕하세요 김사원님!!!!!!!!</h3>
                
                
                <div class="row">
                    <div class="col-sm-6">
                        <div class="card">
                            <div class="card-body">
                                <h2 id="clock">00:00:00</h2>
                                <p>All Sales</p>
                            </div>
                            <div class="chart-wrapper">
                                <div class="chartjs-size-monitor">
                                    <div class="chartjs-size-monitor-expand">
                                        <div class=""></div>
                                    </div>
                                    <div class="chartjs-size-monitor-shrink">
                                        <div class="">
                                        </div>
                                    </div>
                                </div>
                                <canvas id="chart_widget_14" height="200" style="display: block; width: 403px; height: 200px;" width="403" class="chartjs-render-monitor"></canvas>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div class="card">
                            <div class="card-body">
                                <h5>570</h5>
                                <p>All Sales</p>
                            </div>
                            <div class="chart-wrapper">
                                <div class="chartjs-size-monitor">
                                    <div class="chartjs-size-monitor-expand">
                                        <div class=""></div>
                                    </div>
                                    <div class="chartjs-size-monitor-shrink">
                                        <div class=""></div>
                                    </div>
                                </div>
                                <canvas id="chart_widget_15" height="200" style="display: block; width: 403px; height: 200px;" width="403" class="chartjs-render-monitor"></canvas>
                            </div>
                        </div>
                    </div>
                </div>


                <div class="row">
                    <div class="col-sm-12">
                        <div class="card">
                            <div class="card-body">
                                <h5>570</h5>
                                <p>All Sales</p>
                            </div>
                            <div class="chart-wrapper">
                                <div class="chartjs-size-monitor">
                                    <div class="chartjs-size-monitor-expand">
                                        <div class=""></div>
                                    </div>
                                    <div class="chartjs-size-monitor-shrink">
                                        <div class="">
                                        </div>
                                    </div>
                                </div>
                                <canvas id="chart_widget_14" height="200" style="display: block; width: 403px; height: 200px;" width="403" class="chartjs-render-monitor"></canvas>
                            </div>
                        </div>
                    </div>
                </div>
               

            </div>
        </div>

        
        
        <c:import url="./temp/footer.jsp"></c:import>
        <c:import url="./temp/js.jsp"></c:import>
        <script>
            const clock = document.getElementById("clock");
            function getClock(){
                const date = new Date();	// 현재 날짜 및 시간
                const hour = String(date.getHours()).padStart(2,"0");
                const minutes = String(date.getMinutes()).padStart(2,"0");
                const second = String(date.getSeconds()).padStart(2,"0");
                clock.innerText = `${hour}:${minutes}:${seconds}`;
            }
            getClock();
            setInterval(getClock, 1000);
        </script>
    </body>
    
    