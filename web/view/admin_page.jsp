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

    </head>

    <body id="reportsPage">
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
                            <a class="nav-link" href="${pageContext.request.contextPath}/adminhome">
                                <i class="fas fa-tachometer-alt"></i>
                                Dashboard
                                <span class="sr-only">(current)</span>
                            </a>
                        </li>

                        <li class="nav-item">
                            <a class="nav-link active" href="${pageContext.request.contextPath}/productController">
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
                    </ul>
                    <ul class="navbar-nav">
                        <li class="nav-item">
                            <a class="nav-link d-block" href="login.html">
                                Admin, <b>Logout</b>
                            </a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
        <div class="container-fluid">
            <div class="row tm-content-row">
                <div class="col">
                    <div class="tm-bg-primary-light tm-block tm-block-products">
                        <div class="tm-product-table-container">
                            <table class="table table-hover tm-table-small tm-product-table">
                                <thead>
                                    <tr>
                                        <th scope="col">STT</th>
                                        <th scope="col">NAME</th>
                                        <th scope="col">PRICE</th>
                                        <th scope="col">QUANTITY</th>
                                        <th scope="col">LANGUAGES</th>
                                        <th scope="col">VERSION</th>
                                        <th scope="col">STATUS</th>
                                        <th scope="col">TAGS</th>
                                        <th scope="col">PUBLISHER</th>
                                        <th scope="col">AUTHOR</th>
                                        <th scope="col">DESCRIPTION</th>
                                        <th scope="col">&nbsp;</th>
                                        <th scope="col">&nbsp;</th>

                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="book" items="${books}">
                                        <tr <c:if test="${book.status eq 0}">class="inactive-row"</c:if>>
                                            <td>${book.book_id }</td>
                                            <td class="tm-product-name">${book.book_name}</td>
                                            <td>${book.price}$</td>
                                            <td>${book.quantity}</td>
                                            <td>${book.languages}</td>
                                            <td>${book.version}</td>
                                            <td>${book.status}</td>
                                            <td>
                                                <c:forEach var="category" items="${book.listCategory}" varStatus="status">
                                                    ${category.category_name}<c:if test="${!status.last}">,</c:if>
                                                </c:forEach>
                                            </td>
                                            <td>${book.publisher.publisher_name}</td>
                                            <td>${book.author.author_name}</td>
                                            <td>${book.descriptions}</td>
                                            <td>
                                                <a href="${pageContext.request.contextPath}/editBook?bid=${book.book_id}" class="tm-product-edit-link">
                                                    <button type="button" class="btn btn-info">edit</button>
                                                </a>
                                            </td>
                                            <td>
                                                <a href="${pageContext.request.contextPath}/removeBook?bid=${book.book_id}" class="tm-product-delete-link" id="delete">
                                                    <i class="fa-regular fa-trash-can"></i>
                                                </a>
                                            </td>
                                        </tr>
                                    </c:forEach>

                                    <!-- Thêm các dòng dữ liệu khác tương tự cho các sản phẩm khác -->
                                </tbody>
                            </table>
                        </div>
                        <!-- table container -->
                        <a href="${pageContext.request.contextPath}/addBook" class="btn btn-primary btn-block text-uppercase mb-3">
                            Add new Product
                        </a>

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