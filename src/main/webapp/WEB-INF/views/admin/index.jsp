<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8" />

    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

    <title>管理员统计</title>

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

    <script src="/book/resource/js/echarts.min.js"></script>
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
                    <a href="/book/admin/waitingProcess.action">
                        <i class="ti-view-list-alt"></i>
                        <p>图书管理</p>
                    </a>
                </li>
            </ul>
        </div>
    </div>
</div>


<div class="main-panel">



    <div class="content">
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-3 col-sm-6">
                    <div class="card">
                        <div class="content">
                            <div class="row">
                                <div class="col-xs-5">
                                    <div class="icon-big icon-warning text-center">
                                        <i class="ti-user"></i>
                                    </div>
                                </div>
                                <div class="col-xs-7">
                                    <div class="numbers">
                                        <p>用户数：</p>
                                        6
                                    </div>
                                </div>
                            </div>
                            <div class="footer">
                                <hr />
                                <div class="stats">
                                    <i class="ti-reload"></i>刷新
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-sm-6">
                    <div class="card">
                        <div class="content">
                            <div class="row">
                                <div class="col-xs-5">
                                    <div class="icon-big icon-success text-center">
                                        <i class="ti-book"></i>
                                    </div>
                                </div>
                                <div class="col-xs-7">
                                    <div class="numbers">
                                        <p>藏书数：</p>
                                        1,345
                                    </div>
                                </div>
                            </div>
                            <div class="footer">
                                <hr />
                                <div class="stats">
                                    <i class="ti-calendar"></i> 截止今天
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-sm-6">
                    <div class="card">
                        <div class="content">
                            <div class="row">
                                <div class="col-xs-5">
                                    <div class="icon-big icon-danger text-center">
                                        <i class="ti-announcement"></i>
                                    </div>
                                </div>
                                <div class="col-xs-7">
                                    <div class="numbers">
                                        <p>未解决纠纷</p>
                                        3
                                    </div>
                                </div>
                            </div>
                            <div class="footer">
                                <hr />
                                <div class="stats">
                                    <i class="ti-timer"></i> 刷新
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-sm-6">
                    <div class="card">
                        <div class="content">
                            <div class="row">
                                <div class="col-xs-5">
                                    <div class="icon-big icon-info text-center">
                                        <i class="ti-twitter-alt"></i>
                                    </div>
                                </div>
                                <div class="col-xs-7">
                                    <div class="numbers">
                                        <p>未确认的审核</p>
                                        5
                                    </div>
                                </div>
                            </div>
                            <div class="footer">
                                <hr />
                                <div class="stats">
                                    <i class="ti-reload"></i> 刷新
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">

                <div class="col-md-12">
                    <div class="card">
                        <div class="header">
                            <h4 class="title">网站人数</h4>
                            <p class="category">当前24小时<p>
                        </div>
                        <div class="content" style="padding:0;">
                            <div id="mainHours" class="mainhours" style="width:100%;height:300px;"></div>

                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-6">
                    <div class="card" style="padding-bottom:80px;">
                        <div class="header" >
                            <h4 class="title">图书信息</h4>
                            <p class="category">目前的各类图书的占比</p>
                        </div>
                        <div class="content" style="padding:0;margin:0">
                            <div id="chartPreferences" class="chartPreferences" style="width:100%;height:400px;margin-bottom:30px;"></div>

                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="card ">
                        <div class="header">
                            <h4 class="title">2017 图书与用户的变化</h4>
                            <p class="category">各月藏书与用户的增长变化</p>
                        </div>
                        <div class="content">
                            <div id="chartActivity" class="ct-chart"></div>


                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>


    <footer class="footer">
        <div class="container-fluid">
            书途网-----管理员界面
        </div>
    </footer>

</div>
</div>


</body>

<!--   Core JS Files   -->
<script src="/book/resource/js/jquery-1.10.2.js" type="text/javascript"></script>
<script src="/book/resource/js/bootstrap.min.js" type="text/javascript"></script>

<!--  Checkbox, Radio & Switch Plugins -->
<script src="/book/resource/js/bootstrap-checkbox-radio.js"></script>


<!--  Notifications Plugin    -->
<script src="/book/resource/js/bootstrap-notify.js"></script>



