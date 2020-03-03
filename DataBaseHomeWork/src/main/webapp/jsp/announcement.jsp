<%--
  Created by IntelliJ IDEA.
  User: 97347
  Date: 2019/4/29
  Time: 11:31
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
    <div class="open-nav">
        <i class="iconfont">&#xe699;</i>
    </div>
    <ul class="layui-nav right" lay-filter="">
        <li class="layui-nav-item"><a href="javascript:;" id="uname">admin</a>
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
            <div class="layui-form">
                <div class="layui-form-item layui-form-text">
                    <label for="L_sign" class="layui-form-label"> 公告啦~ </label>
                    <div class="layui-input-block">
							<textarea placeholder="随便写些什么刷下存在感" id="L_sign" name="sign"
                                      autocomplete="off" class="layui-textarea" style="height: 80px;"></textarea>
                    </div>
                </div>
                <div class="layui-form-item">
                    <label for="L_sign" class="layui-form-label"> </label>
                    <button class="layui-btn" key="set-mine" lay-filter="save" lay-submit onclick="addAnnouncement()">保存</button>
                </div>
            </div>
            <!-- 右侧内容框架，更改从这里结束 -->
        </div>
    </div>
    <!-- 右侧主体结束 -->
</div>
<!-- 中部结束 -->
<!-- 底部开始 -->
<div class="footer">
    <div class="copyright">永远相信, 美好的事情即将发生</div>
</div>
<!-- 底部结束 -->
<!-- 背景切换开始 -->
<div class="bg-changer">
    <div class="swiper-container changer-list">
        <div class="swiper-wrapper">
            <div class="swiper-slide">
                <img class="item" src="../images/a.jpg" alt="">
            </div>
            <div class="swiper-slide">
                <img class="item" src="../images/b.jpg" alt="">
            </div>
            <div class="swiper-slide">
                <img class="item" src="../images/c.jpg" alt="">
            </div>
            <div class="swiper-slide">
                <img class="item" src="../images/d.jpg" alt="">
            </div>
            <div class="swiper-slide">
                <img class="item" src="../images/e.jpg" alt="">
            </div>
            <div class="swiper-slide">
                <img class="item" src="../images/f.jpg" alt="">
            </div>
            <div class="swiper-slide">
                <img class="item" src="../images/g.jpg" alt="">
            </div>
            <div class="swiper-slide">
                <img class="item" src="../images/h.jpg" alt="">
            </div>
            <div class="swiper-slide">
                <img class="item" src="../images/i.jpg" alt="">
            </div>
            <div class="swiper-slide">
                <img class="item" src="../images/j.jpg" alt="">
            </div>
            <div class="swiper-slide">
                <img class="item" src="../images/k.jpg" alt="">
            </div>
            <div class="swiper-slide">
                <span class="reset">初始化</span>
            </div>
        </div>
    </div>
    <div class="bg-out"></div>
    <div id="changer-set">
        <i class="iconfont">&#xe696;</i>
    </div>
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
        async : false,
        data : {
            upower : userpower,
        },
        dataType : "json",
        success : function(msg) {
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
        error : function(XMLHttpRequest, textStatus, errorThrown) {
        }
    });
    //取得最新公告
    $.ajax({
        type : "POST",
        url : "/DataBaseHomeWork/menus/announce",
        async : false,
        data : {},
        dataType : "json",
        success : function(msg) {
            document.getElementById("L_sign").innerHTML = msg.asummary;
        },
        error : function(XMLHttpRequest, textStatus, errorThrown) {
        }
    });
    //发布最新公告
    function addAnnouncement(){
        var summary = document.getElementById("L_sign").value;
        $.ajax({
            type : "POST",
            url : "/DataBaseHomeWork/manngers/updateAnnouncement",
            async : false,
            data : {
                summary : summary,
            },
            dataType : "json",
            success : function(msg) {
                if(msg.flag >0)
                    layer.msg('发布成功哦~', {
                        async : false ,
                        time: 10000, //10s后自动关闭
                        btn: ['知道了'],
                        btn1: function(){
                            goon();
                        }
                    });
            },
            error : function(XMLHttpRequest, textStatus, errorThrown) {
                alert(XMLHttpRequest.status);
                alert(XMLHttpRequest.readyState);//状态
                alert(textStatus);//错误信息
            }
        });
    }

    function goon(){
        window.location.href = './index.jsp';
    }

</script>
</body>
</html>
