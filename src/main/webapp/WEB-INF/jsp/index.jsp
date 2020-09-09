<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>layout 后台大布局 - Layui</title>
    <link rel="stylesheet" href="/layui/css/layui.css">
</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
    <div class="layui-header">
        <div class="layui-logo">layui 后台布局</div>
        <!-- 头部区域（可配合layui已有的水平导航） -->
        <ul class="layui-nav layui-layout-left">
            <li class="layui-nav-item"><a href="">控制台</a></li>
            <li class="layui-nav-item"><a href="">用户管理</a></li>
            <li class="layui-nav-item"><a href="">用户</a></li>
            <li class="layui-nav-item">
                <a href="javascript:;">其它系统</a>
                <dl class="layui-nav-child">
                    <dd><a href="">邮件管理</a></dd>
                    <dd><a href="">消息管理</a></dd>
                    <dd><a href="">授权管理</a></dd>
                </dl>
            </li>
        </ul>
        <ul class="layui-nav layui-layout-right">
            <li class="layui-nav-item">
                <a href="javascript:;">
                    <img src="http://t.cn/RCzsdCq" class="layui-nav-img">
                    Frankyang
                </a>
                <dl class="layui-nav-child">
                    <dd><a href="">基本资料</a></dd>
                    <dd><a href="">安全设置</a></dd>
                </dl>
            </li>
            <li class="layui-nav-item"><a href="">退了</a></li>
        </ul>
    </div>

    <div class="layui-side layui-bg-black">
        <div class="layui-side-scroll">
            <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
            <ul class="layui-nav layui-nav-tree"  lay-filter="test">
                <li class="layui-nav-item layui-nav-itemed">
                    <a class="" href="javascript:;">用户管理</a>
                    <dl class="layui-nav-child">
                        <dd><a href="javascript:;">列表一</a></dd>
                        <dd><a href="javascript:;">列表二</a></dd>
                        <dd><a href="javascript:;">列表三</a></dd>
                        <dd><a href="">超链接</a></dd>
                    </dl>
                </li>
                <li class="layui-nav-item">
                    <a href="javascript:;">解决方案</a>
                    <dl class="layui-nav-child">
                        <dd><a href="javascript:;">列表一</a></dd>
                        <dd><a href="javascript:;">列表二</a></dd>
                        <dd><a href="">超链接</a></dd>
                    </dl>
                </li>
                <li class="layui-nav-item"><a href="">云市场</a></li>
                <li class="layui-nav-item"><a href="">发布商品</a></li>
            </ul>
        </div>
    </div>

    <div class="layui-body">
        <!-- 内容主体区域 -->
        <div style="padding: 15px;">
            <button class="layui-btn" id="addUser">
                <i class="layui-icon">&#xe608;</i> 添加
            </button>
            <table id="user" lay-filter="user-table"></table>

        </div>
    </div>

    <div class="layui-footer">
        <!-- 底部固定区域 -->
        © layui.com - 底部固定区域
    </div>
</div>
<!--添加用户-->
<div class="layui-row" id="addUserDialog" style="display:none;">
    <div class="layui-col-md11">
        <form class="layui-form" id="userForm" lay-filter="addUserForm">
            <div class="layui-form-item">
                <label class="layui-form-label">用户名：</label>
                <div class="layui-input-inline">
                    <input type="text" name="userName" class="layui-input">
                </div>
                <label class="layui-form-label">密码：</label>
                <div class="layui-input-inline">
                    <input type="password" name="password" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">姓名：</label>
                <div class="layui-input-inline">
                    <input type="text" name="name" class="layui-input">
                </div>
                <label class="layui-form-label">性别：</label>
                <div class="layui-input-inline">
                    <input type="radio" name="sex" value="0" title="男">
                    <input type="radio" name="sex" value="1" title="女" checked>
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">年龄：</label>
                <div class="layui-input-inline">
                    <input type="text" name="age" class="layui-input">
                </div>
                <label class="layui-form-label">出生日期：</label>
                <div class="layui-input-inline">
                    <input type="text" name="birthday" class="layui-input" id="birthday">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">备注：</label>
                <div class="layui-input-block">
                    <textarea placeholder="请输入内容" class="layui-textarea" name="note"></textarea>
                </div>
            </div>
            <div class="layui-form-item">
                <div class="layui-input-block">
                    <button lay-submit class="layui-btn layui-btn-normal" lay-filter="add_user">提交</button>
                </div>
            </div>
        </form>
    </div>
