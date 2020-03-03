<%--
  Created by IntelliJ IDEA.
  User: 97347
  Date: 2019/6/13
  Time: 11:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <script src="../laydate/laydate.js"></script> <!-- 改成你的路径 -->
    <title>Title</title>

</head>
<body>
<div style="padding-top: 500px">
    <form method="post" action="/DataBaseHomeWork/laydate/dates" id="laydates">
        <input type="text" id="test1" name = "dates">
        <input type="submit" value="提交">
    </form>

</div>

<button onclick="x()"></button>

<script>
    var times = new Date();
    function x(){//函数声明
        console.log(times.getMonth() +'--' + times.getDay());
    }
    //执行一个laydate实例
    var time = new Date();
    laydate.render({
        elem: '#test1' //指定元素
        ,value: time.getFullYear() + '-' + (time.getMonth()+1) + '-' + time.getDate()
        ,isInitValue: true //是否允许填充初始值，默认为 true
    });
</script>
</body>
</html>
