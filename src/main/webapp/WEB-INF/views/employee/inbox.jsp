<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>BugClean</title>
</head>
<c:import url="../temp/css.jsp"></c:import> <!-- //bootstrap-template-css -->
<body>
<div id="preloader">
    <div class="sk-three-bounce">
        <div class="sk-child sk-bounce1"></div>
        <div class="sk-child sk-bounce2"></div>
        <div class="sk-child sk-bounce3"></div>
    </div>
</div>
<div id="main-wrapper">

    <c:import url="../temp/header.jsp"></c:import> <!-- //nav-header -->
    <c:import url="../temp/sidebar.jsp"></c:import> <!-- //sidebar-menu -->

    <div class="content-body " style="min-height:900px;">
        <div class="container-fluid">
            <div class="row page-titles mx-0">
                <div class="col-sm-6 p-md-0">
                    <div class="welcome-text">
                        <h4 style="font-weight: bolder;">&ensp; 수신문서함</h4>
                    </div>
                </div>
                <div class="col-sm-6 p-md-0 justify-content-sm-end mt-2 mt-sm-0 d-flex">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="/">Home</a></li>
                        <li class="breadcrumb-item active">문서함</li>
                        <li class="breadcrumb-item active"><a href="./">Inbox</a></li>
                    </ol>
                </div>
            </div>
            <!-- row -->


            <div class="row">
                
                <div class="col-12">
                    <div class="card">
                        <div class="card-header">
                            <h4 class="card-title" style="font-weight: bold;">문서 목록</h4>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <div id="example2_wrapper" class="dataTables_wrapper">
                                    <!-- 서치 -->
                                    <div id="example2_filter" class="dataTables_filter">
                                        <label>Search:
                                            <input type="search" class="" placeholder="" aria-controls="example2">
                                        </label>
                                    </div>


                                    <div class="dataTables_scroll">
                                        <div class="dataTables_scrollHead" style="overflow: hidden; position: relative; border: 0px; width: 100%;">
                                            <div class="dataTables_scrollHeadInner" style="box-sizing: content-box; width: 898px; padding-right: 23px;">
                                                <table class="display dataTable" style="width: 898px; margin-left: 0px;" role="grid">
                                                    <thead>
                                                        <tr role="row">
                                                            <th class="sorting_asc" tabindex="0" aria-controls="example2" rowspan="1" colspan="1" style="width: 144.229px;" aria-sort="ascending" aria-label="Name: activate to sort column descending">문서번호</th>
                                                            <th class="sorting" tabindex="0" aria-controls="example2" rowspan="1" colspan="1" style="width: 211.708px;" aria-label="Position: activate to sort column ascending">제목</th>
                                                            <th class="sorting" tabindex="0" aria-controls="example2" rowspan="1" colspan="1" style="width: 109.521px;" aria-label="Office: activate to sort column ascending">기안자</th>
                                                            <th class="sorting" tabindex="0" aria-controls="example2" rowspan="1" colspan="1" style="width: 35.875px;" aria-label="Age: activate to sort column ascending">기안일</th>
                                                            <th class="sorting" tabindex="0" aria-controls="example2" rowspan="1" colspan="1" style="width: 93.7917px;" aria-label="Start date: activate to sort column ascending">기안일</th>
                                                            <th class="sorting" tabindex="0" aria-controls="example2" rowspan="1" colspan="1" style="width: 86.875px;" aria-label="Salary: activate to sort column ascending">상태</th>
                                                        </tr>
                                                    </thead>
                                                </table>
                                            </div>
                                        </div>
                                        <div class="dataTables_scrollBody" style="position: relative; overflow: auto; max-height: 42vh; width: 100%;">
                                            <table id="example2" class="display dataTable" style="width: 100%;" role="grid" aria-describedby="example2_info">
                                                <thead>
                                                    <tr role="row" style="height: 0px;">
                                                        <th class="sorting" aria-controls="example2" rowspan="1" colspan="1" style="width: 144.229px; padding-top: 0px; padding-bottom: 0px; border-top-width: 0px; border-bottom-width: 0px; height: 0px;">
                                                            <div class="dataTables_sizing" style="height: 0px; overflow: hidden;">문서번호</div>
                                                        </th>
                                                        <th class="sorting" aria-controls="example2" rowspan="1" colspan="1" style="width: 211.708px; padding-top: 0px; padding-bottom: 0px; border-top-width: 0px; border-bottom-width: 0px; height: 0px;">
                                                            <div class="dataTables_sizing" style="height: 0px; overflow: hidden;">제목</div>
                                                        </th>
                                                        <th class="sorting" aria-controls="example2" rowspan="1" colspan="1" style="width: 109.521px; padding-top: 0px; padding-bottom: 0px; border-top-width: 0px; border-bottom-width: 0px; height: 0px;">
                                                            <div class="dataTables_sizing" style="height: 0px; overflow: hidden;">기안자</div>
                                                        </th>
                                                        <th class="sorting" aria-controls="example2" rowspan="1" colspan="1" style="width: 35.875px; padding-top: 0px; padding-bottom: 0px; border-top-width: 0px; border-bottom-width: 0px; height: 0px;">
                                                            <div class="dataTables_sizing" style="height: 0px; overflow: hidden;">기안일</div>
                                                        </th>
                                                        <th class="sorting" aria-controls="example2" rowspan="1" colspan="1" style="width: 93.7917px; padding-top: 0px; padding-bottom: 0px; border-top-width: 0px; border-bottom-width: 0px; height: 0px;">
                                                            <div class="dataTables_sizing" style="height: 0px; overflow: hidden;">기안일</div>
                                                        </th>
                                                        <th class="sorting" aria-controls="example2" rowspan="1" colspan="1" style="width: 86.875px; padding-top: 0px; padding-bottom: 0px; border-top-width: 0px; border-bottom-width: 0px; height: 0px;">
                                                            <div class="dataTables_sizing" style="height: 0px; overflow: hidden;">상태</div>
                                                        </th>
                                                    </tr>
                                                </thead>
                                                <tfoot>
                                                    <tr style="height: 0px;">
                                                        <th rowspan="1" colspan="1" style="padding-top: 0px; padding-bottom: 0px; border-top-width: 0px; border-bottom-width: 0px; height: 0px; width: 144.229px;">
                                                            <div class="dataTables_sizing" style="height: 0px; overflow: hidden;">문서번호</div>
                                                        </th>
                                                        <th rowspan="1" colspan="1" style="padding-top: 0px; padding-bottom: 0px; border-top-width: 0px; border-bottom-width: 0px; height: 0px; width: 211.708px;">
                                                            <div class="dataTables_sizing" style="height: 0px; overflow: hidden;">제목</div>
                                                        </th>
                                                        <th rowspan="1" colspan="1" style="padding-top: 0px; padding-bottom: 0px; border-top-width: 0px; border-bottom-width: 0px; height: 0px; width: 109.521px;">
                                                            <div class="dataTables_sizing" style="height: 0px; overflow: hidden;">기안자</div>
                                                        </th>
                                                        <th rowspan="1" colspan="1" style="padding-top: 0px; padding-bottom: 0px; border-top-width: 0px; border-bottom-width: 0px; height: 0px; width: 35.875px;">
                                                            <div class="dataTables_sizing" style="height: 0px; overflow: hidden;">기안일</div>
                                                        </th>
                                                        <th rowspan="1" colspan="1" style="padding-top: 0px; padding-bottom: 0px; border-top-width: 0px; border-bottom-width: 0px; height: 0px; width: 93.7917px;">
                                                            <div class="dataTables_sizing" style="height: 0px; overflow: hidden;">기안일</div>
                                                        </th>
                                                        <th rowspan="1" colspan="1" style="padding-top: 0px; padding-bottom: 0px; border-top-width: 0px; border-bottom-width: 0px; height: 0px; width: 86.875px;">
                                                            <div class="dataTables_sizing" style="height: 0px; overflow: hidden;">상태</div>
                                                        </th>
                                                    </tr>
                                                </tfoot>
                                    
                                                <tbody>
                                                    <tr class="odd" role="row">
                                                        <td class="sorting_1">Airi Satou</td>
                                                        <td>Accountant</td>
                                                        <td>Tokyo</td>
                                                        <td>33</td>
                                                        <td>2008/11/28</td>
                                                        <td>$162,700</td>
                                                    </tr>
                                                    <tr class="even" role="row">
                                                        <td class="sorting_1">Angelica Ramos</td>
                                                        <td>Chief Executive 기안자r (CEO)</td>
                                                        <td>London</td>
                                                        <td>47</td>
                                                        <td>2009/10/09</td>
                                                        <td>$1,200,000</td>
                                                    </tr>
                                                    <tr class="odd" role="row">
                                                        <td class="sorting_1">Ashton Cox</td>
                                                        <td>Junior Technical Author</td>
                                                        <td>San Francisco</td>
                                                        <td>66</td>
                                                        <td>2009/01/12</td>
                                                        <td>$86,000</td>
                                                    </tr>
                                                    <tr class="even selected" role="row">
                                                        <td class="sorting_1">Bradley Greer</td>
                                                        <td>Software Engineer</td>
                                                        <td>London</td>
                                                        <td>41</td>
                                                        <td>2012/10/13</td>
                                                        <td>$132,000</td>
                                                    </tr>
                                                    <tr class="odd" role="row">
                                                        <td class="sorting_1">Brenden Wagner</td>
                                                        <td>Software Engineer</td>
                                                        <td>San Francisco</td>
                                                        <td>28</td>
                                                        <td>2011/06/07</td>
                                                        <td>$206,850</td>
                                                    </tr>
                                                    <tr class="even" role="row">
                                                        <td class="sorting_1">Brielle Williamson</td>
                                                        <td>Integration Specialist</td>
                                                        <td>New York</td>
                                                        <td>61</td>
                                                        <td>2012/12/02</td>
                                                        <td>$372,000</td>
                                                    </tr>
                                                    <tr class="odd" role="row">
                                                        <td class="sorting_1">Bruno Nash</td>
                                                        <td>Software Engineer</td>
                                                        <td>London</td>
                                                        <td>38</td>
                                                        <td>2011/05/03</td>
                                                        <td>$163,500</td>
                                                    </tr>
                                                    <tr class="even" role="row">
                                                        <td class="sorting_1">Caesar Vance</td>
                                                        <td>Pre-Sales Support</td>
                                                        <td>New York</td>
                                                        <td>21</td>
                                                        <td>2011/12/12</td>
                                                        <td>$106,450</td>
                                                    </tr>
                                                    <tr class="odd" role="row">
                                                        <td class="sorting_1">Cara Stevens</td>
                                                        <td>Sales Assistant</td>
                                                        <td>New York</td>
                                                        <td>46</td>
                                                        <td>2011/12/06</td>
                                                        <td>$145,600</td>
                                                    </tr>
                                                </tbody>
                                    
                                            </table>
                                        </div>
                                        <div class="dataTables_scrollFoot" style="overflow: hidden; border: 0px; width: 100%;">
                                            <div class="dataTables_scrollFootInner" style="width: 898px; padding-right: 23px;">
                                                <table class="display dataTable" style="width: 898px; margin-left: 0px;" role="grid">
                                                    <tfoot>
                                                        <tr>
                                                            <th rowspan="1" colspan="1" style="width: 144.229px;">문서번호</th>
                                                            <th rowspan="1" colspan="1" style="width: 211.708px;">제목</th>
                                                            <th rowspan="1" colspan="1" style="width: 109.521px;">기안자</th>
                                                            <th rowspan="1" colspan="1" style="width: 35.875px;">기안일</th>
                                                            <th rowspan="1" colspan="1" style="width: 93.7917px;">기안일</th>
                                                            <th rowspan="1" colspan="1" style="width: 86.875px;">상태</th>
                                                        </tr>
                                                    </tfoot>
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="dataTables_info" id="example2_info" role="status" aria-live="polite">Showing 1 to 57 of 57 entries</div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>



        </div>
    
    <c:import url="../temp/messenger.jsp"></c:import>
    </div>

</div>
    <c:import url="../temp/footer.jsp"></c:import> <!-- //footer -->
<c:import url="../temp/js.jsp"></c:import> <!-- // bootstrap-template-js -->
</body>
</html>