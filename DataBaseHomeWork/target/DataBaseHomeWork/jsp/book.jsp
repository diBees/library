<%--
  Created by IntelliJ IDEA.
  User: 97347
  Date: 2019/5/6
  Time: 20:42
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
            window.location.href = './login.html';
        }
        function outI(){
            window.location.href = './index.html';
        }
    </script>
    <style>
        .a-upload {
            padding: 4px 10px;
            height: 20px;
            line-height: 20px;
            position: relative;
            cursor: pointer;
            color: #888;
            background: #fafafa;
            border: 1px solid #ddd;
            border-radius: 4px;
            overflow: hidden;
            display: inline-block;
            *display: inline;
            *zoom: 1
        }

        .a-upload  input {
            position: absolute;
            font-size: 100px;
            right: 0;
            top: 0;
            opacity: 0;
            filter: alpha(opacity = 0);
            cursor: pointer
        }

    </style>
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
            <div class="layui-form xbs" action="">
                <div class="layui-form-pane" style="text-align: center;">
                    <div class="layui-form-item" style="display: inline-block;">
                        <label class="layui-form-label xbs768">搜索</label>
                        <div class="layui-input-inline">
                            <input type="text" id="input" name="username"
                                   placeholder="编号/名称/作者" autocomplete="off" class="layui-input">
                        </div>
                        <div class="layui-input-inline" style="width: 80px">
                            <button class="layui-btn" lay-submit="" lay-filter="sreach"
                                    onclick="find()">
                                <i class="layui-icon">&#xe615;</i>
                            </button>
                        </div>
                    </div>
                </div>
            </div>
            <xblock> <!-- <div class="layui-form-item">
					<label class="layui-form-label">短输入框</label>
					<div class="layui-input-inline">
						<input type="text" name="username" lay-verify="required" placeholder="请输入" autocomplete="off" class="layui-input">
					</div>
				</div> -->
                <button class="layui-btn"
                        onclick="window.location.href = './bookadd.jsp'">
                    <i class="layui-icon">&#xe608;</i>添加
                </button>
                <span class="x-right" style="line-height: 40px" id="count"></span></xblock>
            <table class="layui-table">
                <thead>
                <tr>
                    <th>书籍编号</th>
                    <th>书籍名称</th>
                    <th>书籍作者</th>
                    <th>出版社</th>
                    <th>书籍简介</th>
                    <th>借阅量</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody id="bookinformation">
                </tbody>
            </table>
            <div id="lis"></div>
            <!-- 右侧内容框架，更改从这里结束 -->
            <form id="upload" action="../UploadServlet" method="post" enctype="multipart/form-data">
                <a href="javascript:;" class="a-upload">
                    <input type="file" name="file" accept=".xls,.xlsx"/>点击这里上传文件
                </a>
                <a href="javascript:;" class="a-upload">
                    <input type="submit"/>上传
                </a>
            </form>
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
                <img class="item" src="../resources/images/a.jpg" alt="">
            </div>
            <div class="swiper-slide">
                <img class="item" src="../resources/images/b.jpg" alt="">
            </div>
            <div class="swiper-slide">
                <img class="item" src="../resources/images/c.jpg" alt="">
            </div>
            <div class="swiper-slide">
                <img class="item" src="../resources/images/d.jpg" alt="">
            </div>
            <div class="swiper-slide">
                <img class="item" src="../resources/images/e.jpg" alt="">
            </div>
            <div class="swiper-slide">
                <img class="item" src="../resources/images/f.jpg" alt="">
            </div>
            <div class="swiper-slide">
                <img class="item" src="../resources/images/g.jpg" alt="">
            </div>
            <div class="swiper-slide">
                <img class="item" src="../resources/images/h.jpg" alt="">
            </div>
            <div class="swiper-slide">
                <img class="item" src="../resources/images/i.jpg" alt="">
            </div>
            <div class="swiper-slide">
                <img class="item" src="../resources/images/j.jpg" alt="">
            </div>
            <div class="swiper-slide">
                <img class="item" src="../resources/images/k.jpg" alt="">
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
    //生成书籍列表


    $.ajax({
        type : "POST",
        url : "/DataBaseHomeWork/books/findAllBook",
        async : false,
        data : {},
        dataType : "json",
        success : function(msg) {
            var str = "";
            for (var i = 0; i < msg.length; i++) {
                str += "<tr>";
                str += "<td>" + msg[i].bid      + "</td>";//添加賬號
                str += "<td>" + msg[i].bname    + "</td>";//添加姓名
                str += "<td>" + msg[i].bauthor  + "</td>";//添加密碼
                str += "<td>" + msg[i].bpress   + "</td>";//
                str += "<td>" + msg[i].bsummary + "</td>";//
                str += "<td>" + msg[i].bvolume  + "</td>";//
                str += "<td class=\"td-manage\">";
                str += "<a title=\"编辑\" href=\"javascript:;\" onclick=\"editgo("
                    + msg[i].bid + ")\"";
                str += "class=\"ml-5\" style=\"text-decoration:none\">";

                str += "<i class=\"layui-icon\">&#xe642;</i></a>";

                str += "<a title=\"删除\" href=\"javascript:;\" onclick=\"deleteBookCheck("
                    + msg[i].bid //刪除信息按鈕
                    + ")\"style=\"text-decoration:none\">";
                str += "<i class=\"layui-icon\">&#xe640;</i>";
                str += "</a></td>";
            }
            document.getElementById("bookinformation").innerHTML = str;
        },
        error : function(XMLHttpRequest, textStatus, errorThrown) {
        }
    });


