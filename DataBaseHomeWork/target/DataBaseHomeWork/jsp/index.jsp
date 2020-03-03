<%--
  Created by IntelliJ IDEA.
  User: 97347
  Date: 2019/4/29
  Time: 21:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page isELIgnored="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<html>
<head>
    <meta charset="UTF-8">
    <title>图书管理系统登录</title>
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
        function out(){
            window.location.href = './login.jsp';
        }
    </script>
    <style>
        .round_icon{
            width: 34px;
            height: 34px;
            display: flex;
            border-radius: 50%;
            align-items: center;
            justify-content: center;
            overflow: hidden;
        }
    </style>
</head>
<body>
<!-- 顶部开始 -->
<div class="container">
    <div class="logo">Sunny图书管理系统</div>
    <div class="open-nav"><i class="iconfont">&#xe699;</i></div>
    <ul class="layui-nav right" lay-filter="">
        <li class="layui-nav-item">
            <img src="../resources/images/a.jpg" class="round_icon"  alt="">
        </li>
        <li class="layui-nav-item">
            <a href="javascript:;" id="uname" onclick="presonal()">admin</a>
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
            <ul id="nav">
                <!--  <li class="list">
                     <a href="./index.html">
                         <i class="iconfont">&#xe6af;</i>
                         个人首页
                     </a>
                 </li>
                -->
            </ul>
        </div>
    </div>
    <!-- 左侧菜单结束 -->
    <!-- 右侧主体开始 -->
    <div class="page-content">
        <div class="content">
            <!-- 右侧内容框架，更改从这里开始 -->
            <fieldset class="layui-elem-field layui-field-title site-title">
                <legend><a name="default">公告栏</a></legend>
            </fieldset>
            <blockquote class="layui-elem-quote">
                <p id="summary">
                <p id="summarydate">
            </blockquote>
            <fieldset class="layui-elem-field layui-field-title site-title">
                <legend><a name="default">图书归还情况</a></legend>
            </fieldset>
            <table class="layui-table">
                <thead>
                <tr>
                    <th>书籍编号</th>
                    <th>书籍名称</th>
                    <th>借阅时间</th>
                    <th>状态</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody id="borrowList"></tbody>
            </table>
            <button class="layui-btn" lay-filter="demo1" onclick="window.location.href = './informationlist.jsp'">查看全部</button>
            <fieldset class="layui-elem-field layui-field-title site-title">
                <legend><a name="default">书籍信息</a></legend>
            </fieldset>
            <div class="layui-form layui-form-pane">
                <label class="layui-form-label">查询</label>
                <div class="layui-input-inline">
                    <select name="quiz1" id = "type1">
                        <option value="bname" selected="true">按名称</option>


                    </select>
                    <input type="text" name="username"  id = "input1" lay-verify="required" placeholder="请输入" autocomplete="off" class="layui-input">
                </div>
                <div class="layui-input-inline">
                    <select name="quiz1" id = "type2">
                        <option value="bauthor" selected="true">按作者</option>

                    </select>
                    <input type="text" name="username"  id = "input2" lay-verify="required" placeholder="请输入" autocomplete="off" class="layui-input">
                </div>
                <div class="layui-input-inline">
                    <select name="quiz1" id = "type3">
                        <option value="bpress" selected="true">按出版</option>
                    </select>
                    <input type="text" name="username"  id = "input3" lay-verify="required" placeholder="请输入" autocomplete="off" class="layui-input">
                </div>
                <button class="layui-btn" lay-filter="demo1" onclick="findPart()">查询</button>
                <button class="layui-btn" lay-filter="demo1" onclick="location.reload();">重置</button>
            </div>
            <table class="layui-table">
                <thead>
                <tr>
                    <th>书籍名称</th>
                    <th>书籍作者</th>
                    <th>出版社</th>
                    <th>书籍摘要</th>
                    <th>借阅量</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody id="bookinformation"></tbody>
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
<script>
    var userid = sessionStorage.getItem("userid");
    var username = sessionStorage.getItem("username");
    var userphone = sessionStorage.getItem("userphone");
    var userpower = sessionStorage.getItem("userpower");
    var usersex = sessionStorage.getItem("usersex");
    document.getElementById("uname").innerHTML = username;
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
    //生成公告栏
    $.ajax({
        type : "POST",
        url : "/DataBaseHomeWork/menus/announce",
        async : false ,
        data : {
        },
        dataType : "json",
        success : function(msg){
            document.getElementById("summary").innerHTML = msg.asummary;
            document.getElementById("summarydate").innerHTML = msg.aDate;
        },
        error : function(XMLHttpRequest, textStatus, errorThrown){
        }
    });
    //生成借阅列表
    $.ajax({
        type : "POST",
        url : "/DataBaseHomeWork/records/getPartBook",
        async : false ,
        data : {
            uid : userid
        },
        dataType : "json",
        success : function(msg){
            var str = "";
            for (var i = 0; i < msg.length; i++) {
                str += "<tr>";
                str += "<td hidden>"+msg[i].ubid+"</td>";
                str += "<td>"+msg[i].bid+"</td>";
                str += "<td>"+msg[i].bname+"</td>";
                str += "<td>"+msg[i].startDate+"</td>";
                if(msg[i].ubflag == 1){
                    str += "<td>正在预约</td>";
                    str += "<td>waiting</td>";
                }
                else if(msg[i].ubflag == 2){
                    str += "<td>正在借阅</td>";
                    str += "<td class=\"td-status\"><span onclick=\"returnBook("+msg[i].ubid+")\" class=\"layui-btn layui-btn-normal layui-btn-mini\">归还</span></td>";
                }
                else if(msg[i].ubflag == -1){
                    str += "<td>申请归还</td>";
                    str += "<td>waiting</td>";
                }
                else{
                    str += "<td>"+msg[i].endDate+"归还</td>";
                }
                str += "</tr>";
            }
            document.getElementById("borrowList").innerHTML = str;
        },
        error : function(XMLHttpRequest, textStatus, errorThrown){
        }
    });
    //生成书籍列表
    $.ajax({
        type : "POST",
        url : "/DataBaseHomeWork/books/findAllBook",
        async : false ,
        data : {
        },
        dataType : "json",
        success : function(msg){
            var str = "";
            for (var i = 0; i < msg.length; i++) {
                str += "<tr>";
                str += "<td hidden>"+msg[i].bid + "</td>";
                str += "<td>" + msg[i].bname    + "</td>";
                str += "<td>" + msg[i].bauthor  + "</td>";
                str += "<td>" + msg[i].bpress   + "</td>";
                str += "<td>" + msg[i].bsummary + "</td>";
                str += "<td>" + msg[i].bvolume  + "</td>";
                str += "<td class=\"td-status\">";
                str += "<span onclick=\"borrowBook("+msg[i].bid+")\" class=\"layui-btn layui-btn-normal layui-btn-mini\">";
                str += "预约</span></td></tr>";
            }
            document.getElementById("bookinformation").innerHTML = str;
        },
        error : function(XMLHttpRequest, textStatus, errorThrown){
        }
    });
