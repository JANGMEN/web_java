<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset='utf-8'>
    <meta http-equiv='X-UA-Compatible' content='IE=edge'>
    <meta name="author" content="JANGMEN">
    <meta name="description" content="웹솔루션 관리자 화면으로 가장 많이 사용되는 웹 템플릿입니다">
    <title>SB Admin web</title>
    <meta name='viewport' content='width=device-width, initial-scale=1'>
    <!-- Bootstrap용 css CDN -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-aFq/bzH65dt+w6FI2ooMVUpc+21e0SRygnTpmBvdBgSdnuTN7QbdgL+OapgHtvPp" crossorigin="anonymous">
    <!-- Font Awesome 아이콘 CDN -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
        integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
    <!-- Simple-DataTables용 CDN -->
    <link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" type="text/css">
    <link rel='stylesheet' href="${pageContext.request.contextPath}/resources/css/main.css">
    <!-- jQuery 추가 -->
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"
        integrity="sha256-oP6HI9z1XaZNBrJURtCoUT5SUnxFr8s3BzRl+cbzUq8=" crossorigin="anonymous"></script>
    <!-- font awesome용 스크립트 CDN-->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/js/all.min.js"
        integrity="sha512-fD9DI5bZwQxOi7MhYWnnNPlvXdp/2Pj3XSTRrFs5FQa4mizyGLnJcN6tuvUS6LbmgN1ut+XGSABKvjN0H6Aoow=="
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <link rel='icon' href="${pageContext.request.contextPath}/resources/images/ui.ico">
    <script>
        $(document).ready(function () {
            const sidebarToggle = $('#sidebarToggle');
            if(sidebarToggle) {
                sidebarToggle.click(function () {
                    console.log('숨기기');
                    event.preventDefault(); /* 아래쪽 요소로 이벤트가 전파 되지않도록 함 */
                    document.body.classList.toggle('sb-sidenav-toggled');
                    localStorage.setItem('sb|sidebar-toggle', document.body.classList.contains('sb-sidenav-toggled'));
                });
            }
        });
    </script>
</head>

