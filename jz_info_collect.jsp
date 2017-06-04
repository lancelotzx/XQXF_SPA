<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix='c' uri="http://java.sun.com/jstl/core_rt"%>
<jsp:useBean id="community" scope="page" class="com.whxf.beans.CellBean"/>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
<meta name="description" content="武汉市消防局—小区消防信息采集系统" />
<meta name="author" content="Lancelot" />
<title>建筑信息检查</title>
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




</head>
<body >
	<%
		//String tempCellJsonString = request.getAttribute("cellBean").toString();		
	%>
	<script>
		//这里类似xq_info_collect.jsp。变量名称待定
 		$().ready(function (){
 			$("#xiaofangDevice").select2();
 			
 			//TODO：所属社区community是下拉框，这里还没有实现
 			

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
			<div  sytle="color:#fff" class="col-xs-6 col-sm-3"><h3>居民信息检查-建筑检查</h3></div>
		</div>
		<div class="navbar-collapse collapse move-me">
			<ul class="nav navbar-nav navbar-right">
				<li ><a href=""><h3>检查该小区建筑填写情况</h3></a></li>
			</ul>
		</div>
	   
	</div>
</div>
  <!--NAVBAR SECTION END-->
   



 
<div id="contact-sec"   >
	   <div class="overlay">
<div class="container set-pad">
  <div class="row text-center">
			 <div class="col-lg-8 col-lg-offset-2 col-md-8 col-sm-8 col-md-offset-2 col-sm-offset-2">
				 <h2 id="buildnametitle" data-scroll-reveal="enter from the bottom after 0.1s" class="header-line" >
				 	<!--TODO：use jquery add content:buildName建筑地址X+第Y门栋号-->				 
				 </h2>
				 <h4 data-scroll-reveal="enter from the bottom after 0.3s">
				  请填写以下每项内容，填写内容对应该小区单独建筑，请按提示进行。
				  带*号的为必填项。
				 </h4>
			 </div>
		 </div>
		 <!--/.HEADER LINE END-->
	  
	   <div class="row set-row-pad"  data-scroll-reveal="enter from the bottom after 0.5s" >

	   	<div class="col-lg-4 col-md-4 col-sm-4 col-lg-offset-1 col-md-offset-1 col-sm-offset-1">
			   <div class="panel-group" id="accordion">
					<div class="alert alert-info" data-scroll-reveal="enter from the bottom after 0.5s">
						<div  class="panel-heading" >
							<h4 class="panel-title">
								<a id="buildname" data-toggle="collapse" data-parent="#accordion" href="#collapse1" class="collapsed">
									<!--use jquery add content:buildName建筑名称列表，-->

								</a>
							</h4>
						</div>
						<div id="collapse1" class="panel-collapse collapse" style="height: 0px;">
							<div class="panel-body">
								<p>1</p>
								<p>2</p>
								<p>3</p>
							</div>
						</div>
					</div>	
				</div>
	   	</div>
		 
			 
			 
		   </div>
	   
		   
			 <div class="col-lg-8 col-lg-offset-2 col-md-8 col-md-offset-2 col-sm-8 col-sm-offset-2">
				<form 	role = "form" id="zj_info_collect_form" name="zjform" action="test.jsp" method="post">
					<!--TODO 这里的变量需要修改-->
					<input id="buildingName" name="buildingName" type="hidden" value=""/>
					<!--TODO END-->
					
					<div class="form-group input-group">
						<label for="sstd">
							<h4><span style="color:red">*</span>疏散通道(个):（必填）</h4>
						</label>			
						<input type="number" id="leaveRoad" name="leaveRoad" class="form-control "
						 required="required" />
					</div>
					<div class="form-group input-group">
						<label for="aqck">
							<h4><span style="color:red">*</span>安全出口(个):（必填）</h4>
						</label>
						<input type="number" id="safeLeaveRoad" name="safeLeaveRoad" 
						class="form-control " required="required" />
					</div>
					
					<div class="form-group input-group">
						<label for="djlrrs">
							<h4><span style="color:red">*</span>独居老人人数:(必填)</h4>
						</label>				
						<input type="number" id="singleOldPersonCount" name="singleOldPersonCount" 
						class="form-control " required="required" />
					</div>
					<div class="form-group input-group">
						<label for="dlsgytcq"><h4>独立式感烟探测器(个):（必填）</h4></label>				
						<input type="number" id="monitorSmokingDeviceCount" name="monitorSmokingDeviceCount" class="form-control " required="required" />
					</div>
					<div class="form-group input-group">
						<label for="xiaofangdevice_yn">
							<h4><span style="color:red">*</span>建筑消防设施:（必选、多选）</h4>
						</label>
						<div class="form-group input-group">
						    <select id="xiaofangDevice" name="xiaofangDevice" class="form-control" multiple="multiple" required="required">
									<option value="室内消火栓系统">室内消火栓系统</option>
									<option value="自动灭火系统">自动灭火系统</option>
									<option value="火灾自动报警系统">火灾自动报警系统</option>
									<option value="防烟和排烟设施">防烟和排烟设施</option>
									<option value="消防应急照明">消防应急照明</option>
									<option value="疏散指示标志">疏散指示标志</option>
									<option value="消防电梯">消防电梯</option>
									<option value="灭火器">灭火器</option>
									<option value="其他">其他</option>

						    </select>
		  				     	
						</div>

					</div>
					<div class="form-group input-group">

					<label for="xfd_other"><h4>其他:（选填）</h4></label>				
						<input type="text" id="xiaofangDevice_other" name="xiaofangDevice_other" class="form-control " placeholder="选填，当选择了消防设施的其他项后填写" />
					</div>
					<div class="form-group input-group">
						<label for="ddc_yn">
							<h4><span style="color:red">*</span>电动车集中存放:(必选)</h4>
						</label>
						<div class="form-group input-group">
						    <select id="autoMobile" name="autoMobile" class="form-control" required="
						    required">
						    		<option value="" selected="true" disabled="true">请选择
									</option>
									<option value="集中存放，并有充电装置">集中存放，并有充电装置</option>
									<option value="集中存放，无充电装置"> 集中存放，无充电装置</option>
									<option value="无集中存放点">无集中存放点</option>
						    </select>		  				     	
						</div>
					</div>
					
					<div class="form-group">
						<button type="submit" class="btn btn-info btn-block btn-lg">数据提交</button>
					</div>

				</form>
			</div>

			   
 
		  
		  
			
		   </div>
			</div>
	  </div> 
   </div>
 <div class="container">
		 <div class="row set-row-pad" >
<div class="col-lg-4 col-md-4 col-sm-4   col-lg-offset-1 col-md-offset-1 col-sm-offset-1 " data-scroll-reveal="enter from the bottom after 0.4s">

	<hr />
				
</div>
<div class="col-lg-4 col-md-4 col-sm-4   col-lg-offset-1 col-md-offset-1 col-sm-offset-1" data-scroll-reveal="enter from the bottom after 0.4s">

	<hr />
</div>


</div>
</div>
			 
 <!-- CONTACT SECTION END-->
 
<div id="footer">
	  Copyright &copy; 2017.Lancelot All rights reserved.
</div>
 <!-- FOOTER SECTION END-->

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
