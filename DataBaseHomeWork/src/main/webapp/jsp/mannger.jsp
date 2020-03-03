<%--
  Created by IntelliJ IDEA.
  User: 97347
  Date: 2019/5/6
  Time: 10:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>图书管理系统</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../resources/css/font.css">
    <link rel="stylesheet" href="../resources/css/xadmin.css">
    <link rel="stylesheet" href="../resources/css/swiper.min.css">
    <script type="text/javascript" src="../resources/js/jquery.min.js"></script>
    <script type="text/javascript" src="../resources/js/jquery-2.0.0.min.js"></script>
    <script type="text/javascript" src="../resources/js/swiper.jquery.min.js"></script>
    <script src="../resources/lib/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="../resources/js/xadmin.js"></script>
    <script>
        var userid = sessionStorage.getItem("userid");
        if(userid == null){
            layui.use('layer', function(){
                var layer = layui.layer;
                layer.msg('请登陆~', {
                    async : false ,
                    time: 10000, //10s后自动关闭
                    btn: ['知道了'],
                    btn1: function(){
                        out();
                    }
                });
            });
        }
        var userpower = sessionStorage.getItem("userpower")
        if(userpower == 1){
            layui.use('layer', function(){
                var layer = layui.layer;
                layer.msg('您无此权限~', {
                    async : false ,
                    time: 10000, //10s后自动关闭
                    btn: ['知道了'],
                    btn1: function(){
                        outI();
                    }
                });
            });
        }
        function out(){
            window.location.href = './login.jsp';
        }
        function outI(){
            window.location.href = './index.jsp';
        }
    </script>
</head>
<body>
<!-- 顶部开始 -->
<div class="container">
    <div class="logo">Sunny图书管理系统</div>
    <div class="open-nav"><i class="iconfont">&#xe699;</i></div>
    <ul class="layui-nav right" lay-filter="">
        <li class="layui-nav-item">
            <a href="javascript:;" id="uname">admin</a>
        </li>
        <li class="layui-nav-item">Have A Nice Day</li>
    </ul>
</div>
<!-- 顶部结束 -->
<!-- 中部开始 -->
<div class="wrapper">
    <!-- 左侧菜单开始 -->
    <div class="left-nav">
        <div id="side-nav" id="menu">
            <ul id="nav"></ul>
        </div>
    </div>
    <!-- 左侧菜单结束 -->
    <!-- 右侧主体开始 -->
    <div class="page-content">
        <div class="content">
            <!-- 右侧内容框架，更改从这里开始 -->

            <fieldset class="layui-elem-field layui-field-title site-title">
                <legend><a name="default">图书借阅申请</a></legend>
            </fieldset>
            <table class="layui-table">
                <thead>
                <tr>
                    <th>书籍编号</th>
                    <th>书籍名称</th>
                    <th>用户编号</th>
                    <th>用户姓名</th>
                    <th>申请时间</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody id="borrowList"></tbody>
            </table>

            <fieldset class="layui-elem-field layui-field-title site-title">
                <legend><a name="default">图书归还申请</a></legend>
            </fieldset>
            <table class="layui-table">
                <thead>
                <tr>
                    <th>书籍编号</th>
                    <th>书籍名称</th>
                    <th>用户编号</th>
                    <th>用户姓名</th>
                    <th>申请时间</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody id="returnList"></tbody>
            </table>
        </div>
    </div>
    <!-- 右侧主体结束 -->
</div>
<!-- 中部结束 -->
<!-- 底部开始 -->
<div class="footer">
    <div class="copyright">
        永远相信,
        美好的事情即将发生
    </div>
</div>
<!-- 底部结束 -->
<!-- 背景切换开始 -->
<div class="bg-changer">
    <div class="swiper-container changer-list">
        <div class="swiper-wrapper">
            <div class="swiper-slide"><img class="item" src="../resources/images/a.jpg" alt=""></div>
            <div class="swiper-slide"><img class="item" src="../resources/images/b.jpg" alt=""></div>
            <div class="swiper-slide"><img class="item" src="../resources/images/c.jpg" alt=""></div>
            <div class="swiper-slide"><img class="item" src="../resources/images/d.jpg" alt=""></div>
            <div class="swiper-slide"><img class="item" src="../resources/images/e.jpg" alt=""></div>
            <div class="swiper-slide"><img class="item" src="../resources/images/f.jpg" alt=""></div>
            <div class="swiper-slide"><img class="item" src="../resources/images/g.jpg" alt=""></div>
            <div class="swiper-slide"><img class="item" src="../resources/images/h.jpg" alt=""></div>
            <div class="swiper-slide"><img class="item" src="../resources/images/i.jpg" alt=""></div>
            <div class="swiper-slide"><img class="item" src="../resources/images/j.jpg" alt=""></div>
            <div class="swiper-slide"><img class="item" src="../resources/images/k.jpg" alt=""></div>
            <div class="swiper-slide"><span class="reset">初始化</span></div>
        </div>
    </div>
    <div class="bg-out"></div>
    <div id="changer-set"><i class="iconfont">&#xe696;</i></div>
