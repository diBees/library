<%--
  Created by IntelliJ IDEA.
  User: 97347
  Date: 2019/5/7
  Time: 17:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
                    <label for="uphone" class="layui-form-label"> <span
                            class="x-red">*</span>输入账号
                    </label>
                    <div class="layui-input-inline">
                        <input type="text" id="uphone" name="upass" required=""
                               lay-verify="pass" autocomplete="off" class="layui-input">
                    </div>
                </div>

                <div class="layui-form-item">
                    <label for="oldpass" class="layui-form-label"> <span
                            class="x-red">*</span>输入原密码
                    </label>
                    <div class="layui-input-inline">
                        <input type="password" id="oldpass" name="upass" required=""
                               lay-verify="pass" autocomplete="off" class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label for="newpass" class="layui-form-label"> <span
                            class="x-red">*</span>输入新密码
                    </label>
                    <div class="layui-input-inline">
                        <input type="password" id="newpass" name="upass" required=""
                               lay-verify="pass" autocomplete="off" class="layui-input">
                    </div>
                    <div class="layui-form-mid layui-word-aux">6到16个字符</div>
                </div>
                <div class="layui-form-item">
                    <label for="renewpass" class="layui-form-label"> <span
                            class="x-red">*</span>请确认密码
                    </label>
                    <div class="layui-input-inline">
                        <input type="password" id="renewpass" name="repass" required=""
                               lay-verify="repass" autocomplete="off" class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label"> </label>
                    <button class="layui-btn" lay-filter="add" lay-submit="" onclick="register()">修改</button>
                    <button class="layui-btn" lay-filter="demo1" onclick="javascript :history.back(-1)">返回</button>
                </div>
            </div>
            <!-- 右侧内容框架，更改从这里结束 -->
        </div>
    </div>
    <!-- 右侧主体结束 -->
</div>
<!-- 中部结束 -->
<script type="text/javascript">
    function register(){
        var userphone = sessionStorage.getItem("userphone");
        var uphones = document.getElementById("uphone").value;
        var oldpass = document.getElementById("oldpass").value;
        var newpass = document.getElementById("newpass").value;
        var renewpass = document.getElementById("renewpass").value;
        if(renewpass != newpass)
            layer.msg('两次密码输入不一致哦~', {
                async : false ,
                time: 10000, //10s后自动关闭
                btn: ['好的'],
            });
        else{
            $.ajax({
                type : "POST",
                url : "/DataBaseHomeWork/useres/changerPass",
                async : false ,
                data : {
                    uphone : uphones,
                    oldpass : oldpass,
                    newpass : newpass,
                },
                dataType : "json",
                success : function(msg){
                    if(msg.flag>0){
                        layer.msg('修改成功哦，请重新登录陆~', {
                            async : false ,
                            time: 10000, //10s后自动关闭
                            btn: ['好的'],
                            btn1: function(){
                                goon();
                            }
                        });
                    }
                    else{
                        //配置一个透明的询问框
                        layer.msg('你的输入信息有误哦~', {
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

    }

    function goon(){
        window.location.href = './login.jsp';
    }
</script>

</body>
</html>