</div>
<div class="layui-row" id="updateUserDialog" style="display:none;">
    <div class="layui-col-md11">
        <form class="layui-form" id="updateUserForm" lay-filter="updateUserForm">
            <div class="layui-form-item">
                <label class="layui-form-label">用户名：</label>
                <div class="layui-input-inline">
                    <input type="text" name="userName" class="layui-input"><input type="hidden" name="id">
                </div>

            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">姓名：</label>
                <div class="layui-input-inline">
                    <input type="text" name="name" class="layui-input">
                </div>
                <label class="layui-form-label">性别：</label>
                <div class="layui-input-inline">
                    <input type="radio" name="sex" value="0" title="男">
                    <input type="radio" name="sex" value="1" title="女" checked>
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">年龄：</label>
                <div class="layui-input-inline">
                    <input type="text" name="age" class="layui-input">
                </div>
                <label class="layui-form-label">出生日期：</label>
                <div class="layui-input-inline">
                    <input type="text" name="birthday" class="layui-input" id="birthday2">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">备注：</label>
                <div class="layui-input-block">
                    <textarea placeholder="请输入内容" class="layui-textarea" name="note"></textarea>
                </div>
            </div>
            <div class="layui-form-item">
                <div class="layui-input-block">
                    <button lay-submit class="layui-btn layui-btn-normal" lay-filter="update_user">提交</button>
                </div>
            </div>
        </form>
    </div>
</div>
<script type="text/html" id="toolBar">
    <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</script>
