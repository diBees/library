<%--
  Created by IntelliJ IDEA.
  User: 97347
  Date: 2019/5/6
  Time: 23:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>图书管理系统</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="shortcut icon" href="/favicon.ico" type="image/x-icon" />
    <link rel="stylesheet" href="../resources/css/font.css">
    <link rel="stylesheet" href="../resources/css/xadmin.css">
    <link rel="stylesheet" href="../resources/css/swiper.min.css">
    <script type="text/javascript" src="../resources/js/jquery.min.js"></script>
    <script type="text/javascript" src="../resources/js/jquery-2.0.0.min.js"></script>
    <script type="text/javascript" src="../resources/js/swiper.jquery.min.js"></script>
    <script src="../resources/lib/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="../resources/js/xadmin.js"></script>
</head>
<body>
<!-- 中部开始 -->
<div class="wrapper">
    <!-- 右侧主体开始 -->
    <div class="page-content">
        <div class="content">
            <!-- 右侧内容框架，更改从这里开始 -->
            <div class="layui-form">
                <div class="layui-form-item">
                    <label for="bname" class="layui-form-label"> 书籍名称 </label>
                    <div class="layui-input-inline">
                        <input type="text" id="bname" name="email" required
                               lay-verify="required" autocomplete="off" class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label for="bauthor" class="layui-form-label"> 书籍作者 </label>
                    <div class="layui-input-inline">
                        <input type="text" id="bauthor" name="username" required
                               lay-verify="required" autocomplete="off" class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item layui-form-text">
                    <label for="bsummary" class="layui-form-label"> 书籍介绍 </label>
                    <div class="layui-input-block">
							<textarea placeholder="写点什么呗" id="bsummary" name="sign"
                                      autocomplete="off" class="layui-textarea" style="height: 80px;"></textarea>
                    </div>
                </div>
                <div class="layui-form-item">
                    <label  class="layui-form-label"> </label>
                    <button class="layui-btn" key="set-mine" lay-filter="save"
                            lay-submit onclick="updateBook()">保存</button>
                    <button class="layui-btn" key="set-mine" lay-filter="save"
                            lay-submit onclick="javascript :history.back(-1)">返回</button>
                </div>
            </div>
            <!-- 右侧内容框架，更改从这里结束 -->
        </div>
    </div>
    <!-- 右侧主体结束 -->
</div>
<!-- 中部结束 -->
<script>
    //生成书籍列表
    var bid = sessionStorage.getItem("bookid");
    $.ajax({
        type : "POST",
        url : "/DataBaseHomeWork/books/echoBookInfor",
        async : false ,
        data : {
            bid : bid,
        },
        dataType : "json",
        success : function(msg){
            document.getElementById("bname").value = msg.bname;
            document.getElementById("bauthor").value = msg.bauthor;
            document.getElementById("bsummary").innerHTML = msg.bsummary;
        },
        error : function(XMLHttpRequest, textStatus, errorThrown){
            alert(XMLHttpRequest.status);
            alert(XMLHttpRequest.readyState);//状态
            alert(textStatus);//错误信息
        }
    });
</script>
<script>
    function updateBook(){
        var bname = document.getElementById("bname").value;
        var bauthor = document.getElementById("bauthor").value;
        var bsummary = document.getElementById("bsummary").value;
        $.ajax({
            type : "POST",
            url : "/DataBaseHomeWork/books/updateBook",
            async : false ,
            data : {
                bname : bname,
                bauthor : bauthor,
                bsummary : bsummary,
                bid : bid,
            },
            dataType : "json",
            success : function(msg){
                if(msg.flag >0){
                    if(msg.flag){
                        layer.msg('修改成功哦~', {
                            async : false ,
                            time: 10000, //10s后自动关闭
                            btn: ['好的'],
                            btn1: function(){
                                goon();
                            }
                        });
                    }
                }
                else{
                    //配置一个透明的询问框
                    layer.msg('你的信息有误哦~', {
                        async : false ,
                        time: 10000, //10s后自动关闭
                        btn: ['知道了']
                    });
                    return false
                }
            },
            error : function(XMLHttpRequest, textStatus, errorThrown){
                alert(XMLHttpRequest.status);
                alert(XMLHttpRequest.readyState);//状态
                alert(textStatus);//错误信息
            }
        });
    }

    function goon(){
        window.location.href = './book.jsp';
    }
</script>
</body>
</html>
