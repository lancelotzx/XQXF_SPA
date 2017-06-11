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
.div-a{ float:left;display:table-cell;vertical-align: middle;} 
.div-b{ float:left;display:table-cell;vertical-align: middle;} 

.div-c1{ float:left;width:50%;display:table-cell;vertical-align: middle;} 
.div-c2{ float:left;width:30%;display:table-cell;vertical-align: middle;} 
.div-c3{ float:left;width:20%;display:table-cell;vertical-align: middle;} 
.input-me{
	border-top-width: 0px;border-left-width: 0px;border-right-width: 0px;
	font-size: 12pt;background:#f5f5f5;border-bottom: 0px solid #98CBF7;
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
 				console.log("item="+i+"  value="+celljsonarr[i]);
 				if("cellName"==i){//如果是小区名称，那么对strong标签特殊处理
 					$("#cellnametitle").append(celljsonarr[i]);
 					$("#cellName").val(celljsonarr[i]);//提交隐藏字段cellname给后台作为id
 				}
 				else if("cellAddr" == i
 				 || "community" == i
 				 ||"leaveRoad" == i
 				 ||"safeLeaveRoad" == i
 				 ||"singleOldPersonCount" == i
 				 ||"jyplSystemCount" == i
 				 ||"monitorSmokingDeviceCount" == i
 				 ){
 					$("#"+i).html("<h4>"+celljsonarr[i]+"</h4>");
 				}
 				else if("buildNameList" == i){ //建筑列表名字为Addr+'-'+Id,这里进行处理
 					var buildingA_I = celljsonarr[i];
 					console.log("AVC "+buildingA_I);
 					for(var j in buildingA_I)
 					{
 						$("#buildingAddr_Id").append("<option value="+buildingA_I[j]+">"
 							+buildingA_I[j]+"</option>");
 					}

 				}
 				else if("xiaofangControlRoom"==i
 					||"smallXiaofangStation" == i
 					||"xiaofangCarRoad" == i
 					||"business" == i
 					||"dangerThing" == i
 					||"autoMobile" == i ){
 						$("input:radio[name="+i+"][value="+celljsonarr[i]+"]").attr("checked",true);


 				}
 				else{//若是其他字段，直接通过json的字段名赋值value
 					var obj=$("#"+i);
 					obj.val(celljsonarr[i]);
 				}
 			}
 			//TODO：所属社区community是下拉框，这里还没有实现
 			

 		});

		

		$(function () { 
				 		$("#buildingAddr_Id").change(function () {
				 			var buildingAddr;
				 			var buildingId;
				 			var temp = $("#buildingAddr_Id").val();
				 			var idex = temp.indexOf('-');
				 			buildingAddr = temp.substring(0,idex);
				 			buildingId = temp.substring(idex+1,temp.length-1);//去掉栋字
				 			$("#buildingAddr").val(buildingAddr);
				 			$("#buildingId").val(buildingId);


				      		//$("#xq_info_collect_form").submit();
				  	 })
		});
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
				<li ><a href="GoToIndexAction"><h3>回到首页</h3></a></li>

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
						<div class="div-a" style = "">
							<h4>小区地址:</h4>
						</div>
						<div class="div-b" id="cellAddr">
						</div>
					</div>
					<!--end mod 小区地址-->
					<div  style ="clear:both; border:0;height:1px;background:#AFAFAF"></div>

					<div >
						<div class="div-a"><h4>所属社区:</h4></div>
						<div class="div-b" id="community">
						
						</div>
					</div>
					<!--end add 所属社区-->

					<div  style ="clear:both; border:0;height:1px;background:#AFAFAF"></div>

					<!--add 小区管理主体-->
					<div >
						<div class="div-c1" style="width:45%">
							<h4><span style="color:red">*</span>小区管理主体:</h4>
						</div>
						<div class="div-c2" style="width:30%">
						    <select id="cellGlzt" name="cellGlzt" class="form-control" required="required">
						    		<option value="" selected="true" disabled="true">请选择
									</option>
									<option value="物业服务企业">物业服务企业</option>
									<option value="居民委员会">居民委员会</option>
									<option value="其他">其他</option>
						    </select>		  				     	
						</div>
						<div class="div-c3">
						<input type="text" id="cellGlztOther" name="cellGlztOther" class="input-me" placeholder="请填入管理主体名称" style="width:80px;" required="required" />
						</div>
					</div>

					<div  style ="clear:both; border:0;height:1px;background:#AFAFAF"></div>
					<!--end add 小区管理主体 done-->

					
					<div>
						<div class="div-a">
							<h4><span style="color:red">*</span>社区消防安全责任人  :</h4>
						</div>
						<div class="div-b" >
							<input type="text" id="communityZrrPerson" name="communityZrrPerson" class="input-me" required="required"  placeholder="请填写姓名" />
						</div>
					</div>

					<div  style ="clear:both; border:0;height:1px;background:#AFAFAF"></div>
					<!--end社区消防安全责任人 done-->

					<div >
						<div class="div-a">
							<h4><span style="color:red">*</span>社区民警&nbsp;&nbsp;:</h4>
						</div>
						<div class="div-b">
							<input type="text" id="communityGlrPerson" name="communityGlrPerson" class="input-me " required="required"  placeholder="请填写姓名" />
						</div>
					</div>

					<div  style ="clear:both; border:0;height:1px;background:#AFAFAF"></div>
					<!--end社区消防安全管理人->社区民警 done-->

					<div >
						<div class="div-a">
							<h4><span style="color:red">*</span>小区消防安全责任人&nbsp;:</h4>
						</div>
						<div class="div-b">
							<input type="text" id="cellZrrPerson" name="cellZrrPerson" class="input-me " required="required"  placeholder="请填写姓名" />
						</div>
					</div>

					<div  style ="clear:both; border:0;height:1px;background:#AFAFAF"></div>
					<!--end小区消防安全责任人done-->

					<div >
						<div class="div-a">
							<h4><span style="color:red">*</span>小区消防安全管理人&nbsp;:</h4>
						</div>
						<div class="div-b">
							<input type="text" id="cellGlrPerson" name="cellGlrPerson" class="input-me " required="required"  placeholder="请填写姓名" />
						</div>
					</div>

					<div  style ="clear:both; border:0;height:1px;background:#AFAFAF"></div>
					<!--end小区消防安全管理人done-->

					<!-- 所属街道不要了
					<div class="form-group input-group">
						<label for="ssjdbsc">
							<h4>所属街道办事处:（只读）</h4>
						</label>
						<input type="text" id="street" name="street" class="form-control " readonly="true" />
					</div>
					-->
					<div>
						<div class="div-a">
							<h4><span style="color:red">*</span>小区建筑数量(9层及以下)    :</h4>
						</div>	
						<div class="div-b">			
						<input type="number" min="0" id="buildingCountLess9" name="buildingCountLess9" class="input-me " style="width:60px;" required="required"  placeholder="请填入数字" />
						</div>
					</div>

					<div  style ="clear:both; border:0;height:1px;background:#AFAFAF"></div>
					<!--done-->

					<div>
						<div class="div-a">
							<h4><span style="color:red">*</span>小区建筑数量(10到33层)    :</h4>
						</div>	
						<div class="div-b">			
						<input type="number" min="0" id="buildingCount10_33" name="buildingCount10_33" class="input-me " style="width:60px;" required="required"  placeholder="请填入数字" />
						</div>
					</div>

					<div  style ="clear:both; border:0;height:1px;background:#AFAFAF"></div>
					<!--done-->

					<div>
						<div class="div-a">
							<h4><span style="color:red">*</span>小区建筑数量(33层以上)    :</h4>
						</div>	
						<div class="div-b">			
						<input type="number" min="0" id="buildingCountMore34" name="buildingCountMore34" class="input-me " style="width:60px;" required="required"  placeholder="请填入数字" />
						</div>
					</div>

					<div  style ="clear:both; border:0;height:1px;background:#AFAFAF"></div>
					<!--done-->

					
					
					<div >
						<div class="div-a">
							<h4><span style="color:red">*</span>是否有消防控制室:&nbsp;&nbsp;</h4>
						</div>
						<div class="div-b" style="width:30%">
							<h4><input type="radio" name="xiaofangControlRoom" id="xiaofangControlRoom" value="有" required="required"／>有</h4>
							<h4><input type="radio" name="xiaofangControlRoom" id="xiaofangControlRoom" value="无" required="required"／>无</h4>
						    		  				     	
						</div>
					</div>

					<div  style ="clear:both; border:0;height:1px;background:#AFAFAF"></div>
					<!--done-->

					<div >
						<div class="div-a">
							<h4><span style="color:red">*</span>是否有微型消防站:&nbsp;&nbsp;</h4>
						</div>
						<div class="div-b" style="width:30%">
							<h4><input type="radio" name="smallXiaofangStation" id="smallXiaofangStation" value="有" required="required"／>有</h4>
							<h4><input type="radio" name="smallXiaofangStation" id="smallXiaofangStation" value="无" required="required"／>无</h4>
						    		  				     	
						</div>
					</div>

					<div  style ="clear:both; border:0;height:1px;background:#AFAFAF"></div>
					<!--微型消防站done-->

					<div >
						<div class="div-a">
							<h4><span style="color:red">*</span>是否有消防车道:&nbsp;&nbsp;</h4>
						</div>
						<div class="div-b" style="width:30%">
							<h4><input type="radio" name="xiaofangCarRoad" id="xiaofangCarRoad" value="有" required="required"／>有</h4>
							<h4><input type="radio" name="xiaofangCarRoad" id="xiaofangCarRoad" value="无" required="required"／>无</h4>
						    		  				     	
						</div>
					</div>

					<div  style ="clear:both; border:0;height:1px;background:#AFAFAF"></div>
					<!--消防车道done-->

					
					<div >
						<div class="div-a"><h4>疏散通道(个)&nbsp;&nbsp;:</h4></div>
						<div class="div-b" id="leaveRoad" name="leaveRoad">						
						</div>
					</div>
					

					<div  style ="clear:both; border:0;height:1px;background:#AFAFAF"></div>

					<!--end add 疏散通道-->

					<div >
						<div class="div-a"><h4>安全出口(个)&nbsp;&nbsp;:</h4></div>
						<div class="div-b" id="safeLeaveRoad" name="safeLeaveRoad">						
						</div>
					</div>
					

					<div  style ="clear:both; border:0;height:1px;background:#AFAFAF"></div>

					<!--end add 安全出口-->

					<div >
						<div class="div-a"><h4>独居老人个数&nbsp;&nbsp;:</h4></div>
						<div class="div-b" id="singleOldPersonCount" name="singleOldPersonCount">						
						</div>
					</div>
					

					<div  style ="clear:both; border:0;height:1px;background:#AFAFAF"></div>

					<!--end add 独居老人个数-->

					<div >
						<div class="div-a"><h4>简易喷淋系统(套)&nbsp;&nbsp;:</h4></div>
						<div class="div-b" id="jyplSystemCount" name="jyplSystemCount">						
						</div>
					</div>
					

					<div  style ="clear:both; border:0;height:1px;background:#AFAFAF"></div>

					<!--end add 简易喷淋系统-->

					<div >
						<div class="div-a"><h4>独立式感烟探测器(个)&nbsp;&nbsp;:</h4></div>
						<div class="div-b" id="monitorSmokingDeviceCount" name="monitorSmokingDeviceCount">						
						</div>
					</div>
					

					<div  style ="clear:both; border:0;height:1px;background:#AFAFAF"></div>

					<!--end add 独立式感烟探测器-->

					<div >
						<div class="div-a">
							<h4><span style="color:red">*</span>商业出租情况:&nbsp;&nbsp;</h4>
						</div>
						<div class="div-b" style="width:30%">
							<h4><input type="radio" name="business" id="business" value="有" required="required"／>有</h4>
							<h4><input type="radio" name="business" id="business" value="无" required="required"／>无</h4>
						    		  				     	
						</div>
					</div>

					<div  style ="clear:both; border:0;height:1px;background:#AFAFAF"></div>
					<!--商业出租情况done-->

					<div >
						<div class="div-a">
							<h4><span style="color:red">*</span>危险物品储存:&nbsp;&nbsp;</h4>
						</div>
						<div class="div-b" style="width:30%">
							<h4><input type="radio" name="dangerThing" id="dangerThing" value="有" required="required"／>有</h4>
							<h4><input type="radio" name="dangerThing" id="dangerThing" value="无" required="required"／>无</h4>
						    		  				     	
						</div>
					</div>

					<div  style ="clear:both; border:0;height:1px;background:#AFAFAF"></div>
					<!--危险物品储存done-->

					<div >
						<div class="div-a">
							<h4><span style="color:red">*</span>电动车集中存放:&nbsp;&nbsp;</h4>
						</div>
						<div class="div-b" style="">
							<h4><input type="radio" name="autoMobile" id="autoMobile" value="集中存放，并有充电装置" required="required"／>集中存放，并有充电装置</h4>
							<h4><input type="radio" name="autoMobile" id="autoMobile" value="集中存放，无充电装置" required="required"／>集中存放，无充电装置</h4>
							<h4><input type="radio" name="autoMobile" id="autoMobile" value="无集中存放点" required="required"／>无集中存放点</h4>

						    		  				     	
						</div>
					</div>

					<div  style ="clear:both; border:0;height:1px;background:#AFAFAF"></div>
					<!--电动车集中存放done-->

					<!--add 小区建筑选择-->
					<div >
						<div class="div-a">
							<h4><span style="color:red">*</span>请选择本小区待排查建筑:</h4>
						</div>
						<div class="div-b">
						    <select id="buildingAddr_Id" name="buildingAddr_Id" class="form-control" required="required">
						    		<option value="" selected="true" disabled="true">请选择
									</option>
									
						    </select>	
						    <input id="buildingAddr" name="buildingAddr" value="" type="hidden" />
						    <input id="buildingId" name="buildingId" value="" type="hidden">	  				     	
						</div>
						
					</div>
					<!--小区建筑选择end-->
					
					<div class="form-group">
						<button id="xq_submit" type="submit" class="btn btn-info btn-block btn-lg">数据提交</button>
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
