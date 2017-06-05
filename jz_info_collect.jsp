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
		String tempBuildingJsonString = request.getAttribute("buildingBean").toString();		
	%>
	<script>
		//这里类似xq_info_collect.jsp。变量名称待定
 		$().ready(function (){
 			$("#xiaofangDevice").select2(tags:true);

 			var buildingjsonarr = eval(<%=tempCetempBuildingJsonString %>);
 			for(var i in buildingjsonarr){
 				console.log("item="+i+"value="+buildingjsonarr[i]);
 				var t1 = "";
 				var t2 = "";
 				if("buildingId"==i){
 					t1 = buildingjsonarr[i]+"栋"；
 				}
 				if("buildingAddr"==i){
 					t2 = buildingjsonarr[i];
 				}
 				var temp = '<p>'+t2+t1+'</p>';
 				$("#buildinglist").append(temp); 				
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
									 点击查看建筑列表

								</a>
							</h4>
						</div>
						<div id="collapse1" class="panel-collapse collapse" style="height: 0px;">
							<div id="buildinglist" class="panel-body">
								
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
						<label for="leaveRoad">
							<h4><span style="color:red">*</span>疏散通道(个):（必填）</h4>
						</label>			
						<input type="number" id="leaveRoad" name="leaveRoad" class="form-control "
						 required="required" />
					</div>
					<div class="form-group input-group">
						<label for="safeLeaveRoad">
							<h4><span style="color:red">*</span>安全出口(个):（必填）</h4>
						</label>
						<input type="number" id="safeLeaveRoad" name="safeLeaveRoad" 
						class="form-control " required="required" />
					</div>
					
					<div class="form-group input-group">
						<label for="singleOldPersonCount">
							<h4><span style="color:red">*</span>独居老人人数:(必填)</h4>
						</label>				
						<input type="number" id="singleOldPersonCount" name="singleOldPersonCount" 
						class="form-control " required="required" />
					</div>
					<div class="form-group input-group">
						<label for="monitorSmokingCount"><h4>独立式感烟探测器(个):（必填）</h4></label>				
						<input type="number" id="monitorSmokingCount" name="monitorSmokingCount" class="form-control " required="required" />
					</div>
					<div class="form-group input-group">
						<label for="xfss">
							<h4><span style="color:red">*</span>建筑消防设施:（必选、多选）</h4>
						</label>
						<div class="form-group input-group">
						    <select id="xfss" name="xfss" class="js-example-templating form-control" multiple="multiple" required="required"
						    style="width:100%">
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
					<!--
					</div>
					<div class="form-group input-group">
					-->
					<label for="xfssOther"><h4>其他:（选填）</h4></label>				
						<input type="text" id="xfssOther" name="xfssOther" class="form-control " placeholder="选填，当选择了消防设施的其他项后填写" />
					</div>

					<hr />
					<h2>主要消防隐患</h>
					<hr />
					<!--安全疏散-->
					<div class="form-group input-group">
						<label for="yinhuanSafeLeave">
							<h4><span style="color:red">*</span>安全疏散（通道、出口、楼梯）:（必选、多选）</h4>
						</label>
						<div class="form-group input-group">
						    <select id="yinhuanSafeLeave" name="yinhuanSafeLeave" class="js-example-templating form-control" multiple="multiple" required="required"
						    style="width:100%">
									<option value="无隐患">无隐患</option>
									<option value="未设置">未设置</option>
									<option value="消防通道阻塞">消防通道阻塞</option>
									<option value="安全出口阻塞或锁闭">安全出口阻塞或锁闭</option>
									<option value="未设置前室">未设置前室</option>
									<option value="疏散宽度不足">疏散宽度不足</option>
									<option value="通向疏散通道、楼梯的防火门未按要求设置">通向疏散通道、楼梯的防火门未按要求设置</option>
									<option value="灭火器">灭火器</option>
									<option value="其他">其他</option>
						    </select>		  				     	
						</div>
					<!--
					</div>
					<div class="form-group input-group">
					-->
					<label for="yinhuanSafeLeaveOther"><h4>其他:（选填）</h4></label>				
						<input type="text" id="yinhuanSafeLeaveOther" name="yinhuanSafeLeaveOther" class="form-control " placeholder="选填，当选择了安全疏散隐患的其他项后填写原因" />
					</div>
					<!--安全疏散END-->

					<!--应急照明-->

					<div class="form-group input-group">
						<label for="yinhuanYjzmDevice">
							<h4><span style="color:red">*</span>应急照明:（必选、多选）</h4>
						</label>
						<div class="form-group input-group">
						    <select id="yinhuanYjzmDevice" name="yinhuanYjzmDevice" class="js-example-templating form-control" multiple="multiple" required="required"
						    style="width:100%">
									<option value="无隐患">无隐患</option>
									<option value="未设置">未设置</option>
									<option value="配置不符合要求">配置不符合要求</option>
									<option value="损坏">损坏</option>
									<option value="其他">其他</option>
						    </select>		  				     	
						</div>
					<!--
					</div>
					<div class="form-group input-group">
					-->
					<label for="yinhuanYjzmDeviceOther"><h4>其他:（选填）</h4></label>				
						<input type="text" id="yinhuanYjzmDeviceOther" name="yinhuanYjzmDeviceOther" class="form-control " placeholder="选填，当选择了应急照明隐患的‘其他’后填写其他原因" />
					</div>
					<!--应急照明END-->

					<!--疏散指示标志-->
					<div class="form-group input-group">
						<label for="yinhuanLeaveItem">
							<h4><span style="color:red">*</span>疏散指示标志:（必选、多选）</h4>
						</label>
						<div class="form-group input-group">
						    <select id="yinhuanLeaveItem" name="yinhuanLeaveItem" class="js-example-templating form-control" multiple="multiple" required="required"
						    style="width:100%">
									<option value="无隐患">无隐患</option>
									<option value="未设置">未设置</option>
									<option value="配置不符合要求">配置不符合要求</option>
									<option value="损坏">损坏</option>
									<option value="其他">其他</option>
						    </select>		  				     	
						</div>
					
					<label for="yinhuanLeaveItemOther"><h4>其他:（选填）</h4></label>				
						<input type="text" id="yinhuanLeaveItemOther" name="yinhuanLeaveItemOther" class="form-control " placeholder="选填，当选择了疏散指示标志隐患的‘其他’后填写其他原因" />
					</div>
					<!--end 疏散指示标志-->

					<!--消防给水-->
					<div class="form-group input-group">
						<label for="yinhuanXfGiveWater">
							<h4><span style="color:red">*</span>消防给水:（必选、多选）</h4>
						</label>
						<div class="form-group input-group">
						    <select id="yinhuanXfGiveWater" name="yinhuanXfGiveWater" class="js-example-templating form-control" multiple="multiple" required="required"
						    style="width:100%">
									<option value="无隐患">无隐患</option>
									<option value="未设置">未设置</option>
									<option value="消防水池或消防水箱无水">消防水池或消防水箱无水</option>
									<option value="消防水池或消防水箱不能正常使用">消防水池或消防水箱不能正常使用</option>
									<option value="其他">其他</option>
						    </select>		  				     	
						</div>
					
					<label for="yinhuanXfGiveWaterOther"><h4>其他:（选填）</h4></label>				
						<input type="text" id="yinhuanXfGiveWaterOther" name="yinhuanXfGiveWaterOther" class="form-control " placeholder="选填，当选择了上述消防给水隐患的‘其他’后填写其他原因" />
					</div>
					<!--end 消防给水-->

					<!--室内消火栓系统-->
					<div class="form-group input-group">
						<label for="yinhuanInnerKillFireSystem">
							<h4><span style="color:red">*</span>室内消火栓系统:（必选、多选）</h4>
						</label>
						<div class="form-group input-group">
						    <select id="yinhuanInnerKillFireSystem" name="yinhuanInnerKillFireSystem" class="js-example-templating form-control" multiple="multiple" required="required" style="width:100%">
									<option value="无隐患">无隐患</option>
									<option value="无水-设施损坏">无水-设施损坏导致</option>
									<option value="无水-市政管网无水">无水-市政管网无水导致</option>
									<option value="水压不足-设施损坏">水压不足-设施损坏导致</option>
									<option 
											value="水压不足-市政管网水压无水">水压不足-市政管网水压无水导致
									</option>
									<option value="其他">其他</option>
						    </select>		  				     	
						</div>
					
					<label for="yinhuanInnerKillFireSystemOther"><h4>其他:（选填）</h4></label>				
						<input type="text" id="yinhuanInnerKillFireSystemOther" name="yinhuanInnerKillFireSystemOther" class="form-control " placeholder="选填，当选择了上述室内消火栓隐患的‘其他’后填写其他原因" />
					</div>
					<!--end 室内消火栓系统-->

					<!--自动灭火系统-->
					<div class="form-group input-group">
						<label for="yinhuanAutoKillFireSystem">
							<h4><span style="color:red">*</span>自动灭火系统:（必选、多选）</h4>
						</label>
						<div class="form-group input-group">
						    <select id="yinhuanAutoKillFireSystem" name="yinhuanAutoKillFireSystem" class="js-example-templating form-control" multiple="multiple" required="required"
						    style="width:100%">
									<option value="无隐患">无隐患</option>
									<option value="未设置">未设置</option>
									<option value="喷头损坏">喷头损坏</option>
									<option value="无水">无水</option>
									<option value="其他">其他</option>
						    </select>		  				     	
						</div>
					
					<label for="yinhuanAutoKillFireSystemOther"><h4>其他:（选填）</h4></label>				
						<input type="text" id="yinhuanAutoKillFireSystemOther" name="yinhuanAutoKillFireSystemOther" class="form-control " placeholder="选填，当选择了上述自动灭火系统隐患的‘其他’后填写其他原因" />
					</div>
					<!--end 自动灭火系统-->

					<!--火灾自动报警系统-->
					<div class="form-group input-group">
						<label for="yinhuanFireAutoReportSystem">
							<h4><span style="color:red">*</span>火灾自动报警系统:（必选、多选）</h4>
						</label>
						<div class="form-group input-group">
						    <select id="yinhuanFireAutoReportSystem" name="yinhuanFireAutoReportSystem" class="js-example-templating form-control" multiple="multiple" required="required"
						    style="width:100%">
									<option value="无隐患">无隐患</option>
									<option value="未设置">未设置</option>
									<option value="不能正常使用">不能正常使用</option>
									<option value="其他">其他</option>
						    </select>		  				     	
						</div>
					
					<label for="yinhuanFireAutoReportSystemOther"><h4>其他:（选填）</h4></label>			
						<input type="text" id="yinhuanFireAutoReportSystemOther" name="yinhuanFireAutoReportSystemOther" class="form-control " placeholder="选填，当选择了上述火灾自动报警系统隐患的‘其他’后填写其他原因" />
					</div>
					<!--end 火灾自动报警系统-->

					<!--防烟和排烟设施-->
					<div class="form-group input-group">
						<label for="yinhuanFilterSmokeSystem">
							<h4><span style="color:red">*</span>排烟和防烟设施:（必选、多选）</h4>
						</label>
						<div class="form-group input-group">
						    <select id="yinhuanFilterSmokeSystem" name="yinhuanFilterSmokeSystem" class="js-example-templating form-control" multiple="multiple" required="required"
						    style="width:100%">
									<option value="无隐患">无隐患</option>
									<option value="未设置">未设置</option>
									<option value="不能正常使用">不能正常使用</option>
									<option value="其他">其他</option>
						    </select>		  				     	
						</div>
					
					<label for="yinhuanFilterSmokeSystemOther"><h4>其他:（选填）</h4></label>				
						<input type="text" id="yinhuanFilterSmokeSystemOther" name="yinhuanFilterSmokeSystemOther" class="form-control " placeholder="选填，当选择了上述排烟和防烟设施隐患的‘其他’后填写其他原因" />
					</div>
					<!--end 排烟和防烟设施-->

					<!--消防电梯-->
					<div class="form-group input-group">
						<label for="yinhhuanXfDianTi">
							<h4><span style="color:red">*</span>消防电梯:（必选、多选）</h4>
						</label>
						<div class="form-group input-group">
						    <select id="yinhhuanXfDianTi" name="yinhhuanXfDianTi" class="js-example-templating form-control" multiple="multiple" required="required"
						    style="width:100%">
									<option value="无隐患">无隐患</option>
									<option value="未设置">未设置</option>
									<option value="不能正常使用">不能正常使用</option>
									<option value="其他">其他</option>
						    </select>		  				     	
						</div>
					
					<label for="yinhhuanXfDianTiOther"><h4>其他:（选填）</h4></label>				
						<input type="text" id="yinhhuanXfDianTiOther" name="yinhhuanXfDianTiOther" class="form-control " placeholder="选填，当选择了上述消防电梯隐患的‘其他’后填写其他原因" />
					</div>
					<!--end 消防电梯-->

					<!--电缆井-->
					<div class="form-group input-group">
						<label for="yinhuanDianLanJin">
							<h4><span style="color:red">*</span>电缆井:（必选、多选）</h4>
						</label>
						<div class="form-group input-group">
						    <select id="yinhuanDianLanJin" name="yinhuanDianLanJin" class="js-example-templating form-control" multiple="multiple" required="required"
						    style="width:100%">
									<option value="无隐患">无隐患</option>
									<option value="管道井未封堵或不符合要求">管道井未封堵或不符合要求</option>
									<option value="电气线路敷设不符合要求">电气线路敷设不符合要求</option>
									<option value="防火门设置不符合要求">防火门设置不符合要求</option>
									<option value="其他">其他</option>
						    </select>		  				     	
						</div>
					
					<label for="yinhuanDianLanJinOther"><h4>其他:（选填）</h4></label>				
						<input type="text" id="yinhuanDianLanJinOther" name="yinhuanDianLanJinOther" class="form-control " placeholder="选填，当选择了上述电缆井隐患的‘其他’后填写其他原因" />
					</div>
					<!--end 电缆井-->
					
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
