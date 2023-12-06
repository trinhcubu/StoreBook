<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix ="fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <meta http-equiv="X-UA-Compatible" content="ie=edge" />
        <title>Product Page - Admin HTML Template</title>

        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:400,700" />         
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0" />
        <script src="https://kit.fontawesome.com/ac89cb7114.js" crossorigin="anonymous"></script>

        <style>
            .material-symbols-outlined {
                font-variation-settings:
                    'FILL' 0,
                    'wght' 400,
                    'GRAD' 0,
                    'opsz' 24
            }
        </style>

        <link rel="stylesheet" href="${pageContext.request.contextPath}/component/css/fontawesome.min.css" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/component/css/bootstrap.min.css" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/component/css/templatemo-style.css">

        <!--
            Product Admin CSS Template
            https://templatemo.com/tm-524-product-admin
        -->
    </head>

    <body id="reportsPage">
        <div class="" id="home">
            <nav class="navbar navbar-expand-xl">
                <div class="container h-100">
                    <a class="navbar-brand" href="index.html">
                        <h1 class="tm-site-title mb-0">Product Admin</h1>
                    </a>
                    <button class="navbar-toggler ml-auto mr-0" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
                            aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                        <i class="fas fa-bars tm-nav-icon"></i>
                    </button>

                    <div class="collapse navbar-collapse" id="navbarSupportedContent">
                        <ul class="navbar-nav mx-auto h-100">
                            <li class="nav-item">
                                <a class="nav-link active" href="${pageContext.request.contextPath}/adminhome">
                                    <i class="fas fa-tachometer-alt"></i>
                                    Dashboard
                                    <span class="sr-only">(current)</span>
                                </a>
                            </li>

                            <li class="nav-item">
                                <a class="nav-link" href="${pageContext.request.contextPath}/productController">
                                    <i class="fas fa-shopping-cart"></i>
                                    Products
                                </a>
                            </li>

                            <li class="nav-item">
                                <a class="nav-link" href="accounts.html">
                                    <i class="far fa-user"></i>
                                    Accounts
                                </a>
                            </li>
                            <ul class="navbar-nav">
                                <li class="nav-item">
                                    <a class="nav-link d-block" href="${pageContext.request.contextPath}/logout">
                                        Admin, <b>Logout</b>
                                    </a>
                                </li>
                            </ul>
                    </div>
                </div>

            </nav>
            <div class="container">
                <div class="row">
                    <div class="col">
                        <p class="text-white mt-5 mb-5">Welcome back, <b>Admin</b></p>
                    </div>
                </div>
                <!-- row -->
                <div class="row tm-content-row">
                    <div class="col-sm-12 col-md-12 col-lg-6 col-xl-6 tm-block-col">
                        <div class="tm-bg-primary-dark tm-block">
                            <h2 class="tm-block-title">Latest Hits</h2>
                            <canvas id="lineChart"></canvas>
                        </div>
                    </div>
                    <div class="col-sm-12 col-md-12 col-lg-6 col-xl-6 tm-block-col">
                        <div class="tm-bg-primary-dark tm-block">
                            <h2 class="tm-block-title">Performance</h2>
                            <canvas id="barChart"></canvas>
                        </div>
                    </div>
                    <div class="col-sm-12 col-md-12 col-lg-6 col-xl-6 tm-block-col">
                        <div class="tm-bg-primary-dark tm-block tm-block-taller">
                            <h2 class="tm-block-title">Storage Information</h2>
                            <div id="pieChartContainer">
                                <canvas id="pieChart" class="chartjs-render-monitor" width="200" height="200"></canvas>
                            </div>                        
                        </div>
                    </div>
                    <div class="col-sm-12 col-md-12 col-lg-6 col-xl-6 tm-block-col">
                        <div class="tm-bg-primary-dark tm-block tm-block-taller tm-block-overflow">
                            <h2 class="tm-block-title">Notification List</h2>
                            <div class="tm-notification-items">
                                <div class="media tm-notification-item">
                                    <div class="tm-gray-circle"><img src="img/notification-01.jpg" alt="Avatar Image" class="rounded-circle"></div>
                                    <div class="media-body">
                                        <p class="mb-2"><b>Jessica</b> and <b>6 others</b> sent you new <a href="#"
                                                                                                           class="tm-notification-link">product updates</a>. Check new orders.</p>
                                        <span class="tm-small tm-text-color-secondary">6h ago.</span>
                                    </div>
                                </div>
                                <div class="media tm-notification-item">
                                    <div class="tm-gray-circle"><img src="img/notification-02.jpg" alt="Avatar Image" class="rounded-circle"></div>
                                    <div class="media-body">
                                        <p class="mb-2"><b>Oliver Too</b> and <b>6 others</b> sent you existing <a href="#"
                                                                                                                   class="tm-notification-link">product updates</a>. Read more reports.</p>
                                        <span class="tm-small tm-text-color-secondary">6h ago.</span>
                                    </div>
                                </div>
                                <div class="media tm-notification-item">
                                    <div class="tm-gray-circle"><img src="img/notification-03.jpg" alt="Avatar Image" class="rounded-circle"></div>
                                    <div class="media-body">
                                        <p class="mb-2"><b>Victoria</b> and <b>6 others</b> sent you <a href="#"
                                                                                                        class="tm-notification-link">order updates</a>. Read order information.</p>
                                        <span class="tm-small tm-text-color-secondary">6h ago.</span>
                                    </div>
                                </div>
                                <div class="media tm-notification-item">
                                    <div class="tm-gray-circle"><img src="img/notification-01.jpg" alt="Avatar Image" class="rounded-circle"></div>
                                    <div class="media-body">
                                        <p class="mb-2"><b>Laura Cute</b> and <b>6 others</b> sent you <a href="#"
                                                                                                          class="tm-notification-link">product records</a>.</p>
                                        <span class="tm-small tm-text-color-secondary">6h ago.</span>
                                    </div>
                                </div>
                                <div class="media tm-notification-item">
                                    <div class="tm-gray-circle"><img src="img/notification-02.jpg" alt="Avatar Image" class="rounded-circle"></div>
                                    <div class="media-body">
                                        <p class="mb-2"><b>Samantha</b> and <b>6 others</b> sent you <a href="#"
                                                                                                        class="tm-notification-link">order stuffs</a>.</p>
                                        <span class="tm-small tm-text-color-secondary">6h ago.</span>
                                    </div>
                                </div>
                                <div class="media tm-notification-item">
                                    <div class="tm-gray-circle"><img src="img/notification-03.jpg" alt="Avatar Image" class="rounded-circle"></div>
                                    <div class="media-body">
                                        <p class="mb-2"><b>Sophie</b> and <b>6 others</b> sent you <a href="#"
                                                                                                      class="tm-notification-link">product updates</a>.</p>
                                        <span class="tm-small tm-text-color-secondary">6h ago.</span>
                                    </div>
                                </div>
                                <div class="media tm-notification-item">
                                    <div class="tm-gray-circle"><img src="img/notification-01.jpg" alt="Avatar Image" class="rounded-circle"></div>
                                    <div class="media-body">
                                        <p class="mb-2"><b>Lily A</b> and <b>6 others</b> sent you <a href="#"
                                                                                                      class="tm-notification-link">product updates</a>.</p>
                                        <span class="tm-small tm-text-color-secondary">6h ago.</span>
                                    </div>
                                </div>
                                <div class="media tm-notification-item">
                                    <div class="tm-gray-circle"><img src="img/notification-02.jpg" alt="Avatar Image" class="rounded-circle"></div>
                                    <div class="media-body">
                                        <p class="mb-2"><b>Amara</b> and <b>6 others</b> sent you <a href="#"
                                                                                                     class="tm-notification-link">product updates</a>.</p>
                                        <span class="tm-small tm-text-color-secondary">6h ago.</span>
                                    </div>
                                </div>
                                <div class="media tm-notification-item">
                                    <div class="tm-gray-circle"><img src="img/notification-03.jpg" alt="Avatar Image" class="rounded-circle"></div>
                                    <div class="media-body">
                                        <p class="mb-2"><b>Cinthela</b> and <b>6 others</b> sent you <a href="#"
                                                                                                        class="tm-notification-link">product updates</a>.</p>
                                        <span class="tm-small tm-text-color-secondary">6h ago.</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-12 tm-block-col">
                        <div class="tm-bg-primary-dark tm-block tm-block-taller tm-block-scroll">
                            <h2 class="tm-block-title">Orders List</h2>
                            <table class="table table-hover tm-table-small tm-product-table">
                                <thead>
                                    <tr>
                                        <th scope="col">CUSTOMER NAME</th>
                                        <th scope="col">PHONE NUMBER</th>
                                        <th scope="col">ADRESS</th>
                                        <th scope="col">CUSTOMER EMAIL</th>
                         
                                        <th scope="col">&nbsp;</th>
                                        <th scope="col">&nbsp;</th>

                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="bill" items="${bills}">
                                        <tr <c:if test="${bill.getStatus() eq 1}">class="inactive-row"</c:if>>
                                            <td>${bill.customer.getCustomer_name()}</td>
                                            <td class="tm-product-name">${bill.customer.getPhone_number()}</td>
                                            <td>${bill.customer.getAddress()}</td>
                                            <td>${bill.customer.getCustomer_email()}</td>
                                            <td>
                                                <a href="${pageContext.request.contextPath}/editBook?bid=${book.book_id}" class="tm-product-edit-link">
                                                    <button type="button" class="btn btn-info">Accept</button>
                                                </a>
                                            </td>
                                            <td>
                                                <a href="${pageContext.request.contextPath}/viewBill?bid=${book.book_id}" class="tm-product-edit-link">
                                                    <button type="button" class="btn btn-info">View</button>
                                                </a>
                                            </td>

                                        </tr>
                                    </c:forEach>




                                    <!-- Thêm các dòng dữ liệu khác tương tự cho các sản phẩm khác -->
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>


        <script src="${pageContext.request.contextPath}/component/js/jquery-3.3.1.min.js"></script>
        <script src="${pageContext.request.contextPath}/component/js/Chart.min.js"></script>
        <script src="${pageContext.request.contextPath}/component/js/bootstrap.min.js"></script>
        <script src="${pageContext.request.contextPath}/component/js/moment.min.js"></script>
        <script src="${pageContext.request.contextPath}/component/js/tooplate-script.min.js"></script>

        <style>
            .inactive-row {
                background-color: #7F7F7F; /* Gray color for inactive rows */
            }
        </style>
    </body>
</html>