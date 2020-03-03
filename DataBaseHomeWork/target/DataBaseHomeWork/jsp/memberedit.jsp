<%--
  Created by IntelliJ IDEA.
  User: 97347
  Date: 2019/5/6
  Time: 23:23
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
    <script type="text/javascript" src="../resources/js/testjs/testData.js"></script>
    <style>
        #upic{
            width: 100px;
            height: 100px;
            display: flex;
            border-radius: 50%;
            align-items: center;
            justify-content: center;
            overflow: hidden;
        }
    </style>
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
                    <div >
                        <form method="post" enctype="multipart/form-data" id="file_upload" action="/DataBaseHomeWork/images/editsPhoto">
                            <table>
                                <tr>
                                    <th>
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        <input type="text" id="uid" name="uid" style="width:100px;display:none" >
                                    </th>
                                    <th>
                                        <c:if test="${user.userurl != null}">
                                            <img onfocus=this.blur() src="/pic/${user.userurl}"  id="upic"/>
                                        </c:if>　
                                    </th>
                                    <th style="vertical-align:bottom">
                                        <input type="submit" class="layui-btn" value="保存" onclick="logines()"/>
                                        <input type="file" name="tpic" id="tpic" />
                                    </th>
                                </tr>
                            </table>
                        </form>

                    </div>


                </div>

                <div class="layui-form-item">
                    <label for="uphone" class="layui-form-label"> 账号 </label>
                    <div class="layui-input-inline">
                        <input type="text" id="uphone" name="email" required
                               lay-verify="required" autocomplete="off" class="layui-input" disabled="disabled">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label for="upass" class="layui-form-label"> 密码 </label>
                    <div class="layui-input-inline">
                        <input type="password" id="upass" name="upass" required
                               lay-verify="required" autocomplete="off" class="layui-input">
                    </div>
                </div>

                <div class="layui-form-item">
                    <label for="uname" class="layui-form-label"> 姓名 </label>
                    <div class="layui-input-inline">
                        <input type="text" id="uname" name="username" required
                               lay-verify="required" autocomplete="off" class="layui-input">
                    </div>
                    <p id="asdasd"></p>
                </div>

                <div class="layui-form-item">
                    <label for="upower" class="layui-form-label"> 权限 </label>
                    <div class="layui-input-inline">
                        <input type="text" id="upower" name="upower" required
                               lay-verify="required" autocomplete="off" class="layui-input">
                    </div>
                </div>



                <div class="layui-form-item">
                    <label  class="layui-form-label"> </label>
                    <button class="layui-btn" key="set-mine" lay-filter="save"
                            lay-submit onclick="updateUser()">保存</button>
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




    function updateUser(){
        if( !testIsNull($("#upass").val()) ){
            alert("It is not allowed to be empty");
        } else if(!testIsNull($("#uname").val())){
            alert("It is not allowed to be empty");
        }else if(!testIsNull($("#upower").val())){

            alert("It is not allowed to be empty");
        }

        else{
            var uphone = document.getElementById("uphone").value;
            var upass = document.getElementById("upass").value;
            var uname = document.getElementById("uname").value;
            var upower = document.getElementById("upower").value;

            $.ajax({
                type : "POST",
                url : "/DataBaseHomeWork/useres/updateUser",
                async : false ,
                data : {
                    uphone : uphone,
                    uname : uname,
                    upower : upower,
                    upass : upass,
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

    }

    function goon(){
        window.location.href = './member.jsp';
    }
</script>


<script>
    //生成成员列表
    var uid = sessionStorage.getItem("userid");
    var url = "/pic/";
    $.ajax({
        type : "POST",
        url : "/DataBaseHomeWork/useres/findUser",
        async : false ,
        data : {
            uid : uid,
        },
        dataType : "json",
        success : function(msg){
            document.getElementById("uphone").value = msg.uphone;
            document.getElementById("uname").value = msg.uname;
            document.getElementById("upower").value = msg.upower;
            document.getElementById("uid").value = msg.uid;
            document.getElementById("upic").src = "//pic//"+msg.userurl;


            /*$("#upic").attr('src', "/pic/" + msg.userurl);*/


        },
        error : function(XMLHttpRequest, textStatus, errorThrown){
            alert(XMLHttpRequest.status);
            alert(XMLHttpRequest.readyState);//状态
            alert(textStatus);//错误信息
        }
    });




    function logines() {
        $("#file_upload").submit();
        //alert(%{users.phone});

    }
</script>


</body>
</html>
