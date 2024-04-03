<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
    <!--**********************************
        Scripts
    ***********************************-->
    <!-- Required vendors -->
    <script src="/focus-bootstrap-main/theme/vendor/global/global.min.js"></script>
    <script src="/focus-bootstrap-main/theme/js/quixnav-init.js"></script>
    <script src="/focus-bootstrap-main/theme/js/custom.min.js"></script>


    <!-- Vectormap -->
    <script src="/focus-bootstrap-main/theme/vendor/raphael/raphael.min.js"></script>
    <script src="/focus-bootstrap-main/theme/vendor/morris/morris.min.js"></script>


    <script src="/focus-bootstrap-main/theme/vendor/circle-progress/circle-progress.min.js"></script>
    <script src="/focus-bootstrap-main/theme/vendor/chart.js/Chart.bundle.min.js"></script>

    <script src="/focus-bootstrap-main/theme/vendor/gaugeJS/dist/gauge.min.js"></script>

    <!--  flot-chart js -->
    <script src="/focus-bootstrap-main/theme/vendor/flot/jquery.flot.js"></script>
    <script src="/focus-bootstrap-main/theme/vendor/flot/jquery.flot.resize.js"></script>

    <!-- Owl Carousel -->
    <script src="/focus-bootstrap-main/theme/vendor/owl-carousel/js/owl.carousel.min.js"></script>

    <!-- Counter Up -->
    <script src="/focus-bootstrap-main/theme/vendor/jqvmap/js/jquery.vmap.min.js"></script>
    <script src="/focus-bootstrap-main/theme/vendor/jqvmap/js/jquery.vmap.usa.js"></script>
    <script src="/focus-bootstrap-main/theme/vendor/jquery.counterup/jquery.counterup.min.js"></script>


    <script src="/focus-bootstrap-main/theme/js/dashboard/dashboard-1.js"></script>
    
    <!-- messenger js -->
    <script>
        let messenger_img = document.getElementById("messenger_img");
        let messenger_div = document.getElementById("messenger_div");
        let msg_list = document.getElementById("messenger_list_icon");
        let msg_msg = document.getElementById("messenger_msg_icon");
        let msg_emp_list = document.getElementById("messenger_emp_list");
        let msg_msg_list = document.getElementById("messenger_msg_list");


        function messenger_toggle(){
            if(messenger_div.classList.contains("display_none")){
                messenger_div.classList.remove("display_none");
            }else{
                messenger_div.classList.add("display_none");
            }
          }
          function change_emp_list(){
           msg_emp_list.classList.remove("display_none");
           msg_msg_list.classList.add("display_none"); 
          }
          function change_msg_list(){
           msg_msg_list.classList.remove("display_none");
           msg_emp_list.classList.add("display_none");   
          }

    </script>
    