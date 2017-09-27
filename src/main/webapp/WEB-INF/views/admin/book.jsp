<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="en">

<head>
    <meta charset="utf-8" />
    <link rel="apple-touch-icon" sizes="76x76" href="assets/img/apple-icon.png">
    <link rel="icon" type="image/png" sizes="96x96" href="assets/img/favicon.png">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

    <title>管理员</title>

    <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport' />
    <meta name="viewport" content="width=device-width" />

    <!-- Bootstrap core CSS     -->
    <link href="/book/resource/css/admin/bootstrap.min.css" rel="stylesheet" />

    <!-- Animation library for notifications   -->
    <link href="/book/resource/css/admin/animate.min.css" rel="stylesheet" />

    <link href="/book/resource/css/admin/paper-dashboard.css" rel="stylesheet" />


    <!--  Fonts and icons     -->
    <link href="http://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" rel="stylesheet">

    <link href="/book/resource/css/admin/themify-icons.css" rel="stylesheet">

</head>

<body>

<div class="wrapper">
    <div class="sidebar" data-background-color="white" data-active-color="danger">



        <div class="sidebar-wrapper">
            <div class="logo">
                <a href="#" class="simple-text">
                    你好，管理员
                </a>
            </div>

            <ul class="nav">
                <li>
                    <a href="/book/admin/index.action">
                        <i class="ti-bar-chart-alt"></i>
                        <p>网站数据</p>
                    </a>
                </li>

                <li class="active">
                    <a href="/book/admin/adminBook.action">
                        <i class="ti-view-list-alt"></i>
                        <p>图书管理</p>
                    </a>
                </li>
            </ul>
        </div>
    </div>

    <div class="main-panel">
        <div class="content">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-12">
                        <div class="card">
                            <div class="header">
                                <h4 class="title">添加图书申请</h4>
                                <p class="category">验证图书后，点击“通过”完成确认</p>
                            </div>
                            <div class="content table-responsive table-full-width">
                                <table class="table table-striped">
                                    <thead>
                                        <th>ID</th>
                                        <th class="td2" style="width:80px;">书名</th>
                                        <th style="width:80px;">作者</th>
                                        <th>简介</th>
                                        <th>操作</th>
                                    </thead>
                                    <tbody>
                                        <c:forEach items="${unVerifyBooks}" var="unverifyBook" varStatus="count">
                                            <tr>
                                                <td>${count.index + 1 }</td>
                                                <td>${unverifyBook.name }</td>
                                                <td>${unverifyBook.author }</td>
                                                <td>${unverifyBook.intro }</td>
                                                <td><button class="subsq" style="border:0;border-radius: 4px;padding:3px 10px;background: #05AE0E;color:#FFFFFF;width:80px;min-height:20px;margin-bottom: 3px;">通过</button>
                                                    <button class="subsq" style="border:0;border-radius: 4px;padding:3px 10px;background: #05AE0E;color:#FFFFFF;width:80px;min-height:20px;">拒绝</button>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>

                            </div>
                        </div>
                    </div>

                    <div class="col-md-12">
                        <div class="card card-plain">
                            <div class="header">
                                <h4 class="title">申请管理员介入</h4>
                                <p class="category">图书纠纷的用户申请介入</p>
                            </div>
                            <div class="content table-responsive table-full-width">
                                <table class="table table-hover">
                                    <thead>
                                    <th>ID</th>
                                    <th style="width:80px;">申请人</th>
                                    <th style="width:80px;">时间</th>
                                    <th>原因</th>
                                    <th>操作</th>
                                    </thead>
                                    <tbody>
                                    <tr>
                                        <td>1</td>
                                        <td>椿</td>
                                        <td>2017-08-29</td>
                                        <td>图书损坏严重，借阅拒绝赔偿</td>
                                        <td>
                                            <button class="subsq" style="border:0;border-radius: 4px;padding:3px 10px;background: #05AE0E;color:#FFFFFF;width:100px;min-height:20px;">联系申请人</button>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>2</td>
                                        <td>椿</td>
                                        <td>2017-08-29</td>
                                        <td>图书损坏严重，借阅拒绝赔偿。到期不换，无赖，臭流氓，借阅拒绝赔偿。，借阅拒绝赔偿。，借阅拒绝赔偿。，借阅拒绝赔偿。，借阅拒绝赔偿。，借阅拒绝赔偿。，借阅拒绝赔偿。，借阅拒绝赔偿。，借阅拒绝赔偿。</td>
                                        <td>
                                            <button class="subsq" style="border:0;border-radius: 4px;padding:3px 10px;background: #05AE0E;color:#FFFFFF;width:100px;min-height:20px;">联系申请人</button>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>3</td>
                                        <td>椿</td>
                                        <td>2017-08-29</td>
                                        <td>图书损坏严重，借阅拒绝赔偿。到期不换，无赖，臭流氓，借阅拒绝赔偿。，借阅拒绝赔偿。，借阅拒绝赔偿。，借阅拒绝赔偿。，借阅拒绝赔偿。，借阅拒绝赔偿。，借阅拒绝赔偿。，借阅拒绝赔偿。，借阅拒绝赔偿。</td>
                                        <td>
                                            <button class="subsq" style="border:0;border-radius: 4px;padding:3px 10px;background: #05AE0E;color:#FFFFFF;width:100px;min-height:20px;">联系申请人</button>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>4</td>
                                        <td>椿</td>
                                        <td>2017-08-29</td>
                                        <td>图书损坏严重，借阅拒绝赔偿。到期不换，无赖，臭流氓，借阅拒绝赔偿。，借阅拒绝赔偿。，借阅拒绝赔偿。，借阅拒绝赔偿。，借阅拒绝赔偿。，借阅拒绝赔偿。，借阅拒绝赔偿。，借阅拒绝赔偿。，借阅拒绝赔偿。</td>
                                        <td>
                                            <button class="subsq" style="border:0;border-radius: 4px;padding:3px 10px;background: #05AE0E;color:#FFFFFF;width:100px;min-height:20px;">联系申请人</button>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>5</td>
                                        <td>椿</td>
                                        <td>2017-08-29</td>
                                        <td>图书损坏严重，借阅拒绝赔偿。到期不换，无赖，臭流氓，借阅拒绝赔偿。，借阅拒绝赔偿。，借阅拒绝赔偿。，借阅拒绝赔偿。，借阅拒绝赔偿。，借阅拒绝赔偿。，借阅拒绝赔偿。，借阅拒绝赔偿。，借阅拒绝赔偿。</td>
                                        <td>
                                            <button class="subsq" style="border:0;border-radius: 4px;padding:3px 10px;background: #05AE0E;color:#FFFFFF;width:100px;min-height:20px;">联系申请人</button>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>6</td>
                                        <td>椿</td>
                                        <td>2017-08-29</td>
                                        <td>图书损坏严重，借阅拒绝赔偿。到期不换，无赖，臭流氓，借阅拒绝赔偿。，借阅拒绝赔偿。，借阅拒绝赔偿。，借阅拒绝赔偿。，借阅拒绝赔偿。，借阅拒绝赔偿。，借阅拒绝赔偿。，借阅拒绝赔偿。，借阅拒绝赔偿。</td>
                                        <td>
                                            <button class="subsq" style="border:0;border-radius: 4px;padding:3px 10px;background: #05AE0E;color:#FFFFFF;width:100px;min-height:20px;">联系申请人</button>
                                        </td>
                                    </tr>
                                    </tbody>
                                </table>

                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>

        <footer class="footer">
            <div class="container-fluid">

                <div class="copyright pull-right">
                    书途网-----管理员界面
                </div>
            </div>
        </footer>

    </div>
</div>

</body>


</html>
