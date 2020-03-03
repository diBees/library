<%--
  Created by IntelliJ IDEA.
  User: 97347
  Date: 2019/5/5
  Time: 20:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>图书管理系统</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <link rel="stylesheet" href="../resources/css/font.css">
    <link rel="stylesheet" href="../resources/css/xadmin.css">
    <link rel="stylesheet" href="../resources/css/swiper.min.css">
    <link rel="stylesheet" href="../resources/layui/css/layui.css"  media="all">
    <script type="text/javascript" src="../resources/js/jquery.min.js"></script>
    <script type="text/javascript" src="../resources/js/jquery-2.0.0.min.js"></script>
    <script type="text/javascript" src="../resources/js/swiper.jquery.min.js"></script>
    <script src="../resources/lib/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="../resources/js/xadmin.js"></script>
    <script src="../resources/layui/layui.js" charset="utf-8"></script>
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
    <!-- 右侧主体开始 -->
    <div class="page-content">
        <div class="content">
            <!-- 右侧内容框架，更改从这里开始 -->
            <fieldset class="layui-elem-field layui-field-title site-title">
                <legend><a name="default">图书归还情况</a></legend>
            </fieldset>
            <table class="layui-table">
                <thead>
                <tr>
                    <th>书籍编号</th>
                    <th>书籍名称</th>
                    <th>借阅时间</th>
                    <th>归还时间</th>
                </tr>
                </thead>
                <tbody id="borrowList"></tbody>
            </table>
            <div id="demo3"></div>
            <button class="layui-btn" lay-filter="demo1" onclick="javascript :history.back(-1)">返回</button>
        </div>
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
    var username = sessionStorage.getItem("username");
    var data;
    document.getElementById("uname").innerHTML = username;
    $.ajax({
        type : "POST",
        url : "/DataBaseHomeWork/manngers/findAllRecord",
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
                str += "<td>"+msg[i].startDate+"</td>";
                if(msg[i].ubflag == 2){
                    str += "<td>暂未归还</td>";
                }
                else{
                    str += "<td>"+msg[i].endDate+"</td>";
                }
                str += "</tr>";
            }
            document.getElementById("borrowList").innerHTML = str;

            data = msg;
        },
        error : function(XMLHttpRequest, textStatus, errorThrown){
        }
    });

    layui.use(['laypage', 'layer'], function(){
        var laypage = layui.laypage
            ,layer = layui.layer;

        //自定义首页、尾页、上一页、下一页文本
        laypage.render({
            elem: 'demo3'
            ,count: data.length
            ,first: '首页'
            ,last: '尾页'
            ,prev: '<em>←</em>'
            ,next: '<em>→</em>'
            ,jump: function(obj){
                //模拟渲染
                document.getElementById('borrowList').innerHTML = function(){
                    var arr = []
                        ,thisData = data.concat().splice(obj.curr*obj.limit - obj.limit, obj.limit);
                    layui.each(thisData, function(index, item){
                        arr.push('<tr>');
                        arr.push('<td>'+ item.bid +'</td>');
                        arr.push('<td>'+ item.book.bname +'</td>');
                        arr.push('<td>'+ item.startDate +'</td>');
                        if(item.end == "1000-01-01"){
                            arr.push('<td>暂未归还</td>');
                        }
                        else{
                            arr.push('<td>'+ item.endDate +'</td>');
                        }
                        arr.push('</tr>');
                    });
                    return arr.join('');
                }();
            }
        });
    });

</script>

</body>
</html>