<script src="/layui/layui.js"></script>
<script>
    //JavaScript代码区域
    layui.use(['table','jquery','laydate','form'], function(){
        var table = layui.table;
        var $=layui.jquery;
        var laydate=layui.laydate;
        var form=layui.form;
        //JavaScript代码区域
        layui.laytpl.toDateString = function(d, format){
            var date = new Date(d || new Date())
                ,ymd = [
                this.digit(date.getFullYear(), 4)
                ,this.digit(date.getMonth() + 1)
                ,this.digit(date.getDate())
            ]
                ,hms = [
                this.digit(date.getHours())
                ,this.digit(date.getMinutes())
                ,this.digit(date.getSeconds())
            ];

            format = format || 'yyyy-MM-dd HH:mm:ss';

            return format.replace(/yyyy/g, ymd[0])
                .replace(/MM/g, ymd[1])
                .replace(/dd/g, ymd[2])
                .replace(/HH/g, hms[0])
                .replace(/mm/g, hms[1])
                .replace(/ss/g, hms[2]);
        };
        //数字前置补零
        layui.laytpl.digit = function(num, length, end){
            var str = '';
            num = String(num);
            length = length || 2;
            for(var i = num.length; i < length; i++){
                str += '0';
            }
            return num < Math.pow(10, length) ? str + (num|0) : num;
        };
        //第一个实例
        table.render({
            elem: '#user'
            ,height: 500
            ,url: '/rest/user/listByPage/' //数据接口
            ,page: true //开启分页
            ,cols: [[ //表头
                {field: 'id', title: 'ID', width:80, sort: true, fixed: 'left'}
                ,{field: 'userName', title: '用户名', width:150}
                ,{field: 'name', title: '姓名', width:80}
                ,{field: 'age', title: '年龄', width:80}
                ,{field: 'sex', title: '性别', width: 80}
                ,{field: 'birthday', title: '出生日期', width:150,templet: '<div>{{ layui.laytpl.toDateString(d.birthday)}}</div>'}
                ,{title:'操作',width:150,toolbar: '#toolBar'}
            ]]
            ,done: function(res, curr, count){
                //console.log("done");
                $("[data-field='sex']").children().each(function(){
                    //console.log("sex");
                    if($(this).text()=='0'){
                        $(this).text('男');
                    }else if($(this).text()=='1'){
                        $(this).text('女');
                    }
                })
            }
        });
        table.on('tool(user-table)',function(obj){
            var data = obj.data; //获得当前行数据
            var layEvent = obj.event; //获得 lay-event 对应的值（也可以是表头的 event 参数对应的值）
            var tr = obj.tr; //获得当前行 tr 的DOM对象
            //获取日期
            var d=data.birthday;
            if(layEvent === 'del'){ //删除
                layer.confirm('真的删除行么', function(index){
                    obj.del(); //删除对应行（tr）的DOM结构，并更新缓存
                    layer.close(index);
                    //向服务端发送删除指令
                    $.post('/rest/user/delete',{id:data.id},function(flag){

                    });
                });
            } else if(layEvent === 'edit'){ //编辑
                console.log(data);
                //do something
                layer.open({
                    //layer提供了5种层类型。可传入的值有：0（信息框，默认）1（页面层）2（iframe层）3（加载层）4（tips层）。
                    type: 1,
                    title:"添加用户",
                    content:$("#updateUserDialog"),
                    area:['50%','80%'],
                    success:function(){
                        form.render('radio');
                    }

                });
                //数据回显
                form.val('updateUserForm',{
                    //form控件字段的name属性
                    id:data.id,
                    userName:data.userName,
                    name:data.name,
                    sex:$("input[name='sex'][value='0']").attr("checked", data.sex == 0 ? true : false),
                    sex:$("input[name='sex'][value='1']").attr("checked", data.sex == 1 ? true : false),
                    age:data.age,
                    note:data.note
                })
                try {
                    laydate.render({
                        elem: '#birthday2',
                        value: new Date(d) //参数即为：2018-07-20 00:00:00 的时间戳
                    });
                    //form.render('radio');
                } catch(e) {
                    $("#birthday2").val(d); //开始时间
                }

                form.on('submit(update_user)',function (data) {
                    //console.log(data.elem) //被执行事件的元素DOM对象，一般为button对象
                    //console.log(data.form) //被执行提交的form对象，一般在存在form标签时才会返回
                    //console.log(data.field) //当前容器的全部表单字段，名值对形式：{name: value}
                    $.post('/rest/user/update',data.field,function (msg) {
                        console.log(msg);
                        layer.closeAll();//关闭层
                        table.reload('user',{});
                    })

                    return false; //阻止表单跳转。如果需要表单跳转，去掉这段即可。
                })
                //同步更新缓存对应的值
               /* obj.update({
                    name: '123'
                    ,userName: 'xxx'
                });*/
            }
        });
        $("#addUser").click(function () {
            layer.open({
                //layer提供了5种层类型。可传入的值有：0（信息框，默认）1（页面层）2（iframe层）3（加载层）4（tips层）。
                type: 1,
                title:"添加用户",
                content:$("#addUserDialog"),
                area:['50%','80%'],
                success:function(){
                    laydate.render({
                        elem:'#birthday',
                        value:'2000-1-1'
                    })
                }
            });
            form.on('submit(add_user)',function (data) {
                //console.log(data.elem) //被执行事件的元素DOM对象，一般为button对象
                //console.log(data.form) //被执行提交的form对象，一般在存在form标签时才会返回
                //console.log(data.field) //当前容器的全部表单字段，名值对形式：{name: value}
                $.post('/rest/user/add',data.field,function (msg) {
                    console.log(msg);
                    layer.closeAll();//关闭层
                    table.reload('user',{});
                })

                return false; //阻止表单跳转。如果需要表单跳转，去掉这段即可。
            })
        });

    });
</script>
</body>
</html>