<body class="sb-nav-fixed">
    <!-- 내비게이션 영역 -->
    <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
        <!-- Navbar Brand -->
        <a class="navbar-brand ps-3" href="./index.html">
            <!-- <i class="bi bi-tools"></i> -->
            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-tools" viewBox="0 0 16 16">
                <path d="M1 0 0 1l2.2 3.081a1 1 0 0 0 .815.419h.07a1 1 0 0 1 .708.293l2.675 2.675-2.617 2.654A3.003 3.003 0 0 0 0 13a3 3 0 1 0 5.878-.851l2.654-2.617.968.968-.305.914a1 1 0 0 0 .242 1.023l3.27 3.27a.997.997 0 0 0 1.414 0l1.586-1.586a.997.997 0 0 0 0-1.414l-3.27-3.27a1 1 0 0 0-1.023-.242L10.5 9.5l-.96-.96 2.68-2.643A3.005 3.005 0 0 0 16 3c0-.269-.035-.53-.102-.777l-2.14 2.141L12 4l-.364-1.757L13.777.102a3 3 0 0 0-3.675 3.68L7.462 6.46 4.793 3.793a1 1 0 0 1-.293-.707v-.071a1 1 0 0 0-.419-.814L1 0Zm9.646 10.646a.5.5 0 0 1 .708 0l2.914 2.915a.5.5 0 0 1-.707.707l-2.915-2.914a.5.5 0 0 1 0-.708ZM3 11l.471.242.529.026.287.445.445.287.026.529L5 13l-.242.471-.026.529-.445.287-.287.445-.529.026L3 15l-.471-.242L2 14.732l-.287-.445L1.268 14l-.026-.529L1 13l.242-.471.026-.529.445-.287.287-.445.529-.026L3 11Z"/>
            </svg>
            <strong>관리자 화면</strong>
        </a>
        <!-- Sidebar Toggle -->
        <button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0" id="sidebarToggle" type="button">
            <i class="fas fa-bars"></i>
        </button>
        <!-- Searchbar -->
        <form class="d-none d-md-inline-block form-inline ms-auto me-0 me-md-3 my-2 my-md-0">
            <div class="input-group">
                <input class="form-control" type="text" placeholder="검색어 입력" aria-label="검색어 입력" aria-describedby="btnSearch">
                <button class="btn btn-primary" id="btnSearch" type="submit">
                    <i class="bi bi-search"></i>
                </button>
            </div>
        </form>
        <!-- Profile -->
        <ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4">
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" id="profile" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                    <i class="bi bi-person-lines-fill"></i>
                </a>
                <ul class="dropdown-menu-end dropdown-menu shadow" aria-labelledby="profile">
                    <li><a class="dropdown-item" href="#!">설정</a></li>
                    <li><a class="dropdown-item" href="#!">로그</a></li>
                    <li><hr class="dropdown-divider"></li>
                    <li><a class="dropdown-item" href="#!">로그아웃</a></li>

                </ul>
            </li>
        </ul>
    </nav>

    <!-- 전체화면 영역 -->
    <div id="layoutTotal">
        <!-- 전체화면 > 왼쪽 메뉴 영역 -->
        <div id="layoutLeftSide">
            <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion"> <!-- sb로 된 것은 나중에 css에서 -->
                <div class="sb-sidenav-menu">
                    <div class="nav">
                        <div class="sb-sidenav-menu-heading">메인</div>
                        <a class="nav-link" href="/web03/sbadmin.do">
                            <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>
                            대시보드
                        </a>
                        <div class="sb-sidenav-menu-heading">인터페이스</div>
                        <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseLayouts" aria-expanded="false" aria-controls="collapseLayouts">
                            <div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div>
                            레이아웃
                            <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                        </a>
                        <div class="collapse" id="collapseLayouts" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                            <nav class="sb-sidenav-menu-nested nav">
                                <a class="nav-link" href="navigation.do">정적 내비게이션</a>
                                <a class="nav-link" href="">라이트 테마</a>
                            </nav>
                        </div>
                        <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapsePages" aria-expanded="false" aria-controls="collapsePages">
                            <div class="sb-nav-link-icon"><i class="fas fa-book-open"></i></div>
                            페이지
                            <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                        </a>
                        <div class="collapse" id="collapsePages" aria-labelledby="headingTwo" data-bs-parent="#sidenavAccordion">
                            <nav class="sb-sidenav-menu-nested nav">
                                <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#pageCollapseAuth" aria-expanded="false" aria-controls="pageCollapseAuth">
                                    계정
                                    <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                                </a>
                                <div class="collapse" id="pageCollapseAuth" aria-labelledby="headingThree" data-bs-parent="#sidenavAccordionPages">
                                    <nav class="sb-sidenav-menu-nested nav">
                                        <a class="nav-link" href="">로그인</a>
                                        <a class="nav-link" href="">회원 등록</a>
                                        <a class="nav-link" href="">비밀번호 초기화</a>
                                    </nav>
                                </div>
                                <a class="nav-link" href="#" data-bs-toggle="collapse" data-bs-target="#pageCollapseError" aria-expanded="false" aria-controls="pageCollapseError">
                                    에러
                                    <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                                </a>
                                <div class="collapse" id="pageCollapseError" aria-labelledby="headingThree" data-bs-parent="#sidenavAccordionPages">
                                    <nav class="sb-sidenav-menu-nested nav">
                                        <a class="nav-link" href="error401.do">401 페이지</a>
                                        <a class="nav-link" href="error404.do">404 페이지</a>
                                        <a class="nav-link" href="error500.do">500 페이지</a>
                                    </nav>
                                </div>
                            </nav>
                            <!-- <nav class="sb-sidenav-menu-nested nav accordion" id="sidenavAccordionPages">
                                <a>계정</a>
                                <div>
                                    <nav>
                                        <a>로그인</a>
                                        <a>회원가입</a>
                                        <a>비밀번호 초기화</a>
                                    </nav>
                                </div>
                                <a>에러</a>
                                <div>
                                    <nav>
                                        <a>401 페이지</a>
                                        <a>404 페이지</a>
                                        <a>500 페이지</a>
                                    </nav>
                                </div>
                            </nav>
                        </div>
                        <div>애드온</div>
                        <a>
                            <div></div>
                            차트
                        </a>
                        <a>
                            <div></div>
                            테이블
                        </a> -->
                    </div>
                    <div class="sb-sidenav-menu-heading">애드온</div>
                    <a class="nav-link" href="/web03/charts.do">
                        <div class="sb-nav-link-icon"><i class="fas fa-chart-area"></i></div>
                        차트
                    </a>
                    <a class="nav-link" href="table.do">
                        <div class="sb-nav-link-icon"><i class="fas fa-table"></i></div>
                        테이블
                    </a>
                </div>
                <div class="sb-sidenav-footer">
                    <div class="small">로그인 중 :</div>
                    JANGMEN
                </div>
            </nav>
        </div>
        <!-- 전체화면 > 오른쪽 메인화면 영역 -->
        <div id="layoutContent">
            <main>
                <div class="container-fluid px-4">
                    <h1 class="mt-4">차트</h1>
                    <ol class="breadcrumb mb-4">
                        <li class="breadcrumb-item"><a href="/web03/sbadmin.do">대시보드</a></li>
                        <li class="breadcrumb-item active">차트</li>
                    </ol>
                    <!-- 차트 영역 -->
                    <div class="row">
                        <div class="col">
                            <div class="card mb-4">
                                <div class="card-header">
                                    <i class="fas fa-chart-pie me-1"></i>
                                    파이차트 예제
                                </div>
                                <div class="card-body">
                                    <canvas id="myPieChart" width="100%" height="50"></canvas>
                                </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-6">
                            <div class="card mb-4">
                                <div class="card-header">
                                    <i class="fas fa-chart-area me-1"></i>
                                    라인차트 예제
                                </div>
                                <div class="card-body">
                                    <canvas id="myAreaChart" width="100%" height="50"></canvas>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="card mb-4">
                                <div class="card-header">
                                    <i class="fas fa-chart-area me-1"></i>
                                    바차트 예제
                                </div>
                                <div class="card-body">
                                    <canvas id="myBarChart" width="100%" height="50"></canvas>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </main>
            <footer class="py-4 bg-light mt-auto">
                <div class="container-fluid py-4">
                    <div class="d-flex justify-content-between align-items-center small">
                        <div class="text-muted me-2">Copyright &copy; PKNU 2023.</div>
                        <div>
                            <a href="#">Privacy Policy</a> &middot; <a href="#">Terms &amp; Conditions</a>
                        </div>
                    </div>
                </div>
            </footer>
        </div>

    </div>

   
     <!-- 2. Bootstrap용 js는 body에 위치해야 함! -->
     <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/js/bootstrap.bundle.min.js"
     integrity="sha384-qKXV1j0HvMUeCBQ+QVp7JcfGl760yU08IQ+GpUo5hlbpg51QRiuqHAJz8+BrxE/N"
     crossorigin="anonymous"></script>
     <!-- Chart.js용 CDN 구버전에서 신버전으로 컨버전 작업 필요-->
     <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
     <script src="${pageContext.request.contextPath}/resources/js/chart-area-demo.js"></script> <!-- 반드시 여기 들어가야함 -->
     <script src="${pageContext.request.contextPath}/resources/js/chart-bar-demo.js"></script>
     <script src="${pageContext.request.contextPath}/resources/js/chart-pie-demo.js"></script>
     <!-- Simple-DataTable용 js CDN -->
     <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" type="text/javascript"></script>
     <script>
        $(document).ready(function (){
            new simpleDatatables.DataTable("#datatablesSimple",{
                searchable : true,
                fixedHeight: true,
            });
        });
    </script>
</body>

</html>