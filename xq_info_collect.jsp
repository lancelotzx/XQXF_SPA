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

<style> 
.div-a{ float:left;width:30%;} 
.div-b{ float:left;width:68%;} 

.div-c1{ float:left;width:30%;} 
.div-c2{ float:left;width:33%;} 
.div-c3{ float:left;width:36%;} 
.input-me{
	border-top-width: 0px;border-left-width: 0px;border-right-width: 0px;
	font-size: 9pt;background:#f5f5f5;border-bottom: 1px solid #98CBF7;
}

</style> 


</head>
<body >
	<%
		String tempCellJsonString = request.getAttribute("cellBean").toString();		
	%>
	<script>
 		$().ready(function (){
 			var celljsonarr = eval(<%=tempCellJsonString%>);
 			for(var i in celljsonarr){
 				console.log("item="+i+"value="+celljsonarr[i]);
 				if("cellName"==i){//如果是小区名称，那么对strong标签特殊处理
 					$("#cellnametitle").append(celljsonarr[i]);
 					$("#cellName").val(celljsonarr[i]);//提交隐藏字段cellname给后台作为id
 				}
 				else if("cellAddr" == i){
 					$("#cellAddr").html("<h5>"+celljsonarr[i]+"</h5>");
 				}
 				else{//若是其他字段，直接通过json的字段名赋值value
 					var obj=$('#'+i);
 					obj.val(celljsonarr[i]);
 				}
 			}
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
			<div  sytle="color:#fff"><h3>居民信息检查</h3></div>
		</div>
		<div class="navbar-collapse collapse move-me">
			<ul class="nav navbar-nav navbar-right">
				<li ><a href=""><h3>本小区填写检查</h3></a></li>
				<li ><a href="index.jsp"><h3>进入首页</h3></a></li>

			</ul>
		</div>
	   
	</div>
</div>
  <!--NAVBAR SECTION END-->
   



 
<div id="contact-sec"   >
	   <div class="overlay">
<div class="container set-pad">
	<div class="row text-center">
		<div class="col-lg-12  col-md-12 col-sm-12">
			<h2 id="cellnametitle" data-scroll-reveal="enter from the bottom after 0.1s" class="header-line" >
			 	<!--use jquery add content:cellName小区名称-->
			 
			</h2>
		 
		</div>

	</div>
	<div style ="border:0;height:1px;background:#AFAFAF"></div>
		 <!--/.HEADER LINE END-->
	
		 <!--/.HEADER LINE END-->
	 
	   
		   
			 <div class="col-lg-12  col-md-12  col-sm-12">
				<form 	role = "form" id="xq_info_collect_form" name="xqform" action="SetCellAction" method="post">
					<input id="cellName" name="cellName" type="hidden" value=""/>
					<!--下面这个地方修改了，和dzf确认
					<div class="form-group input-group">
						<label class="form-label" for="xqdz"><h4>小区地址列表:</h4></label>
						<input type="text" id="cellAddr" name="cellAddr" class="form-control"  readonly="true" />
					</div>
					end mod-->
					<div>
						<div class="div-a">
							<h5>小区地址:</h5>
						</div>
						<div class="div-b" id="cellAddr">
						</div>
					</div>
					<!--end mod 小区地址-->
					<div  style ="clear:both; border:0;height:1px;background:#AFAFAF"></div>

					<!--add 小区管理主体-->
					<div >
						<div class="div-c1">
							<h5><span style="color:red">*</span>小区管理主体:</h5>
						</div>
						<div class="div-c2">
						    <select id="cellGlzt" name="cellGlzt" class="form-control" required="required">
						    		<option value="" selected="true" disabled="true">请选择
									</option>
									<option value="物业服务企业">物业服务企业</option>
									<option value="居民委员会">居民委员会</option>
									<option value="其他">其他</option>
						    </select>		  				     	
						</div>
						<div class="div-c3">
						<input type="text" id="cellGlztOther" name="cellGlztOther" class="input-me" placeholder="请填入管理主体名称" required="required" />
						</div>
					</div>

					<div  style ="clear:both; border:0;height:1px;background:#AFAFAF"></div>
					<!--end add 小区管理主体-->

					<div >
						<label for="sssq"><h4>所属社区:(若显示不符合请修改为正确名称)</h4></label>
						<input type="text" id="community" name="community" class="form-control"  required="required" placeholder="请核对并填写小区所属社区名" />
					</div>
					<!--end add 所属社区-->
					<div class="form-group input-group">
						<label for="sqxfaqzzr">
							<h4><span style="color:red">*</span>社区消防安全责任人:</h4>
						</label>
						<input type="text" id="communityZrrPerson" name="communityZrrPerson" class="form-control " required="required"  placeholder="请填写社区消防安全责任人姓名" />
					</div>
					<div class="form-group input-group">
						<label for="sqxfaqglr">
							<h4><span style="color:red">*</span>社区消防安全管理人:</h4>
						</label>
						<input type="text" id="communityGlrPerson" name="communityGlrPerson" class="form-control " required="required"  placeholder="请填写社区消防安全管理人姓名" />
					</div>
					<div class="form-group input-group">
						<label for="ssjdbsc">
							<h4>所属街道办事处:（只读）</h4>
						</label>
						<input type="text" id="street" name="street" class="form-control " readonly="true" />
					</div>
					<div class="form-group input-group">
						<label for="jzslless9">
							<h4><span style="color:red">*</span>小区建筑数量(9层及以下):(请填入数字)</h4>
						</label>				
						<input type="number" id="buildingCountLess9" name="buildingCountLess9" class="form-control " required="required"  placeholder="小区内9层及以下的建筑总数" />
					</div>
					<div class="form-group input-group">
						<label for="jzsl10to33">
							<h4><span style="color:red">*</span>建筑数量(10到33层):（请填入数字）</h4>
						</label>				
						<input type="number" id="buildingCount10_33" name="buildingCount10_33" class="form-control " required="required"  placeholder="小区内10到33层的建筑总数" />
					</div>
					<div class="form-group input-group">
						<label for="jzsl33more">
							<h4><span style="color:red">*</span>建筑数量(33层以上):</h4>
						</label>				
						<input type="number" id="buildingCountMore34" name="buildingCountMore34" class="form-control " required="required"  placeholder="小区内33层以上的建筑总数" />
					</div>
					<div class="form-group input-group">
						<label for="xfkzs_yn">
							<h4><span style="color:red">*</span>是否有消防控制室:</h4>
						</label>
						<div class="form-group input-group">
						    <select id="xiaofangControlRoom" name="xiaofangControlRoom" class="form-control" required="required">
						    		<option value="" selected="true" disabled="true">请选择
									</option>
									<option value="有">有</option>
									<option value="无">无</option>
						    </select>		  				     	
						</div>
					</div>
					<div class="form-group input-group">
						<label for="wxxfz_yn">
							<h4><span style="color:red">*</span>是否有微型消防站:</h4>
						</label>
						<div class="form-group input-group">
						    <select id="smallXiaofangStation" name="smallXiaofangStation" class="form-control" required="required">
						    		<option value="" selected="true" disabled="true">请选择
									</option>
									<option value="有">有</option>
									<option value="无">无</option>
						    </select>		  				     	
						</div>
					</div>
					<div class="form-group input-group">
						<label for="xfcd_yn">
							<h4><span style="color:red">*</span>是否有消防车道:</h4>
						</label>
						<div class="form-group input-group">
						    <select id="xiaofangCarRoad" name="xiaofangCarRoad" class="form-control" required="required">
						    		<option value="" selected="true" disabled="true">请选择
									</option>
									<option value="有">有</option>
									<option value="无">无</option>
						    </select>		  				     	
						</div>
					</div>
					
					<div class="form-group input-group">
						<label for="sstd"><h4>疏散通道(个):（只读，请在建筑表格中填写）</h4></label>			
						<input type="text" id="leaveRoad" name="leaveRoad" class="form-control "
						 readonly="true" />
					</div>
					<div class="form-group input-group">
						<label for="aqck"><h4>安全出口(个): （只读，请在建筑表格中填写</h4></label>
						<input type="text" id="safeLeaveRoad" name="safeLeaveRoad" class="form-control " 
						readonly="true" />
					</div>
					
					<div class="form-group input-group">
						<label for="syczqk_yn">
							<h4><span style="color:red">*</span>商业出租情况:(必选)</h4>
						</label>
						<div class="form-group input-group">
						    <select id="business" name="business" class="form-control" required="
						    required">
						    		<option value="" selected="true" disabled="true">请选择
									</option>
									<option value="有">有</option>
									<option value="无">无</option>
						    </select>		  				     	
						</div>
					</div>
					<div class="form-group input-group">
						<label for="djlrrs"><h4>独居老人人数:(只读，从建筑页面提交)</h4></label>				
						<input type="text" id="singleOldPersonCount" name="singleOldPersonCount" class="form-control " readonly="true" />
					</div>
					<div class="form-group input-group">
						<label for="_yn"><h4><span style="color:red">*</span>危险物品储存:（必选）</h4>
						</label>
						<div class="form-group input-group">
						    <select id="dangerThing" name="dangerThing" class="form-control" 
						    required="required">
						    		<option value="" selected="true" disabled="true">请选择
									</option>
									<option value="有">有</option>
									<option value="无">无</option>
						    </select>		  				     	
						</div>
					</div>
					<div class="form-group input-group">
						<label for="dlsgytcq"><h4>独立式感烟探测器(个):（只读）</h4></label>				
						<input type="text" id="monitorSmokingDeviceCount" name="monitorSmokingDeviceCount" class="form-control " readonly="true" />
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
