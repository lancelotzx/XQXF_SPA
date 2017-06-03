﻿<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix='c' uri="http://java.sun.com/jstl/core_rt"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
<meta name="description" content="武汉市消防局—小区消防信息采集系统" />
<meta name="author" content="Lancelot" />
<title>居民信息检查</title>
<!-- BOOTSTRAP CORE STYLE CSS -->
<link href="assets/css/bootstrap.css" rel="stylesheet" />
<!-- FONT AWESOME CSS -->
<link href="assets/css/font-awesome.min.css" rel="stylesheet" />
 <!-- FLEXSLIDER CSS -->
<link href="assets/css/flexslider.css" rel="stylesheet" />
<!-- CUSTOM STYLE CSS -->
<link href="assets/css/style.css" rel="stylesheet" />    
<!-- Google	Fonts -->
<link href='http://fonts.googleapis.com/css?family=Open+Sans:400,700,300' rel='stylesheet' type='text/css' />

<script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
<script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link href="http://cdn.bootcss.com/select2/4.0.3/css/select2.min.css" rel="stylesheet" type='
text/css' />
<script src="http://cdn.bootcss.com/select2/4.0.3/js/select2.min.js"></script>

<!-- Baidu MAP JS API -->
<script src="http://api.map.baidu.com/getscript?v=2.0&ak=jnu9Z2xhGz7C22mOt1VfIzmY4amPh2No&services=&t=20170517145936"></script>


</head>
<body >
	<%
		String tempCellString = request.getAttribute("cellList").toString().trim();
		//out.println("AAA"+tempCellString); 
		//String[] pageCellList = tempCellString.split(","); 

	%>
	<script>
 		$(document).ready(function (){
 			$('sel_menu').select2();
 			
 	})
	</script>

<div class="navbar navbar-inverse navbar-fixed-top " id="menu">
	<div class="container">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
			</button>
			<div  sytle="color:#fff" class="col-xs-6 col-sm-3"><h3>居民信息检查</h3></div>
		</div>
		<div class="navbar-collapse collapse move-me">
        <form role="form" id="naviform" name="naviform">
			<ul class="nav navbar-nav navbar-right">
				<li ><a href=""><h3>填写检查</h3></a></li>
			</ul>
        </form>
		</div>
	   
	</div>
</div>

  <!--NAVBAR SECTION END-->
<div class="home-sec" id="home" >
<div class="overlay">
<div class="container">
	   <div class="row text-center " >
	   
		   <div class="col-lg-12  col-md-12 col-sm-12">
		   
			<div class="flexslider set-flexi" id="main-section" >
				<ul class="slides move-me">
					<!-- Slider 01 -->
					<li>
						<h3>您的单位是：</h3>
					    <h3>%派出所名称%</h3>
						<a  href="#features-sec" class="btn btn-info btn-lg" >
							填写开始 
						</a>
						
					</li>
				</ul>
			</div>
		</div>			
	</div>
</div>
</div>	   
</div>
   <!--HOME SECTION END-->   
<div  class="tag-line" >
	 <div class="container">
	   <div class="row  text-center" >
	   
		   <div class="col-lg-12  col-md-12 col-sm-12">
		   
	<h2 data-scroll-reveal="enter from the bottom after 0.1s" ><i class="fa fa-circle-o-notch"></i> 请按提示提交当前位置  <i class="fa fa-circle-o-notch"></i> </h2>
			   </div>
		   </div>
		 </div>
	
