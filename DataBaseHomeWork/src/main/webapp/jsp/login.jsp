<%--
  Created by IntelliJ IDEA.
  User: 97347
  Date: 2019/4/29
  Time: 20:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page isELIgnored="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<html>
<head>
    <meta charset="utf-8">
    <title>图书管理系统登录</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="../resources/css/font.css">
    <link rel="stylesheet" type="text/css" href="../resources/css/xadmin.css">
    <link rel="stylesheet" type="text/css" href="../resources/css/swiper.min.css">
    <script src="../resources/lib/layui/layui.js" type="text/javascript" ></script>
    <script type="text/javascript" src="../resources/js/jquery.min.js"></script>
    <script type="text/javascript" src="../resources/js/jquery-2.0.0.min.js"></script>
    <script type="text/javascript" src="../resources/js/swiper.jquery.min.js"></script>
    <script type="text/javascript" src="../resources/js/xadmin.js"></script>
</head>
<body>
    <div class="login-logo"><h1>Have A Nice Day!</h1></div>
    <div class="login-box">
        <div class="layui-form layui-form-pane">
            <center>
                <h3>登录你的帐号</h3>
            </center>
            <label class="login-title" for="uphone">帐号</label>
            <div class="layui-form-item">
                    <label class="layui-form-label login-form"><i class="iconfont">&#xe6b8;</i></label>
                <div class="layui-input-inline login-inline">
                    <input type="text" name="username" id="uphone" lay-verify="required" placeholder="请输入你的帐号" autocomplete="off" class="layui-input">
                </div>
            </div>
            <label class="login-title" for="upass">密码</label>
            <div class="layui-form-item">
                <label class="layui-form-label login-form"><i class="iconfont">&#xe82b;</i></label>
                <div class="layui-input-inline login-inline">
                    <input type="password" name="password" id="upass" lay-verify="required" placeholder="请输入你的密码" autocomplete="off" class="layui-input">
                </div>
            </div>
            <label class="login-title" for="upass">验证码</label>
            <div class="layui-form-item">
                <div class="layui-input-inline login-inline">
                    <table>
                        <tr>
                            <td>
                                <input type="password" name="password" id="checkpass" lay-verify="required" placeholder="验证码" autocomplete="off" class="layui-input" vertical-align:middle style="width: 100px; ">

                            </td>
                            <td>
                                <img id="servletImg" src="../resources/images/hh.jpg" vertical-align:middle /><a href="javascript:changImg()"  >看不清</a>
                            </td>
                        </tr>

                    </table>



                </div>
            </div>

            <div class="form-actions">
                <button class="btn btn-warning pull-right" lay-submit lay-filter="login"  type="submit" onclick="login()">登录</button>
                <button class="btn btn-warning pull-right" onclick="register()">注册</button>
                <!-- <input type='button' class="btn btn-warning pull-right" lay-submit lay-filter="login" onclick="login()">登录</input> -->
            </div>
        </div>
    </div>


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
    <script type="text/javascript">
        function login() {
            var uphone = document.getElementById("uphone").value;
            var upass = document.getElementById("upass").value;
            var checkpass = document.getElementById("checkpass").value;
            $.ajax({
                type : "POST",
                url : "/DataBaseHomeWork/useres/login",
                async : false ,
                data : {
                    uphone : uphone,
                    upass : upass,
                    checkpass:checkpass,
                },
                dataType : "json",
                success : function(msg){
                    if(msg.flag > 0){
                        sessionStorage.setItem("userid", msg.uid);
                        sessionStorage.setItem("username", msg.uname);
                        sessionStorage.setItem("userphone", msg.uphone);
                        sessionStorage.setItem("userpower", msg.upower);
                        sessionStorage.setItem("usersex", msg.usex);
                        window.location.href = './index.jsp';
                    }
                    else{
                        //配置一个透明的询问框
                        layer.msg('你的输入信息有误哦~如果忘记密码，请联系管理员~', {
                            async : false ,
                            time: 10000, //10s后自动关闭
                            btn: ['知道了']
                        });
                        return false
                    }
                },
                error : function(XMLHttpRequest, textStatus, errorThrown){
                }
            });
        }


        function register(){
            window.location.href = './register.jsp';
        }
        function changImg(){
            var img = document.getElementById("servletImg");
            var d = new Date();
            var time = d.getTime();//如果没有这个
            //下面这一句不会起作用，因为浏览器的缓存技术，图片并不会刷新
            //img.src="/myHelloWeb/servlet/ImageServlet";
            img.src="/DataBaseHomeWork/images/imageTest?"+time;
            //?号后面的东西是通过get方式传递的

        }
    </script>
</body>
</html>