</script>
<script type="text/javascript">
    //生成查找书籍列表
    function find() {
        var input = document.getElementById("input").value;
        $.ajax({
            type : "POST",
            url : "/DataBaseHomeWork/manngers/findRecordByMannger",
            async : false,
            data : {
                input : input,
            },
            dataType : "json",
            success : function(msg) {
                var str = "";
                for (var i = 0; i < msg.length; i++) {
                    str += "<tr>";
                    str += "<td>" + msg[i].bid + "</td>";
                    str += "<td>" + msg[i].bname + "</td>";
                    str += "<td>" + msg[i].bauthor + "</td>";
                    str += "<td>" + msg[i].bsummary + "</td>";
                    str += "<td>" + msg[i].bvolume + "</td>";
                    str += "<td class=\"td-manage\">";
                    str += "<a title=\"编辑\" href=\"javascript:;\" onclick=\"editgo("
                        + msg[i].bid + ")\"";
                    str += "class=\"ml-5\" style=\"text-decoration:none\">";
                    str += "<i class=\"layui-icon\">&#xe642;</i></a>";
                    str += "<a title=\"删除\" href=\"javascript:;\" onclick=\"deleteBookCheck("
                        + msg[i].bid
                        + ")\"style=\"text-decoration:none\">";
                    str += "<i class=\"layui-icon\">&#xe640;</i>";
                    str += "</a></td>";
                }
                if (str == "")
                    layer.msg('没有这本书或者正在借阅中~', {
                        async : false,
                        time : 10000, //10s后自动关闭
                        btn : [ '知道了' ]
                    });
                document.getElementById("bookinformation").innerHTML = str;
            },
            error : function(XMLHttpRequest, textStatus,
                             errorThrown) {
                alert(XMLHttpRequest.status);
                alert(XMLHttpRequest.readyState);//状态
                alert(textStatus);//错误信息
            }
        });
    }
    //删除书籍
    function deleteBookCheck(bid) {
        alert(bid)
        layer.msg('您确定要删除吗？', {
            async : false,
            time : 10000, //10s后自动关闭
            btn : [ '取消', '删除' ],
            btn2 : function() {
                deleteBook(bid);
            }
        });
    }

    function deleteBook(bid) {
        $.ajax({
            type : "POST",
            url : "/DataBaseHomeWork/manngers/delectBookMannger",
            async : false,
            data : {
                bid : bid,
            },
            dataType : "json",
            success : function(msg) {
                if (msg.flag>0) {
                    layer.msg('删除成功~', {
                        async : false,
                        time : 10000, //10s后自动关闭
                        btn : [ '知道了' ],
                        btn1 : function() {
                            location.reload();
                        }
                    });
                } else {
                    layer.msg('删除失败，请联系系统管理员~', {
                        async : false,
                        time : 10000, //10s后自动关闭
                        btn : [ '知道了' ]
                    });
                }
            },
            error : function(XMLHttpRequest, textStatus, errorThrown) {
                alert(XMLHttpRequest.status);
                alert(XMLHttpRequest.readyState);//状态
                alert(textStatus);//错误信息
            }
        });
    }

    //编辑跳转
    function editgo(bid) {
        sessionStorage.setItem("bookid", bid);
        window.location.href = './bookedit.jsp';
    }
</script>
</body>
</html>