</div>
<!--HOME SECTION TAG LINE END-->   
	 <div id="features-sec" class="container set-pad" >
     <form role="form" id="locateform" name="locateform" action="test.jsp">
		 <div class="row text-center">
			 <div class="col-lg-8 col-lg-offset-2 col-md-8 col-sm-8 col-md-offset-2 col-sm-offset-2">
				<h1 data-scroll-reveal="enter from the bottom after 0.2s"  class="header-line">当前位置提交
				</h1>
				<p data-scroll-reveal="enter from the bottom after 0.3s" >
				  	<h4>本系统需要您当前的定位信息，请首先选择您当前所检查的小区名称 ：</h4>
				</p>

					<div class="form-group">
					<select id="xqmc" name="xqmc" class="form-control">
					<c:forEach items="${cellList}" var="cellname">
					<option value="${cellname}" ><h4> ${cellname} </h4></option>
					</c:forEach>
					</select>
					</div>
			 </div>

		 </div>
		 <!--/.HEADER LINE END-->


	   <div class="row" >
	   
		   
			 <div class="col-lg-4  col-md-4 col-sm-4" data-scroll-reveal="enter from the bottom after 0.4s">
				<div class="about-div">
				<i class="fa fa-paper-plane-o fa-2x" >提交当前位置</i>
			 	<hr />
				<hr />
			   <p >
				   当提示是否允许手机定位权限时，请选择“是”。
				   请您务必处于所选择小区附近进行定位。
				   此定位只做参考，您也可以随后更新此信息。
			   </p>
			   
			<input type="hidden" id="latd" name="latd" value="" />
			<input type="hidden" id="lng"  name="lng"  value="" />

		   	<button type="button" id="GPSshow" class="btn btn-info  btn-lg" data-toggle="modal"
		   	 data-target="#myModal" >定位提交</button>
            <!-- 模态框（Modal） -->
			<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			    <div class="modal-dialog">
			        <div class="modal-content">
			            <div class="modal-header">
			                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
			                <h4 class="modal-title" id="myModalLabel">定位信息已提交</h4>
			            </div>
			            <div class="modal-body">
			           		 点击任意背景位置继续。
			            </div>
			            <div class="modal-footer">
			                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
			            </div>
			        </div><!-- /.modal-content -->
			    </div><!-- /.modal -->
			</div>
            <script>
	            
            	//var myPos ;
            	//myPos = GetMyPos();
            	//myPos = eval("("+myPos+")");
            	//console.log(myPos);
				//$("#GPSshow").popover({time:500});
				//$("#GPSshow").on('show.bs.popover', GetMyPos());
			//lng = 0 ;
			//lat = 0 ;

			// 百度地图API功能
			//var map = new BMap.Map("allmap");
			//var point = new BMap.Point(116.331398,39.897445);
			//map.centerAndZoom(point,12);
					var geolocation = new BMap.Geolocation();
					var result;
					geolocation.getCurrentPosition(function(r){
						if(this.getStatus() == BMAP_STATUS_SUCCESS){
							//var mk = new BMap.Marker(r.point);
							//map.addOverlay(mk);
							//map.panTo(r.point);
							//alert('您的位置：'+r.point.lng+','+r.point.lat);
							//window.lng = r.point.lng;
							//window.lat = r.point.lat;
							console.log("aaa" + r.point.lng + " bbb" + r.point.lat);
							result = "您当前的坐标为"+r.point.lng+","+r.point.lat;
							$("#latd").val(r.point.lat);
							$("#lng").val(r.point.lng);
						    

							//console.log(result);
							return result;

						}
						else {
							//alert('failed'+this.getStatus());
							result = "暂时无法获取坐标";
							return result;
						} 
						/*
						$.ajax({
								 type: "POST",
								 url:"test.html",
								 data:$('#locateform').serialize(),// 要提交的表单 
								 success: function(msg) {alert(msg);}
						});
						*/       
					},{enableHighAccuracy: true});

					$(function () { 
 						$('#myModal').on('hide.bs.modal', function () {
      						$('#locateform').submit();
  						})
   					});

				//关于状态码
				//BMAP_STATUS_SUCCESS	检索成功。对应数值“0”。
				//BMAP_STATUS_CITY_LIST	城市列表。对应数值“1”。
				//BMAP_STATUS_UNKNOWN_LOCATION	位置结果未知。对应数值“2”。
				//BMAP_STATUS_UNKNOWN_ROUTE	导航结果未知。对应数值“3”。
				//BMAP_STATUS_INVALID_KEY	非法密钥。对应数值“4”。
				//BMAP_STATUS_INVALID_REQUEST	非法请求。对应数值“5”。
				//BMAP_STATUS_PERMISSION_DENIED	没有权限。对应数值“6”。(自 1.1 新增)
				//BMAP_STATUS_SERVICE_UNAVAILABLE	服务不可用。对应数值“7”。(自 1.1 新增)
				//BMAP_STATUS_TIMEOUT	超时。对应数值“8”。(自 1.1 新增)
			</script>
			</div>
		</div>			 
	</div>
    </form>
</div>
<!-- FEATURES SECTION END-->

 
			 

<!--  Jquery Core Script -->
<!--script src="assets/js/jquery-1.10.2.js"></script>
<!--  Core Bootstrap Script -->
<!--script src="assets/js/bootstrap.js"></script>
<!--  Flexslider Scripts --> 
<script src="assets/js/jquery.flexslider.js"></script>
<!--  Scrolling Reveal Script -->
<script src="assets/js/scrollReveal.js"></script>
<!--  Scroll Scripts --> 
<script src="assets/js/jquery.easing.min.js"></script>
<!--  Custom Scripts --> 
<script src="assets/js/custom.js"></script>
</body>
</html>