<!-- Paper Dashboard Core javascript and methods for Demo purpose -->
<script src="/book/resource/js/paper-dashboard.js"></script>


<script type="text/javascript">
    // 基于准备好的dom，初始化echarts实例
    var myChart = echarts.init(document.getElementById('mainHours'));

    // 指定图表的配置项和数据
    var option = {
        tooltip : {
            trigger: 'axis'
        },
        legend: {
            data:['浏览人数','使用人数','注册人数'],
            bottom: 'bottom',
        },
        toolbox: {
            show : true,
            feature : {
                mark : {show: true},
                dataView : {show: true, readOnly: false},
                magicType : {show: true, type: ['line', 'bar', 'stack', 'tiled']},
                restore : {show: true},
                saveAsImage : {show: true}
            }
        },
        calculable : true,
        xAxis : [
            {
                type : 'category',
                boundaryGap : false,
                data : ['1:00','4:00','7:00','10:00','13:00','16:00','19:00','21:00']
            }
        ],
        yAxis : [
            {
                type : 'value'
            }
        ],
        series : [
            {
                name:'浏览人数',
                type:'line',
                stack: '总量',
                itemStyle: {normal: {areaStyle: {type: 'default'}}},
                data:[120, 132, 101, 134, 90, 230, 210,80]
            },
            {
                name:'使用人数',
                type:'line',
                stack: '总量',
                itemStyle: {normal: {areaStyle: {type: 'default'}}},
                data:[220, 182, 191, 234, 290, 330, 310,10]
            },
            {
                name:'注册人数',
                type:'line',
                stack: '总量',
                itemStyle: {normal: {areaStyle: {type: 'default'}}},
                data:[150, 232, 201, 154, 190, 330, 410,100]
            },

        ]
    };


    // 使用刚指定的配置项和数据显示图表。
    myChart.setOption(option);
</script>
<script type="text/javascript">
    // 基于准备好的dom，初始化echarts实例
    var myChart = echarts.init(document.getElementById('chartPreferences'));

    // 指定图表的配置项和数据
    var option = {

        tooltip : {
            trigger: 'item',
            formatter: "{a} <br/>{b} : {c} ({d}%)"
        },
        legend: {

            bottom: 'bottom',
            data: ['小说','传记','工具书','军事','名著']
        },
        series : [
            {
                name: '类型占比',
                type: 'pie',
                radius : '55%',
                center: ['50%', '60%'],
                data:[
                    {value:335, name:'小说'},
                    {value:310, name:'传记'},
                    {value:234, name:'工具书'},
                    {value:135, name:'军事'},
                    {value:1548, name:'名著'}
                ],
                itemStyle: {
                    emphasis: {
                        shadowBlur: 10,
                        shadowOffsetX: 0,
                        shadowColor: 'rgba(0, 0, 0, 0.5)'
                    }
                }
            }
        ]
    };



    // 使用刚指定的配置项和数据显示图表。
    myChart.setOption(option);
</script>
<script type="text/javascript">
    // 基于准备好的dom，初始化echarts实例
    var myChart = echarts.init(document.getElementById('chartActivity'));

    // 指定图表的配置项和数据
    var option = {

        tooltip: {
            trigger: 'axis'
        },
        legend: {
            data:['用户','图书'],
            bottom: 'bottom',
        },

        xAxis:  {
            type: 'category',
            boundaryGap: false,
            data: ['一月','二月','三月','四月','五月','六月','七月','八月','九月','十月','十一月','十二月',]
        },
        yAxis: {
            type: 'value',

        },
        series: [
            {
                name:'用户',
                type:'line',
                data:[11, 11, 15, 13, 12, 13, 10,9,20,11,12,12],
            },

            {
                name:'图书',
                type:'line',
                data:[9,20,11,12,12,12, 12, 21, 25, 23, 22, 20],

            }
        ]
    };




    // 使用刚指定的配置项和数据显示图表。
    myChart.setOption(option);
</script>
<script type="text/javascript">
    $(document).ready(function(){

        demo.initChartist();

        $.notify({
            icon: 'ti-gift',
            message: "Welcome to <b>Paper Dashboard</b> - a beautiful Bootstrap freebie for your next project."

        },{
            type: 'success',
            timer: 4000
        });

    });
</script>

</html>
