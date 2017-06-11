﻿<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
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
<script src="http://cdn.bootcss.com/iCheck/1.0.2/icheck.min.js"></script>
<link href="http://cdn.bootcss.com/select2/4.0.3/css/select2.min.css" rel="stylesheet" type='
text/css' />
<link href="http://cdn.bootcss.com/iCheck/1.0.2/skins/flat/_all.css" rel="stylesheet" 
type='text/css'/>
<script src="http://cdn.bootcss.com/select2/4.0.3/js/select2.min.js"></script>

<style> 
.div-a{ float:left;display:table-cell;vertical-align: middle;} 
.div-b{ float:left;display:table-cell;vertical-align: middle;} 

.div-c1{ float:left;width:30%;display:table-cell;vertical-align: middle;} 
.div-c2{ float:left;width:45%;display:table-cell;vertical-align: middle;} 
.div-c3{ float:right;width:20%;display:table-cell;vertical-align: middle;} 
.input-me{
	border-top-width: 0px;border-left-width: 0px;border-right-width: 0px;
	font-size: 12pt;background:#f5f5f5;border-bottom: 0px solid #98CBF7;
}

</style> 


</head>
<body >
	<%

		String tempBuildingJsonString = "";
		if(null !=request.getAttribute("buildInfo")){
			tempBuildingJsonString = request.getAttribute("buildInfo").toString();
	};	

		String cellName = "";
		if(null !=request.getAttribute("cellName")){
			cellName = request.getAttribute("cellName").toString();
	};	


	%>
	<script>

	
 		$().ready(function (){

 			$('input').iCheck({
 				checkboxClass:'icheckbox_flat-blue'
 			});
 			
 			var t = "<%=cellName%>";
 			$("#cellName").val(t);
 			var buildingjsonarr = <%=tempBuildingJsonString%>;
 			//console.log("AVC  "+buildingjsonarr.length);
 			//console.log("AVVC "+buildingjsonarr[0] );
 			var t0="";
 			var t1="";
 			var t2="";
 			var index=0;
 			//下文ajax方法要对单个building的动态增加的<p>还要绑定data参数，在这里需要放入数组
 			var b_addr_arr=[];
 			var b_id_arr=[];


 			for(var item in buildingjsonarr){
 				//buildingjsonarr是个array[]，长度是建筑个数,成员是object
 				var item_v = buildingjsonarr[item];
 				console.log("item="+item+"  value="+item_v);
 				if("buildingId"==item
 					||"buildingAddr"==item){
 					$("#"+item).val(item_v);
 				}

 				if("leaveRoad"==item
 					||"safeLeaveRoad"==item
 					||"singleOldPersonCount"==item
 					||"jyplSystemCount"==item
 					||"monitorSmokingCount"==item){//简单的input字段
 					var obj=$("#"+item);
 					obj.val(item_v);
 				}
 								
 			}

 			/*把check的id设置为标志+中文value,
 			/*e.g:yinhuanSafeLeave无隐患
 			/*e.g:yinhuanSafeLeave未设置
 			/*开发功能1:无隐患点击后，其他点击项清空；
 			／*        点击其他项后，无隐患项清空。
 					   即：无隐患项和其他项是互斥关系。
 			 API1:判断一个checkox项是否选中：$('#yinhuanSafeLeave未设置').is(':checked'))
 			 API2:选中事件$("#yinhuanSafeLeave无隐患").on('ifChecked',function(event){XXXX})
 			*/
 			
 			var yinhuan_arr=new Array(
 				"yinhuanSafeLeave",
 				"yinhuanYjzmDevice",
 				"yinhuanLeaveItem",
 				"yinhuanXfGiveWater",
 				"yinhuanInnerKillFireSystem",
 				"yinhuanAutoKillFireSystem",
 				"yinhuanFireAutoReportSystem",
 				"yinhuanFilterSmokeSystem",
 				"yinhuanXfDianTi",
 				"yinhuanDianLanJin"
 				);
			
 			$("#yinhuanSafeLeave无隐患").//选择无隐患后，其他项清空
 			on('ifChecked',function(event){
 					//console.log('checked');
 					//console.log('other value='+$('#yinhuanSafeLeave未设置').is(':checked'));
 					$(":checkbox[id^='yinhuanSafeLeave'][id != 'yinhuanSafeLeave无隐患']")
 					.iCheck("uncheck");
			});

 			//除了无隐患以外的勾选项
			$(":checkbox[id^='yinhuanSafeLeave'][id != 'yinhuanSafeLeave无隐患']").
			on('ifChecked',function(event){
 					//console.log('checked');
 					//console.log('other value='+$('#yinhuanSafeLeave未设置').is(':checked'));
 					$("#yinhuanSafeLeave无隐患").iCheck("uncheck");
			});
			
 			
 			$("#yinhuanYjzmDevice无隐患").//选择无隐患后，其他项清空
 			on('ifChecked',function(event){
 					//console.log('checked');
 					//console.log('other value='+$('#yinhuanSafeLeave未设置').is(':checked'));
 					$(":checkbox[id^='yinhuanYjzmDevice'][id != 'yinhuanYjzmDevice无隐患']")
 					.iCheck("uncheck");
			});

 			//除了无隐患以外的勾选项
			$(":checkbox[id^='yinhuanYjzmDevice'][id != 'yinhuanYjzmDevice无隐患']").
			on('ifChecked',function(event){
 					//console.log('checked');
 					//console.log('other value='+$('#yinhuanSafeLeave未设置').is(':checked'));
 					$("#yinhuanYjzmDevice无隐患").iCheck("uncheck");
			});

			//yinhuanLeaveItem
			$("#yinhuanLeaveItem无隐患").//选择无隐患后，其他项清空
 			on('ifChecked',function(event){
 					//console.log('checked');
 					//console.log('other value='+$('#yinhuanSafeLeave未设置').is(':checked'));
 					$(":checkbox[id^='yinhuanLeaveItem'][id != 'yinhuanLeaveItem无隐患']")
 					.iCheck("uncheck");
			});

 			//除了无隐患以外的勾选项
			$(":checkbox[id^='yinhuanLeaveItem'][id != 'yinhuanLeaveItem无隐患']").
			on('ifChecked',function(event){
 					//console.log('checked');
 					//console.log('other value='+$('#yinhuanSafeLeave未设置').is(':checked'));
 					$("#yinhuanLeaveItem无隐患").iCheck("uncheck");
			});
			

			//yinhuanXfGiveWater
			$("#yinhuanXfGiveWater无隐患").//选择无隐患后，其他项清空
 			on('ifChecked',function(event){
 					//console.log('checked');
 					//console.log('other value='+$('#yinhuanSafeLeave未设置').is(':checked'));
 					$(":checkbox[id^='yinhuanXfGiveWater'][id != 'yinhuanXfGiveWater无隐患']")
 					.iCheck("uncheck");
			});

 			//除了无隐患以外的勾选项
			$(":checkbox[id^='yinhuanXfGiveWater'][id != 'yinhuanXfGiveWater无隐患']").
			on('ifChecked',function(event){
 					//console.log('checked');
 					//console.log('other value='+$('#yinhuanSafeLeave未设置').is(':checked'));
 					$("#yinhuanXfGiveWater无隐患").iCheck("uncheck");
			});
 			
 			//yinhuanInnerKillFireSystem
 			$("#yinhuanInnerKillFireSystem无隐患").//选择无隐患后，其他项清空
 			on('ifChecked',function(event){
 					//console.log('checked');
 					//console.log('other value='+$('#yinhuanSafeLeave未设置').is(':checked'));
 					$(":checkbox[id^='yinhuanInnerKillFireSystem'][id != 'yinhuanInnerKillFireSystem无隐患']")
 					.iCheck("uncheck");
			});

 			//除了无隐患以外的勾选项
			$(":checkbox[id^='yinhuanInnerKillFireSystem'][id != 'yinhuanInnerKillFireSystem无隐患']").
			on('ifChecked',function(event){
 					//console.log('checked');
 					//console.log('other value='+$('#yinhuanSafeLeave未设置').is(':checked'));
 					$("#yinhuanInnerKillFireSystem无隐患").iCheck("uncheck");
			});

			//yinhuanAutoKillFireSystem
			//"yinhuanFireAutoReportSystem",
 			//	"yinhuanFilterSmokeSystem",
 			//	"yinhuanXfDianTi",
 			//	"yinhuanDianLanJin"
 			$("#yinhuanAutoKillFireSystem无隐患").//选择无隐患后，其他项清空
 			on('ifChecked',function(event){
 					//console.log('checked');
 					//console.log('other value='+$('#yinhuanSafeLeave未设置').is(':checked'));
 					$(":checkbox[id^='yinhuanAutoKillFireSystem'][id != 'yinhuanAutoKillFireSystem无隐患']")
 					.iCheck("uncheck");
			});

 			//除了无隐患以外的勾选项
			$(":checkbox[id^='yinhuanAutoKillFireSystem'][id != 'yinhuanAutoKillFireSystem无隐患']").
			on('ifChecked',function(event){
 					//console.log('checked');
 					//console.log('other value='+$('#yinhuanSafeLeave未设置').is(':checked'));
 					$("#yinhuanAutoKillFireSystem无隐患").iCheck("uncheck");
			});

			//yinhuanFireAutoReportSystem

			$("#yinhuanFireAutoReportSystem无隐患").//选择无隐患后，其他项清空
 			on('ifChecked',function(event){
 					//console.log('checked');
 					//console.log('other value='+$('#yinhuanSafeLeave未设置').is(':checked'));
 					$(":checkbox[id^='yinhuanFireAutoReportSystem'][id != 'yinhuanFireAutoReportSystem无隐患']")
 					.iCheck("uncheck");
			});

 			//除了无隐患以外的勾选项
			$(":checkbox[id^='yinhuanFireAutoReportSystem'][id != 'yinhuanFireAutoReportSystem无隐患']").
			on('ifChecked',function(event){
 					//console.log('checked');
 					//console.log('other value='+$('#yinhuanSafeLeave未设置').is(':checked'));
 					$("#yinhuanFireAutoReportSystem无隐患").iCheck("uncheck");
			});

			//yinhuanFilterSmokeSystem
			$("#yinhuanFilterSmokeSystem无隐患").//选择无隐患后，其他项清空
 			on('ifChecked',function(event){
 					//console.log('checked');
 					//console.log('other value='+$('#yinhuanSafeLeave未设置').is(':checked'));
 					$(":checkbox[id^='yinhuanFilterSmokeSystem'][id != 'yinhuanFilterSmokeSystem无隐患']")
 					.iCheck("uncheck");
			});

 			//除了无隐患以外的勾选项
			$(":checkbox[id^='yinhuanFilterSmokeSystem'][id != 'yinhuanFilterSmokeSystem无隐患']").
			on('ifChecked',function(event){
 					//console.log('checked');
 					//console.log('other value='+$('#yinhuanSafeLeave未设置').is(':checked'));
 					$("#yinhuanFilterSmokeSystem无隐患").iCheck("uncheck");
			});

			//yinhuanXfDianTi
			$("#yinhuanXfDianTi无隐患").//选择无隐患后，其他项清空
 			on('ifChecked',function(event){
 					//console.log('checked');
 					//console.log('other value='+$('#yinhuanSafeLeave未设置').is(':checked'));
 					$(":checkbox[id^='yinhuanXfDianTi'][id != 'yinhuanXfDianTi无隐患']")
 					.iCheck("uncheck");
			});

 			//除了无隐患以外的勾选项
			$(":checkbox[id^='yinhuanXfDianTi'][id != 'yinhuanXfDianTi无隐患']").
			on('ifChecked',function(event){
 					//console.log('checked');
 					//console.log('other value='+$('#yinhuanSafeLeave未设置').is(':checked'));
 					$("#yinhuanXfDianTi无隐患").iCheck("uncheck");
			});

			//yinhuanDianLanJin
			$("#yinhuanDianLanJin无隐患").//选择无隐患后，其他项清空
 			on('ifChecked',function(event){
 					//console.log('checked');
 					//console.log('other value='+$('#yinhuanSafeLeave未设置').is(':checked'));
 					$(":checkbox[id^='yinhuanDianLanJin'][id != 'yinhuanDianLanJin无隐患']")
 					.iCheck("uncheck");
			});

 			//除了无隐患以外的勾选项
			$(":checkbox[id^='yinhuanDianLanJin'][id != 'yinhuanDianLanJin无隐患']").
			on('ifChecked',function(event){
 					//console.log('checked');
 					//console.log('other value='+$('#yinhuanSafeLeave未设置').is(':checked'));
 					$("#yinhuanDianLanJin无隐患").iCheck("uncheck");
			});

			
 			/* Test OK
 			for(var k in b_addr_arr)
 				console.log(b_addr_arr[k]);
 			for(var kk in b_id_arr)
 				console.log(b_id_arr[kk]);
			*/
			//ajax方法只能执行一次，不能重复binding到一个selector
			//for(var bno=0; bno < b_addr_arr.length; bno++){//这里也不能用循环
			/*
				$('#buildinglist').on('click','p',function(){
					var url = "GetBuildingAction";
					var data = $(this).text();
					var index = data.indexOf('--');
					var data1 = data.substring(0,index);
					var data2 = data.substring(index+2,data.length-1);
					var senddata={buildingId:data2, buildingAddr:data1};

					$.ajax({
						type:"post",
						async:false,
						url:url,
						data:senddata,
						timeout:1000,
						success:function(resp){
							console.log("got it " + resp);
						},
						error:function(){
							alert("数据请求失败，请稍后再试！");
						}
					})
				})
			*/
			
			//}	 					
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
			<div  sytle="color:#fff" class=""><h3>建筑信息检查</h3></div>
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
				<div class="col-lg-12  col-md-12 col-sm-12">
					<h2 id="cellnametitle" data-scroll-reveal="enter from the bottom after 0.1s" class="header-line" >
					 	<!--use jquery add content:cellName小区名称-->
					 	&nbsp;&nbsp;
					 
					</h2>
				 
				</div>

			</div>

			<div style ="border:0;height:1px;background:#AFAFAF"></div>

		 <!--/.HEADER LINE END-->		   
			 <div class="col-lg-12  col-md-12 col-sm-12">
				<form 	role = "form" id="zj_info_collect_form" name="zjform" action="SetBuildAction" method="post">
					<!--TODO 这里的变量需要修改-->
					<input id="cellName" name="cellName" type="hidden" value=""/>
					<input id="buildingAddr" name="buildingAddr" type="hidden" value=""/>
					<input id="buildingId" name="buildingId" type="hidden" value=""/>

					<!--TODO END-->

					<div>
						<div class="div-a">
							<h4><span style="color:red">*</span>疏散通道(个)&nbsp;&nbsp;:</h4>
						</div>	
						<div class="div-b">			
						<input type="number" min="0"  id="leaveRoad" name="leaveRoad" class="input-me " style="width:130px;margin-top:2%" required="required"  placeholder="请填入数字" />
						</div>
					</div>

					<div  style ="clear:both; border:0;height:1px;background:#AFAFAF"></div>
					<!--done-->

					<div>
						<div class="div-a">
							<h4><span style="color:red">*</span>安全出口(个)&nbsp;&nbsp;:</h4>
						</div>	
						<div class="div-b">			
						<input type="number" min="0" id="safeLeaveRoad" name="safeLeaveRoad" class="input-me " style="width:130px;margin-top:2%" required="required"  placeholder="请填入数字" />
						</div>
					</div>

					<div  style ="clear:both; border:0;height:1px;background:#AFAFAF"></div>
					<!--done-->
					
					<div>
						<div class="div-a">
							<h4><span style="color:red">*</span>独居老人人数&nbsp;&nbsp;:</h4>
						</div>	
						<div class="div-b">			
						<input type="number" min="0" id="singleOldPersonCount" name="singleOldPersonCount" class="input-me " style="width:100px;margin-top:2%" required="required"  placeholder="请填入数字" />
						</div>
					</div>

					<div  style ="clear:both; border:0;height:1px;background:#AFAFAF"></div>
					<!--done-->

					<div>
						<div class="div-a">
							<h4><span style="color:red">*</span>简易喷淋系统(套)&nbsp;&nbsp;:</h4>
						</div>	
						<div class="div-b">			
						<input type="number" min="0" id="jyplSystemCount" name="jyplSystemCount" class="input-me " style="width:90px;margin-top:2%" required="required"  placeholder="数字" />
						</div>
					</div>

					<div  style ="clear:both; border:0;height:1px;background:#AFAFAF"></div>
					<!--done-->

					<div>
						<div class="div-a">
							<h4><span style="color:red">*</span>独立式感烟探测器(个)&nbsp;&nbsp;:</h4>
						</div>	
						<div class="div-b">			
						<input type="number" min="0" id="monitorSmokingCount" name="monitorSmokingCount" class="input-me " style="width:90px;margin-top:2%" required="required"  placeholder="数字" />
						</div>
					</div>

					<div  style ="clear:both; border:0;height:1px;background:#AFAFAF"></div>
					<!--done-->



					<div >
						<div class="div-a">
							<h4><span style="color:red">*</span>建筑消防设施（多选）:</h4>
						</div>
						<div class="div-b">
							<ul style="list-style:none;">
						    <li>
						    <input type="checkbox" name="xfss" id="xfss" value="室内消火栓系统" />室内消火栓系统
							</li>
							<li>
						    <input type="checkbox" name="xfss" id="xfss" value="自动灭火系统" />
						    自动灭火系统
							</li>
							<li>
						    <input type="checkbox" name="xfss" id="xfss" value="火灾自动报警系统" />火灾自动报警系统
							</li>
							<li>
						    <input type="checkbox" name="xfss" id="xfss" value="防烟和排烟设施" />防烟和排烟设施
						    </li>
							<li>
						    <input type="checkbox" name="xfss" id="xfss" value="消防应急照明" />
						    消防应急照明
						    </li>
							<li>
						    <input type="checkbox" name="xfss" id="xfss" value="疏散指示标志" />
						    疏散指示标志
						    </li>
							<li>
						    <input type="checkbox" name="xfss" id="xfss" value="消防电梯" />消防电梯
						    </li>
							<li>
						    <input type="checkbox" name="xfss" id="xfss" value="灭火器" />灭火器
						    </li>
							<li>
						    <input type="checkbox" name="xfss" id="xfss" value="其他" />其他

						    <input type="text" id="xfssOther" name="xfssOther" class="input-me" 
						placeholder="其他详情" style="width:60px;border-bottom: 1px #98CBF7;"  />
						    </li>
							
							</ul>
						</div>

					</div>

					<div  style ="clear:both; border:0;height:1px;background:#AFAFAF"></div>
					<!--end add 建筑消防设施 done-->
					

					<hr />
					<h3>主要消防隐患</h3>
					<hr />
					<!--安全疏散-->
					<div >
						<div class="div-a" style="width:40%">
							<span style="color:red">*</span>安全疏散(通道、出口、楼梯)（多选）:
						</div>
						<div class="div-b" style="width:55%">
							<ul style="list-style:none;">
						    <li>
						    <input type="checkbox" name="yinhuanSafeLeave" id="yinhuanSafeLeave无隐患" value="无隐患"  />无隐患
							</li>
							<li>
						    <input type="checkbox" name="yinhuanSafeLeave" id="yinhuanSafeLeave未设置" value="未设置" />未设置
						    </li>
							<li>
						    <input type="checkbox" name="yinhuanSafeLeave" id="yinhuanSafeLeave消防通道阻塞" value="消防通道阻塞" />消防通道阻塞
						    </li>
							<li>
						    <input type="checkbox" name="yinhuanSafeLeave" id="yinhuanSafeLeave安全出口阻塞或锁闭" value="安全出口阻塞或锁闭" />安全出口阻塞或锁闭
						    </li>
							<li>
						    <input type="checkbox" name="yinhuanSafeLeave" id="yinhuanSafeLeave未设置前室" value="未设置前室" />
						    未设置前室
						    </li>
							<li>
						    <input type="checkbox" name="yinhuanSafeLeave" id="yinhuanSafeLeave疏散宽度不足" value="疏散宽度不足" />
						    疏散宽度不足
						    </li>
							<li>
						    <input type="checkbox" name="yinhuanSafeLeave" id="yinhuanSafeLeave通向疏散通道、楼梯的防火门未按要求设置" value="通向疏散通道、楼梯的防火门未按要求设置" />通向疏散通道、楼梯的防火门未按要求设置
						    </li>
							<li>
						    <input type="checkbox" name="yinhuanSafeLeave" id="yinhuanSafeLeave其他" value="其他" />其他
						    <input type="text" id="yinhuanSafeLeaveOther" name="yinhuanSafeLeaveOther" class="input-me" 
						placeholder="其他详情" style="width:80px;border-bottom: 1px #98CBF7;"/>
						    </li>

						</div>
					</div>

					<div  style ="clear:both; border:0;height:1px;background:#AFAFAF"></div>
					<!--end add 安全疏散 done-->



					<!--应急照明-->
					<div >
						<div class="div-a">
							<span style="color:red">*</span>应急照明（多选）:
						</div>
						<div class="div-b">
						<ul style="list-style:none;">
						    <li>
						    <input type="checkbox" name="yinhuanYjzmDevice" id="yinhuanYjzmDevice无隐患" value="无隐患" />无隐患
							</li>
							<li>
						    <input type="checkbox" name="yinhuanYjzmDevice" id="yinhuanYjzmDevice未设置" value="未设置" />未设置
						    </li>
							<li>
						    <input type="checkbox" name="yinhuanYjzmDevice" id="yinhuanYjzmDevice配置不符合要求" value="配置不符合要求" />配置不符合要求
						    </li>
							<li>
						    <input type="checkbox" name="yinhuanYjzmDevice" id="yinhuanYjzmDevice损坏" value="损坏" />损坏
						    </li>
							<li>
						    <input type="checkbox" name="yinhuanYjzmDevice" id="yinhuanYjzmDevice其他" value="其他" />其他
						    <input type="text" id="yinhuanYjzmDeviceOther" name="yinhuanYjzmDeviceOther" class="input-me" 
						placeholder="其他详情" style="width:70px;border-bottom: 1px #98CBF7;" />
						    </li>
						</ul>
							
						</div>
					</div>

					<div  style ="clear:both; border:0;height:1px;background:#AFAFAF"></div>
					<!--end add 应急照明 done-->

					<!--疏散指示标志-->
					<div >
						<div class="div-a" style="width:40%">
							<span style="color:red">*</span>疏散指示标志（多选）:
						</div>
						<div class="div-b">
							<ul style="list-style:none;">
						    <li>
						    <input type="checkbox" name="yinhuanLeaveItem" id="yinhuanLeaveItem无隐患" value="无隐患" />无隐患
						    </li>
							<li>
						    <input type="checkbox" name="yinhuanLeaveItem" id="yinhuanLeaveItem未设置" value="未设置" />未设置
						    </li>
							<li>
						    <input type="checkbox" name="yinhuanLeaveItem" id="yinhuanLeaveItem配置不符合要求" value="配置不符合要求" />配置不符合要求
						    </li>
							<li>
						    <input type="checkbox" name="yinhuanLeaveItem" id="yinhuanLeaveItem损坏" value="损坏" />损坏
						    </li>
							<li>
						    <input type="checkbox" name="yinhuanLeaveItem" id="yinhuanLeaveItem其他" value="其他" />其他
						    <input type="text" id="yinhuanLeaveItemOther" name="yinhuanLeaveItemOther" class="input-me" 
						placeholder="其他详情" style="width:80px;border-bottom: 1px #98CBF7;"  />
						    </li>
						</ul>
							
						</div>
					</div>

					<div  style ="clear:both; border:0;height:1px;background:#AFAFAF"></div>
					<!--end add 疏散指示标志 done-->

					<!--消防给水-->
					<div >
						<div class="div-a" style="width:40%">
							<span style="color:red">*</span>消防给水（多选）:
						</div>
						<div class="div-b" style="width:55%">
							<ul style="list-style:none;">
						    <li>
						    <input type="checkbox" name="yinhuanXfGiveWater" id="yinhuanXfGiveWater无隐患" value="无隐患" />无隐患
						     </li>
							<li>

						    <input type="checkbox" name="yinhuanXfGiveWater" id="yinhuanXfGiveWater未设置" value="未设置" />未设置
						     </li>
							<li>
						    <input type="checkbox" name="yinhuanXfGiveWater" id="yinhuanXfGiveWater消防水池或消防水箱无水" value="消防水池或消防水箱无水" />消防水池或消防水箱无水
						     </li>
							<li>
						    <input type="checkbox" name="yinhuanXfGiveWater" id="yinhuanXfGiveWater消防水池或消防水箱不能正常使用" value="消防水池或消防水箱不能正常使用" />消防水池或消防水箱不能正常使用
						     </li>
							<li>
						    <input type="checkbox" name="yinhuanXfGiveWater" id="yinhuanXfGiveWater其他" value="其他" />其他
						    <input type="text" id="yinhuanXfGiveWaterOther" name="yinhuanXfGiveWaterOther" class="input-me" 
						placeholder="其他详情" style="width:80px;border-bottom: 1px #98CBF7;" />
						     </li>
							</ul>
						</div>
					</div>

					<div  style ="clear:both; border:0;height:1px;background:#AFAFAF"></div>
					<!--end add 消防给水 done-->

					<!--室内消火栓系统-->
					<div >
						<div class="div-a" style="width:40%">
							<span style="color:red">*</span>室内消火栓系统（多选）:
						</div>
						<div class="div-b" style="width:55%">
							<ul style="list-style:none;">
						    <li>
						    <input type="checkbox" name="yinhuanInnerKillFireSystem" id="yinhuanInnerKillFireSystem无隐患" value="无隐患" />无隐患
						    </li>
							<li>
						    <input type="checkbox" name="yinhuanInnerKillFireSystem" id="yinhuanInnerKillFireSystem无水-设施损坏" value="无水-设施损坏" />无水-设施损坏
						    </li>
							<li>
						    <input type="checkbox" name="yinhuanInnerKillFireSystem" id="yinhuanInnerKillFireSystem无水-市政管网无水" value="无水-市政管网无水" />无水-市政管网无水
						    </li>
							<li>
						    <input type="checkbox" name="yinhuanInnerKillFireSystem" id="yinhuanInnerKillFireSystem水压不足-设施损坏" value="水压不足-设施损坏" />水压不足-设施损坏
						    </li>
							<li>
						    <input type="checkbox" name="yinhuanInnerKillFireSystem" id="yinhuanInnerKillFireSystem水压不足-市政管网水压无水" value="水压不足-市政管网水压无水" />水压不足-市政管网水压无水
						    </li>
							<li>
						    <input type="checkbox" name="yinhuanInnerKillFireSystem" id="yinhuanInnerKillFireSystem其他" value="其他" />其他
						    <input type="text" id="yinhuanInnerKillFireSystemOther" name="yinhuanInnerKillFireSystemOther" class="input-me" 
						placeholder="其他详情" style="width:80px;border-bottom: 1px #98CBF7;" />
						    </li>
							</ul>
						</div>
					</div>

					<div  style ="clear:both; border:0;height:1px;background:#AFAFAF"></div>
					<!--end add 室内消火栓系统 done-->


					<!--自动灭火系统-->
					<div >
						<div class="div-a" style="width:40%">
							<span style="color:red">*</span>自动灭火系统（多选）:
						</div>
						<div class="div-b" style="width:55%">
							<ul style="list-style:none;">
						    <li>
						    <input type="checkbox" name="yinhuanAutoKillFireSystem" id="yinhuanAutoKillFireSystem无隐患" value="无隐患" />无隐患
						    </li>
							<li>
						    <input type="checkbox" name="yinhuanAutoKillFireSystem" id="yinhuanAutoKillFireSystem未设置" value="未设置" />未设置
						    </li>
							<li>
						    <input type="checkbox" name="yinhuanAutoKillFireSystem" id="yinhuanAutoKillFireSystem喷头损坏" value="喷头损坏" />喷头损坏
						    </li>
							<li>
						    <input type="checkbox" name="yinhuanAutoKillFireSystem" id="yinhuanAutoKillFireSystem无水" value="无水" />无水
						    </li>
							<li>
						    <input type="checkbox" name="yinhuanAutoKillFireSystem" id="yinhuanAutoKillFireSystem其他" value="其他" />其他
						    <input type="text" id="yinhuanAutoKillFireSystemOther" name="yinhuanAutoKillFireSystemOther" class="input-me" 
						placeholder="其他详情" style="width:80px;border-bottom: 1px #98CBF7;" />
						    </li>
							</ul>
							
						</div>

					</div>

					<div  style ="clear:both; border:0;height:1px;background:#AFAFAF"></div>
					<!--end add 自动灭火系统 done-->

					<!--火灾自动报警系统-->
					<div >
						<div class="div-a" style="width:40%">
							<span style="color:red">*</span>火灾自动报警系统（多选）:
						</div>
						<div class="div-b" style="width:55%">
							<ul style="list-style:none;">
						    <li>
						    <input type="checkbox" name="yinhuanFireAutoReportSystem" id="yinhuanFireAutoReportSystem无隐患" value="无隐患" />无隐患
						    </li>
							<li>
						    <input type="checkbox" name="yinhuanFireAutoReportSystem" id="yinhuanFireAutoReportSystem未设置" value="未设置" />未设置
						    </li>
							<li>
						    <input type="checkbox" name="yinhuanFireAutoReportSystem" id="yinhuanFireAutoReportSystem不能正常使用" value="不能正常使用" />不能正常使用
						    </li>
							<li>
						    
						    <input type="checkbox" name="yinhuanFireAutoReportSystem" id="yinhuanFireAutoReportSystem其他" value="其他" />其他
						    <input type="text" id="yinhuanFireAutoReportSystemOther" name="yinhuanFireAutoReportSystemOther" class="input-me" 
						placeholder="其他详情" style="width:80px;border-bottom: 1px #98CBF7;" />
						    </li>
							</ul>
						</div>
					</div>

					<div  style ="clear:both; border:0;height:1px;background:#AFAFAF"></div>
					<!--end add 自动报警系统 done-->



					<!--排烟和防烟设施-->
					<div >
						<div class="div-a" style="width:40%">
							<span style="color:red">*</span>排烟和防烟设施（多选）:
						</div>
						<div class="div-b" style="width:55%">
							<ul style="list-style:none;">
						    <li>
						    <input type="checkbox" name="yinhuanFilterSmokeSystem" id="yinhuanFilterSmokeSystem无隐患" value="无隐患" />无隐患
						    </li>
							<li>
						    <input type="checkbox" name="yinhuanFilterSmokeSystem" id="yinhuanFilterSmokeSystem未设置" value="未设置" />未设置
						    </li>
							<li>
						    <input type="checkbox" name="yinhuanFilterSmokeSystem" id="yinhuanFilterSmokeSystem不能正常使用" value="不能正常使用" />不能正常使用
						    </li>
							<li>					    
						    <input type="checkbox" name="yinhuanFilterSmokeSystem" id="yinhuanFilterSmokeSystem其他" value="其他" />其他
						    <input type="text" id="yinhuanFilterSmokeSystemOther" name="yinhuanFilterSmokeSystemOther" class="input-me" 
						placeholder="其他详情" style="width:80px;border-bottom: 1px #98CBF7;" />
							</li>
						</ul>
						</div>
					</div>

					<div  style ="clear:both; border:0;height:1px;background:#AFAFAF"></div>
					<!--end add 排烟和防烟设施 done-->


					<!--消防电梯-->
					<div >
						<div class="div-a" style="width:40%">
							<span style="color:red">*</span>消防电梯（多选）:
						</div>
						<div class="div-b" style="width:55%">
							<ul style="list-style:none;">
						    <li>
						    <input type="checkbox" name="yinhuanXfDianTi" id="yinhuanXfDianTi无隐患" value="无隐患" />无隐患
						    </li>
							<li>
						    <input type="checkbox" name="yinhuanXfDianTi" id="yinhuanXfDianTi未设置" value="未设置" />未设置
						    </li>
							<li>
						    <input type="checkbox" name="yinhuanXfDianTi" id="yinhuanXfDianTi不能正常使用" value="不能正常使用" />不能正常使用
						    </li>
							<li>
						    <input type="checkbox" name="yinhuanXfDianTi" id="yinhuanXfDianTi其他" value="其他" />其他
						    <input type="text" id="yinhuanXfDianTiOther" name="yinhuanXfDianTiOther" class="input-me" 
						placeholder="其他详情" style="width:80px;border-bottom: 1px #98CBF7;"  />
						    </li>
							</ul>
						</div>
					</div>

					<div  style ="clear:both; border:0;height:1px;background:#AFAFAF"></div>
					<!--end add 消防电梯 done-->


					<!--电梯井-->
					<div >
						<div class="div-a" style="width:40%">
							<span style="color:red">*</span>电缆井（多选）:
						</div>
						<div class="div-b" style="width:55%">
							<ul style="list-style:none;">
						    <li>
						    <input type="checkbox" name="yinhuanDianLanJin" id="yinhuanDianLanJin无隐患" value="无隐患" />无隐患
						    </li>
							<li>
						    <input type="checkbox" name="yinhuanDianLanJin" id="yinhuanDianLanJin管道并未封堵或不符合要求" value="管道并未封堵或不符合要求" />管道并未封堵或不符合要求
						    </li>
							<li>
						    <input type="checkbox" name="yinhuanDianLanJin" id="yinhuanDianLanJin电气线路敷设不符合要求" value="电气线路敷设不符合要求" />电气线路敷设不符合要求
						    </li>
							<li>
						    <input type="checkbox" name="yinhuanDianLanJin" id="yinhuanDianLanJin防火门设置不符合要求" value="防火门设置不符合要求" />防火门设置不符合要求
						    </li>
							<li> 
						    <input type="checkbox" name="yinhuanDianLanJin" id="yinhuanDianLanJin其他" value="其他" />其他
						    <input type="text" id="yinhuanDianLanJinOther" name="yinhuanDianLanJinOther" class="input-me" 
						placeholder="其他详情" style="width:80px;border-bottom: 1px #98CBF7;"  />
							</li>
						</ul>
						</div>
					</div>

					<div  style ="clear:both; border:0;height:1px;background:#AFAFAF"></div>
					<!--end add 电梯井 done-->

					
					<div class="form-group">
						<button type="submit" class="btn btn-info btn-block btn-lg">数据提交</button>
					</div>

				</form>
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
