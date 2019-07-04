<%--
  Created by IntelliJ IDEA.
  User: ChenLei
  Date: 2019/7/2
  Time: 18:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE>
<html>
<head>
    <title>投票列表</title>
    <meta charset="utf-8">
    <link rel="stylesheet" type="text/css" href="css/head.css">
    <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
    <script type="text/javascript" src="lib/jquery/1.9.1/jquery.min.js"></script>
    <style>

        body{
            background-color: #e2d8cf;
        }
        /* 添加弹窗 */
        .modal-header{
            font-weight: 500;
            font-size: 20px;
            padding: 15px 15px 0 15px;
            border:none;
        }

        .modal-body{
            font-size: 18px;
        }

        .modal-header button:focus{
            outline: none;
        }

        .modal-dialog{
            min-width: 870px;
        }

        .modal-right h3{
            margin-top: 0;
            font-size: 16px;
            font-weight: 500;
            color: #444444;
        }

        .cl{
            margin-bottom: 20px;
        }

        .cl input{
            width: 100%;
            border-radius: 1px;
        }

        .cl a{
            cursor: pointer;
            text-decoration: none;
        }

        .cl span{
            cursor: pointer;
            color: rgba(11, 40, 236, 0.79);
            font-weight: bold;
        }

        .cl span:hover{
            color: red;
            font-size: 17px;
        }

        .titleList li a{
            cursor: pointer;
            text-decoration: none;
        }


        .titleList li a:hover{
            color: red;
            font-size: 17px;
        }

        .cl1{
            width: 79%;
        }

        label{
            margin-top: 0;
            font-size: 16px;
            font-weight: 600;
            color: #444444;
        }

        .titleList>li>label{
            margin-left: -39px;
        }

        .btn{
            margin-top: 20px;
        }
    </style>
</head>
<body>
<header id="header">
    <div class="center">
        <h1 class="logo"></h1>
        <nav class="link">
            <ul>
                <li class="active"><a href="index.html">首页</a></li>
                <li><a href="information.html">发起投票</a></li>
                <li><a href="ticket.html">我的投票</a></li>
                <li><a href="scenery.html">个人中心</a></li>
                <li><a href="about.html">系统简介</a></li>
            </ul>
        </nav>
    </div>
</header>

<div class="table1">
    <div class="addClick">发起投票</div>
    <table>
        <caption style="text-align: center"><h1>投票列表显示</h1> <hr></caption>

        <tr>
            <th>序号</th>
            <th>投票名称</th>
            <th>类别</th>
            <th colspan="2">操作</th>
        </tr>
        <c:forEach items="${subjectList}" var="s">
            <tr>
                <td>${s.id}</td>
                <td>${s.title}</td>
                <c:choose>
                    <c:when test="${s.type==1}">
                        <td>单选</td>
                    </c:when>
                    <c:otherwise>
                        <td>多选</td>
                    </c:otherwise>
                </c:choose>
                <td>查看</td>
                <td>参与</td>
            </tr>
        </c:forEach>
        <tr>
            <td colspan="5" style="font-size: 18px">
                <c:choose>
                    <c:when test="${currentPage!=1}">
                        <a href="showOption?page=${currentPage-1}">上一页</a>
                    </c:when>
                    <c:otherwise>
                        上一页
                    </c:otherwise>
                </c:choose>
                共<span style="color: red;font-size: 19px">${totalPage}</span>页&nbsp;共<span style="color: red;font-size: 19px">${total}</span>有条记录&nbsp;当前是第<span style="color: red;font-size: 19px">${currentPage}</span>页&nbsp;
                <c:choose>
                    <c:when test="${currentPage != totalPage }">
                        <a href="showOption?page=${currentPage+1}">下一页</a>
                    </c:when>
                    <c:otherwise>
                        下一页
                    </c:otherwise>
                </c:choose>
            </td>
        </tr>
    </table>
</div>
<div class="modal fade" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <span>添加投票</span>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            </div>
            <div class="modal-body">
                <div class="container-box">
                    <div class="row">
                        <div class="col-md-7 box">
                            <form action="addSubject" method="post">
                                <div class="modal-right">
                                    <label class="col-md-3">投票标题：</label>
                                    <div class="col-md-8 cl">
                                        <input type="text" name="subjectTitle" style="width: 100%" placeholder="请输入投票标题">
                                    </div>
                                </div>
                                <div class="modal-right">
                                    <label class="col-md-3">投票选项：</label>
                                    <div class="col-md-8 cl">
                                        <input type="text" name="option" style="width: 100%" placeholder="请输入选项名称">
                                    </div>
                                </div>
                                <ul class="titleList">
                                    <li class="col-md-12">
                                        <label class="col-md-3"><a href="#" title="删除选项" class="removeTitle">x</a></label>
                                        <div class="col-md-8 cl cl1">
                                            <input type="text" name="option" style="width: 100%" placeholder="请输入选项名称">
                                        </div>
                                    </li>
                                    <li class="col-md-12">
                                        <label class="col-md-3"><a href="#" title="删除选项" class="removeTitle">x</a></label>
                                        <div class="col-md-8 cl cl1">
                                            <input type="text" name="option" style="width: 100%" placeholder="请输入选项名称">
                                        </div>
                                    </li>
                                </ul>
                                <div class="modal-right">
                                    <label class="col-md-3">&nbsp;&nbsp;&nbsp;&nbsp;</label>
                                    <div class="col-md-8 cl">
                                        <span class="add-title">+添加选项</span>
                                    </div>
                                </div>

                                <div class="model-right">
                                    <label class="col-md-3">投票类型：</label>
                                    <div class="col-md-8">
                                        <input type="radio" name="type" value="1">单选 &nbsp;&nbsp;&nbsp;<input type="radio" name="type" value="2">多选
                                    </div>
                                </div>
                                <div class="col-lg-4">
                                    <button class="btn" type="submit">确认添加</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div><!-- /.modal-content -->
</div><!-- /.modal-dialog -->
</div>
</body>
<script src="lib/bootstrap.min.js"></script>
<script>
    $('.addClick').click(function () {
        $('.modal').modal("show");
    });

    $('.add-title').click(function () {
        $('.titleList').append(' <li class="col-md-12">\n' +
            '                                        <label class="col-md-3"><a href="#" title="删除选项" class="removeTitle">x</a> </label>\n' +
            '                                        <div class="col-md-8 cl cl1">\n' +
            '                                            <input type="text" name="option" style="width: 100%" placeholder="请输入选项名称">\n' +
            '                                        </div>\n' +
            '                                    </li>');

        $.each($('.removeTitle'),function(index,item){
            $(item).unbind('click');
            $(item).click(function(){
                $(this).parent().parent().remove();
            });

        });
    });
</script>
</html>
