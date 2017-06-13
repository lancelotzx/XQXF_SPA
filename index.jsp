<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix='c' uri="http://java.sun.com/jstl/core_rt"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
<meta name="description" content="武汉市消防局—小区消防信息采集系统" />
<meta name="author" content="Lancelot" />
<title>武汉消防</title>
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

<style>
<style> 
.div-a{ float:left;display:table-cell;vertical-align: middle; width: 52%} 
.div-b{ float:left;display:table-cell;vertical-align: middle; width: 48%} 

.title {
    text-align: center;
}

.f700 {
    font-weight: 700;
    font-size: 1.2rem;
    color: #2f9dce;
}
body{
    font-size: 18px;
}
</style>


</head>
<body >
	<%
		String tempCellString = "";
		if(null != request.getAttribute("cellList"))
			tempCellString = request.getAttribute("cellList").toString().trim();

		String tempPcsName  = "";
		if(null != request.getAttribute("pcsname"))
			tempPcsName = request.getAttribute("pcsname").toString();
	%>




<div class="navbar navbar-inverse navbar-fixed-top col-xs-12" id="menu">
	<div class="container">


		<div class="navbar-header">
			<div class="col-xs-1" style="margin-top:13px">
				<i onclick="javascript:window.location.href=
				'http://xf.91yunpan.com/weixin/portal/index'" class="icon-angle-left icon-3x"></i>
			</div>
			
			<div class="col-xs-10" sytle="color:#fff"><h3 class="title">居民小区消防检查</h3></div>
		</div>
	   
	</div>
</div>


  <!--NAVBAR SECTION END-->
<div class="" id="home" >
<div class="overlay">
<div class="container">
	   <div class="row text-center " >
	   
		   <div class="col-lg-12  col-md-12 col-sm-12">
		   
			<div class="flexslider set-flexi" id="main-section" >
				<ul class="slides move-me">
					<!-- Slider 01 -->
					<li>
						<h3>您的单位是：</h3>
					    <h3><%=tempPcsName%></h3>
						
						<form role="form" id="locateform" name="locateform" action="GetCellAction" method="post">						

						   <div class="row" >
						   
							   
								 <div class="col-lg-12  col-md-12 col-sm-12" data-scroll-reveal="enter from the bottom after 0.4s">
								 	
									<div class="about-div">
										<p>
									      请下拉选择检查的居民小区。
								   		</p>
										<div class="form-group">
											<select id="xqmc" name="xqmc" class="form-control" style="font-size:18px" required="required">
											<option value="" selected="true" disabled="true">请选择
											</option>
											<c:forEach items="${cellList}" var="cellname">
											<option value=${cellname} ><h4> ${cellname} </h4></option>
											</c:forEach>
											</select>
										</div>
									</div>
								 	<hr />
									<hr />
								   <p >
									   当提示是否允许手机定位权限时，请选择“是”。
								   </p>
								   
								<input type="hidden" id="latd" name="latd" value="-1" />
								<input type="hidden" id="lng"  name="lng"  value="-1" />
								
							   	<button type="submit" id="GPSshow" class="btn btn-info btn-block btn-lg" style="background-color:#2f9dce" >
							   	开始填写</button>
								
					            <script>
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
									},{enableHighAccuracy: true});

									$(function () { 
				 						$('#GPSshow1').on('click', function () {
				      							$('#locateform').submit();
				  						})
				   					});
								</script>
								</div>
							</div>			 
						</div>
					    </form>						
					</li>
				</ul>
			</div>
		</div>			
	</div>
</div>
</div>	   
</div>
  
 
			 

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
