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

                <h3 style="font-weight: bold;">안녕하세요 김사원님!</h3>
                
                
                <!-- <div class="row">
                    <div class="col-sm-6">
                        <div class="card">
                            <div class="card-body">
                                <h2 id="clock">00:00:00</h2>
                            </div>
                            <div class="chart-wrapper">
                                
                                <div class="text-center mt-4 mx-5">
                                    <button type="submit" class="btn btn-light btn-block">출근</button>
                                    <button type="submit" class="btn btn-dark btn-block">퇴근</button>
                                </div>




                                
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
                </div> -->
               
                <div class="row">
                    <div class="col-lg-5">
                        <div class="card">
                            <div class="card-header">
                                <h4 class="card-title">T&A</h4>
                            </div>
                            <div class="card-body">
                                <div class="bootstrap-media">
                                    <div class="media">
                                        
                                        <div class="media-body">


                                            <div class="card-body" style="text-align: center;">
                                                <h2 id="clock">00:00:00</h2>
                                            </div>
                                            
                                                
                                                <div class="text-center mt-4 mx-3">
                                                    <button type="submit" class="btn btn-light btn-block" style="font-weight: bold;">출근</button>
                                                    <button type="submit" class="btn btn-dark btn-block" style="font-weight: bold;">퇴근</button>
                                                </div>

                                                <div class="text-center mt-4 mx-3">
                                                    <table>
                                                        <thead>
                                                            <tr>
                                                                <td>출근 시간</th>
                                                                <td>07:35:12</th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                            <tr>
                                                                <td>퇴근 시간</td>
                                                                <td>-</td>
                                                            </tr>

                                                    </table>

                                                </div>
                                            
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-7">
                        <div class="card">
                            <div class="card-header">
                                <h4 class="card-title">Notice</h4>
                            </div>
                            <div class="card-body py-1">
                                <div class="bootstrap-media">

                                    <table class="table header-border table-responsive-sm">
                                        <thead>
                                            <tr>
                                                <th>No.</th>
                                                <th>Title</th>
                                                <th>Date</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td>217</td>
                                                <td><a href="javascript:void(0)">공지입니당!</a></td>
                                                <td>2024-04-05</td>
                                            </tr>
                                            <tr>
                                                <td>217</td>
                                                <td><a href="javascript:void(0)">공지입니당!</a></td>
                                                <td>2024-04-05</td>
                                            </tr>
                                            <tr>
                                                <td>217</td>
                                                <td><a href="javascript:void(0)">공지입니당!</a></td>
                                                <td>2024-04-05</td>
                                            </tr>
                                            <tr>
                                                <td>217</td>
                                                <td><a href="javascript:void(0)">공지입니당!</a></td>
                                                <td>2024-04-05</td>
                                            </tr>
                                            <tr>
                                                <td>217</td>
                                                <td><a href="javascript:void(0)">공지입니당!</a></td>
                                                <td>2024-04-05</td>
                                            </tr>
                                            
                                        </tbody>
                                    </table>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-12">
                        <div class="card">
                            <div class="card-header">
                                <h4 class="card-title">Media list</h4>
                            </div>
                            <div class="card-body">
                                <div class="bootstrap-media">
                                    <ul class="list-unstyled">
                                        <li class="media">
                                            <img class="mr-3" src="./images/avatar/8.jpg" alt="Quixkit">
                                            <div class="media-body">
                                                <h5 class="mt-0 mb-1">List-based media object</h5>
                                                Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.
                                                vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.
                                            </div>
                                        </li>
                                        <li class="media my-4">
                                            <img class="mr-3" src="./images/avatar/1.jpg" alt="Quixkit">
                                            <div class="media-body">
                                                <h5 class="mt-0 mb-1">List-based media object</h5>
                                                Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.
                                                vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.
                                            </div>
                                        </li>
                                        <li class="media">
                                            <img class="mr-3" src="./images/avatar/2.jpg" alt="Quixkit">
                                            <div class="media-body">
                                                <h5 class="mt-0 mb-1">List-based media object</h5>
                                                Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.
                                                vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.
                                            </div>
                                        </li>
                                    </ul>
                                </div>
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
                const date = new Date();	//현재날짜,시간
                const hour = String(date.getHours()).padStart(2,"0");
                const minutes = String(date.getMinutes()).padStart(2,"0");
                const second = String(date.getSeconds()).padStart(2,"0");
                clock.innerText = hour+":"+minutes+":"+second;
                //clock.innerText = `${hour}:${minutes}:${second}`;
            }
            getClock();
            setInterval(getClock, 1000);
        </script>
    </body>
    
    