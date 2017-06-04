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
<title>小区信息检查</title>
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
		String tempCellJsonString = request.getAttribute("cellBean").toString();		
	%>
	<script>
 		$().ready(function (){
 			$("#sel_menu").select2();
 			var celljsonarr = eval(<%=tempCellJsonString%>);
 			for(var i in celljsonarr){
 				console.log("item="+i+"value="+celljsonarr[i]);
 				var obj=$('#'+i);
 				obj.val(celljsonarr[i]);
 			}
 			//所属社区是下拉框，只能通过jstl来遍历，无法通过jquery来批量赋值
 			

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
			<ul class="nav navbar-nav navbar-right">
				<li ><a href="#checkitems"><h3>填写检查</h3></a></li>
				<li ><a href="#checkitems"><h3>进入小区列表</h3></a></li>

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
				 <h1 data-scroll-reveal="enter from the bottom after 0.1s" class="header-line" >
				 	小区名称</h1>
				 <h4 data-scroll-reveal="enter from the bottom after 0.3s">
				  请填写以下每项内容，填写内容按提示进行。
				 </h4>
			 </div>

		 </div>
		 <!--/.HEADER LINE END-->
	  
	   <div class="row set-row-pad"  data-scroll-reveal="enter from the bottom after 0.5s" >

	   	<div class="col-lg-4 col-md-4 col-sm-4 col-lg-offset-1 col-md-offset-1 col-sm-offset-1">
			   <div class="panel-group" id="accordion">
					<div class="alert alert-info" data-scroll-reveal="enter from the bottom after 0.5s">
						<div id="cellName" class="panel-heading" >
							<h4 class="panel-title">
								<a data-toggle="collapse" data-parent="#accordion" href="#collapse1" class="collapsed">
							    <> 点击查看<%//=小区名称%>楼栋详情。</strong>  
								</a>
							</h4>
						</div>
						<div id="collapse1" class="panel-collapse collapse" style="height: 0px;">
							<div class="panel-body">
								<c:forEach items="${buildList}" var="buildingname">
								<p> ${buildingname}</p>
								</c:forEach>
							</div>
						</div>
					</div>	
				</div>
	   </div>
		 
			 
			 
		   </div>
	   
		   
			 <div class="col-lg-8 col-lg-offset-2 col-md-8 col-md-offset-2 col-sm-8 col-sm-offset-2">
				<form 	role = "form">
					<div class="form-group ">
						<label for="xqdz"><h4>小区地址:</h4></label>
						<input type="text" id="cellAddr" name="cellAddr" class="form-control"  required="required" placeholder="请核对并填写小区所在地址" />
					</div>
					<div class="form-group ">
						<label for="sssq"><h4>所属社区:</h4></label>
						<input type="text" id="community" name="community" class="form-control"  required="required" placeholder="请核对并填写小区所属社区名" />
					</div>
					<div class="form-group input-group-lg">
						<label for="sqxfaqzzr"><h4>社区消防安全责任人:</h4></label>
						<input type="text" id="sqxfaqzzr" name="sqxfaqzzr" class="form-control " required="required"  placeholder="请填写社区消防安全责任人姓名" />
					</div>
					<div class="form-group input-group-lg">
						<label for="sqxfaqglr"><h4>社区消防安全管理人:</h4></label>
						<input type="text" id="sqxfaqglr" name="sqxfaqglr" class="form-control " required="required"  placeholder="请填写社区消防安全管理人姓名" />
					</div>
					<div class="form-group input-group-lg">
						<label for="jzslless9"><h4>建筑数量(9层及以下):</h4></label>				
						<input type="text" id="jzslless9" name="jzslless9" class="form-control " required="required"  placeholder="小区内9层及以下的建筑总数" />
					</div>
					<div class="form-group input-group-lg">
						<label for="jzsl10to33"><h4>建筑数量(10到33层):</h4></label>				
						<input type="text" id="jzsl10to33" name="jzsl10to33" class="form-control " required="required"  placeholder="小区内10到33层的建筑总数" />
					</div>
					<div class="form-group input-group-lg">
						<label for="jzsl33more"><h4>建筑数量(33层以上):</h4></label>				
						<input type="text" id="jzsl33more" name="jzsl33more" class="form-control " required="required"  placeholder="小区内33层以上的建筑总数" />
					</div>
					<div class="form-group input-group-lg">
						<label for="xfkzs_yn"><h4>是否有消防控制室:</h4></label>
						<div class="form-group input-group-lg">
						    <select id="xfkzs_yn" name="xfkzs_yn" class="form-control" required="required">
						    		<option value="" selected="true" disabled="true">请选择
									</option>
									<option value="1">有</option>
									<option value="0">无</option>
						    </select>		  				     	
						</div>
					</div>
					<div class="form-group input-group-lg">
						<label for="wxxfz_yn"><h4>是否有微型消防站:</h4></label>
						<div class="form-group input-group-lg">
						    <select id="wxxfz_yn" name="wxxfz_yn" class="form-control" required="required">
						    		<option value="" selected="true" disabled="true">请选择
									</option>
									<option value="1">有</option>
									<option value="0">无</option>
						    </select>		  				     	
						</div>
					</div>
					<div class="form-group input-group-lg">
						<label for="xfcd_yn"><h4>是否有消防车道:</h4></label>
						<div class="form-group input-group-lg">
						    <select id="xfcd_yn" name="xfcd_yn" class="form-control" required="
						    required">
						    		<option value="" selected="true" disabled="true">请选择
									</option>
									<option value="1">有</option>
									<option value="0">无</option>
						    </select>		  				     	
						</div>
					</div>
					<div class="form-group input-group-lg">
						<label for="sstd"><h4>疏散通道(个):</h4></label>				
						<input type="text" id="sstd" name="sstd" class="form-control " required="required"  placeholder="请填写疏散通道个数" />
					</div>
					<div class="form-group input-group-lg">
						<label for="aqck"><h4>安全出口(个):</h4></label>				
						<input type="text" id="aqck" name="aqck" class="form-control " required="required"  placeholder="请填写安全出口个数" />
					</div>
					<div class="form-group input-group-lg">
						<label for="syczqk_yn"><h4>商业出租情况:</h4></label>
						<div class="form-group input-group-lg">
						    <select id="syczqk_yn" name="syczqk_yn" class="form-control" required="
						    required">
						    		<option value="" selected="true" disabled="true">请选择
									</option>
									<option value="1">有</option>
									<option value="0">无</option>
						    </select>		  				     	
						</div>
					</div>
					<div class="form-group input-group-lg">
						<label for="djlrrs"><h4>独居老人人数:</h4></label>				
						<input type="text" id="djlrrs" name="djlrrs" class="form-control " required="required"  placeholder="请填写独居老人人数" />
					</div>
					<div class="form-group input-group-lg">
						<label for="_yn"><h4>危险物品储存:</h4></label>
						<div class="form-group input-group-lg">
						    <select id="wxwpcz_yn" name="wxwpcz_yn" class="form-control" required="
						    required">
						    		<option value="" selected="true" disabled="true">请选择
									</option>
									<option value="1">有</option>
									<option value="0">无</option>
						    </select>		  				     	
						</div>
					</div>
					<div class="form-group input-group-lg">
						<label for="dlsgytcq"><h4>独立式感烟探测器(个):</h4></label>				
						<input type="text" id="dlsgytcq" name="dlsgytcq" class="form-control " required="required"  placeholder="请填写独立式感烟探测器个数" />
					</div>
					<div class="form-group input-group-lg">
						<label for="_yn"><h4>电动车集中存放:</h4></label>
						<div class="form-group input-group-lg">
						    <select id="ddcjzcf_yn" name="ddcjzcf_yn" class="form-control" required="
						    required">
						    		<option value="" selected="true" disabled="true">请选择
									</option>
									<option value=""  disabled="true">有集中存放点，请选择：
									</option>
									<option value="2">   集中存放，并有充电装置</option>
									<option value="1">   集中存放，无充电装置</option>
									<option value="0">无集中存放点</option>
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

<h2 ><strong>感谢您的使用。</strong></h2>
	<hr />
				<div >

				</div>
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