</div>
<!-- 背景切换结束 -->
<script type="text/javascript">
    var userid = sessionStorage.getItem("userid");
    var username = sessionStorage.getItem("username")
    var userphone = sessionStorage.getItem("userphone")
    var userpower = sessionStorage.getItem("userpower")
    var usersex = sessionStorage.getItem("usersex")
    document.getElementById("uname").innerHTML = username
    //生成左侧菜单
    $.ajax({
        type : "POST",
        url : "/DataBaseHomeWork/menus/menu",
        async : false ,
        data : {
            upower : userpower,
        },
        dataType : "json",
        success : function(msg){
            var str = "";
            for (var i = 0; i < msg.length; i++) {
                str += "<li class=\"list\">";
                str += "<a href=\"";
                str += msg[i].purl;
                str += "\">";
                str += "<i class=\"iconfont\">&#xe6af;</i>";
                str += msg[i].pname;
                str += "</a></li>";
            }
            document.getElementById("nav").innerHTML = str;
        },
        error : function(XMLHttpRequest, textStatus, errorThrown){
        }
    });

    //生成借阅列表
    $.ajax({
        type : "POST",
        url : "/DataBaseHomeWork/manngers/findMangerBorrowServlet",
        async : false ,
        data : {
            uid : userid ,
        },
        dataType : "json",
        success : function(msg){
            var str = "";
            for (var i = 0; i < msg.length; i++) {
                str += "<tr>";
                str += "<td hidden>"+msg[i].ubid+"</td>";
                str += "<td>"+msg[i].bid+"</td>";
                str += "<td>"+msg[i].book.bname+"</td>";
                str += "<td>"+msg[i].uid+"</td>";
                str += "<td>"+msg[i].user.uname+"</td>";
                str += "<td>"+msg[i].startDate+"</td>";
                str += "<td class=\"td-status\">";
                str += "<span onclick=\"borrowBook("+msg[i].ubid+")\" class=\"layui-btn layui-btn-normal layui-btn-mini\">";
                str += "批准</span></td></tr>";
            }
            document.getElementById("borrowList").innerHTML = str;
        },
        error : function(XMLHttpRequest, textStatus, errorThrown){
        }
    });

    $.ajax({
        type : "POST",
        url : "/DataBaseHomeWork/manngers/findMangerReturnServlet",
        async : false ,
        data : {
            uid : userid ,
        },
        dataType : "json",
        success : function(msg){
            var str = "";
            for (var i = 0; i < msg.length; i++) {
                str += "<tr>";
                str += "<td hidden>"+msg[i].ubid+"</td>";
                str += "<td>"+msg[i].bid+"</td>";
                str += "<td>"+msg[i].book.bname+"</td>";
                str += "<td>"+msg[i].uid+"</td>";
                str += "<td>"+msg[i].user.uname+"</td>";
                str += "<td>"+msg[i].startDate+"</td>";
                str += "<td class=\"td-status\">";
                str += "<span onclick=\"returnBook("+msg[i].ubid+")\" class=\"layui-btn layui-btn-normal layui-btn-mini\">";
                str += "批准</span></td></tr>";
            }
            document.getElementById("returnList").innerHTML = str;
        },
        error : function(XMLHttpRequest, textStatus, errorThrown){
        }
    });

    function borrowBook(ubid){
        $.ajax({
            type : "POST",
            url : "/DataBaseHomeWork/manngers/mBorrow",
            async : false ,
            data : {
                ubid : ubid ,
            },
            dataType : "json",
            success : function(msg){
                if(msg.flag>0){
                    layer.msg('批准借阅成功哦~', {
                        async : false ,
                        time: 10000, //10s后自动关闭
                        btn: ['知道了'],
                        btn1: function(){
                            location.reload();
                        }
                    });
                }
                else{
                    layer.msg('批准失败', {
                        async : false ,
                        time: 10000, //10s后自动关闭
                        btn: ['知道了']
                    });
                }
            },
            error : function(XMLHttpRequest, textStatus, errorThrown){
                alert(XMLHttpRequest.status);
                alert(XMLHttpRequest.readyState);//状态
                alert(textStatus);//错误信息
            }
        });
    }

    function returnBook(ubid){
        $.ajax({
            type : "POST",
            url : "/DataBaseHomeWork/manngers/mReturn",
            async : false ,
            data : {
                ubid : ubid ,
            },
            dataType : "json",
            success : function(msg){

                if(msg.flag>0){

                    layer.msg('批准归还成功哦~', {
                        async : false ,
                        time: 10000, //10s后自动关闭
                        btn: ['知道了'],
                        btn1: function(){
                            location.reload();
                        }
                    });
                }
                else{
                    layer.msg('申请归还失败，请联系系统管理员~', {
                        async : false ,
                        time: 10000, //10s后自动关闭
                        btn: ['知道了']
                    });
                }
            },
            error : function(XMLHttpRequest, textStatus, errorThrown){
                alert(XMLHttpRequest.status);
                alert(XMLHttpRequest.readyState);//状态
                alert(textStatus);//错误信息
            }
        });
    }
</script>
</body>
</html>