</script>
<script>
    function findPart(){
        //查询生成书籍列表

        var input1 = document.getElementById("input1").value;
        var input2 = document.getElementById("input2").value;
        var input3 = document.getElementById("input3").value;
        $.ajax({
            type : "POST",
            url : "/DataBaseHomeWork/books/findPartBook",
            async : false ,
            data : {
                input1 : input1 ,
                input2 : input2 ,
                input3 : input3 ,
            },
            dataType : "json",
            success : function(msg){
                var str = "";
                for (var i = 0; i < msg.length; i++) {
                    str += "<tr>";
                    str += "<td hidden>"+msg[i].bid + "</td>";
                    str += "<td>" + msg[i].bname    + "</td>";
                    str += "<td>" + msg[i].bauthor  + "</td>";
                    str += "<td>" + msg[i].bpress   + "</td>";
                    str += "<td>" + msg[i].bsummary + "</td>";
                    str += "<td>" + msg[i].bvolume  + "</td>";
                    str += "<td class=\"td-status\">";
                    str += "<span onclick=\"borrowBook("+msg[i].bid+")\" class=\"layui-btn layui-btn-normal layui-btn-mini\">";
                    str += "预约</span></td></tr>";
                }
                if(str == "")
                    layer.msg('没有这本书或者正在借阅中~', {
                        async : false ,
                        time: 10000, //10s后自动关闭
                        btn: ['知道了']
                    });
                document.getElementById("bookinformation").innerHTML = str;
            },
            error : function(XMLHttpRequest, textStatus, errorThrown){
                alert(XMLHttpRequest.status);
                alert(XMLHttpRequest.readyState);//状态
                alert(textStatus);//错误信息
            }
        });
    }

    function borrowBook(bid){
        $.ajax({
            type : "POST",
            url : "/DataBaseHomeWork/books/borrwoBook",
            async : false ,
            data : {
                uid : userid ,
                bid : bid ,
            },
            dataType : "json",
            success : function(msg){

                if(msg.flag>0){
                    alert("成功");
                    window.location.href = './index.jsp';

                }
                else{
                    layer.msg('预约失败，请联系系统管理员~', {
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
            url : "/DataBaseHomeWork/books/returnBook",
            async : false ,
            data : {
                ubid : ubid ,
            },
            dataType : "json",
            success : function(msg){
                if(msg.flag>0){
                    alert("申请归还成功");
                    window.location.href = './index.jsp';
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
    
    
    function presonal() {
        window.location.href = './memberedit.jsp';
    }
</script>
</body>
</html>
