<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>超市信息管理系统</title>

<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/datepicker3.css" rel="stylesheet">
<link href="css/styles.css" rel="stylesheet">

<!--[if lt IE 9]>
<script src="js/html5shiv.js"></script>
<script src="js/respond.min.js"></script>
<![endif]-->
<script type="text/javascript">
var managerList="";
function init(){
	$.ajax({
		url : "queryBooks",
		type : "POST",
		success : function(data) {
			if (data.code == 200) {
				var size = data.size;
				for(var i=0;i<size;i++){
					var obj = data.list[i];
					managerList+="<tr><td>"+obj.id+"</td><td>"+obj.bookName+"</td><td>"+obj.price+"</td><td>"+obj.auth+"</td><td>"+obj.grade+"</td><td><a href='delBook?bid="+obj.id+"'>删除</a>|<a href='bookUpdate.jsp?bid="+obj.id+"&bookName="+obj.bookName+"&price="+obj.price+"&auth="+obj.auth+"&grade="+obj.grade+"'>修改</a></td></tr>";
				}
			}
			$("#managerList").append(managerList);
		},
		dataType : "json"
	});
}
</script>
</head>

<body onload="init()">
	<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#sidebar-collapse">
					<span class="sr-only">Toggle navigation</span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="#"><span>Lumino</span>Admin</a>
				<ul class="user-menu">
					<li class="dropdown pull-right">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown"><span class="glyphicon glyphicon-user"></span> User <span class="caret"></span></a>
						<ul class="dropdown-menu" role="menu">
							<li><a href="#"><span class="glyphicon glyphicon-user"></span> Profile</a></li>
							<li><a href="#"><span class="glyphicon glyphicon-cog"></span> Settings</a></li>
							<li><a href="#"><span class="glyphicon glyphicon-log-out"></span> Logout</a></li>
						</ul>
					</li>
				</ul>
			</div>
		</div><!-- /.container-fluid -->
	</nav>
		
	<div id="sidebar-collapse" class="col-sm-3 col-lg-2 sidebar">
		<form role="search">
			<div class="form-group">
				<input type="text" class="form-control" placeholder="Search">
			</div>
		</form>
		<ul class="nav menu">
			<li><a href="index.jsp"><span class="glyphicon glyphicon-dashboard"></span>商品管理</a></li>
			<li><a href="salesIndex.jsp"><span class="glyphicon glyphicon-th"></span> 销售查询</a></li>
			<li><a href="stockIndex.jsp"><span class="glyphicon glyphicon-stats"></span> 进货查询</a></li>
			<li class="active"><a href="stockadd.jsp"><span class="glyphicon glyphicon-stats"></span> 进货录入</a></li>
			<li><a href="user.jsp"><span class="glyphicon glyphicon-dashboard"></span>用户管理</a></li>
		</ul>
	</div><!--/.sidebar-->
		
	<div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">			
		<div class="row">
			<ol class="breadcrumb">
				<li><a href="#"><span class="glyphicon glyphicon-home"></span></a></li>
				<li class="active">进货录入</li>
			</ol>
		</div><!--/.row-->
		
		<div class="row">
			<div class="col-lg-12">
				<h3 class="page-header">进货录入</h3>
			</div>
		</div><!--/.row-->
		
        <div class="row">
			<form class="form-horizontal" role="form" method="post" action="addStock">
			  <div class="form-group">
			    <label for="firstname" class="col-sm-2 control-label">商品名称:</label>
			    <div class="col-sm-10">
			      <select name="fName" id="fName" class="form-control">
			      	<option value="food1">food1</option>
			      	<option value="food1">food2</option>
			      </select>
			    </div>
			  </div>
			  <div class="form-group">
			    <label for="firstname" class="col-sm-2 control-label">数目:</label>
			    <div class="col-sm-10">
			      <input type="text" class="form-control" id="num" name="num">
			    </div>
			  </div>
			  <div class="form-group">
			    <div class="col-sm-offset-2 col-sm-10">
			      <button type="submit" class="btn btn-default">完成录入</button>
			    </div>
			  </div>
			</form>
        </div>
        
     </div>  

	<script src="js/jquery-1.11.1.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<!-- <script src="js/chart.min.js"></script>
	<script src="js/chart-data.js"></script>
	<script src="js/easypiechart.js"></script>
	<script src="js/easypiechart-data.js"></script>
	<script src="js/bootstrap-datepicker.js"></script> -->
	<script>
		/* $('#calendar').datepicker({
		}); */

		!function ($) {
		    $(document).on("click","ul.nav li.parent > a > span.icon", function(){          
		        $(this).find('em:first').toggleClass("glyphicon-minus");      
		    }); 
		    $(".sidebar span.icon").find('em:first').addClass("glyphicon-plus");
		}(window.jQuery);

		$(window).on('resize', function () {
		  if ($(window).width() > 768) $('#sidebar-collapse').collapse('show')
		})
		$(window).on('resize', function () {
		  if ($(window).width() <= 767) $('#sidebar-collapse').collapse('hide')
		})
	</script>	
</body>

</html>
