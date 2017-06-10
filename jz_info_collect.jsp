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
	%>
	<script>
		
 		$().ready(function (){
 			$("select").select2({
 				tags:true,
 				//minimumResultsForSearch:-1,
 				closeOnSelect:false,
 				'width':'280px'
 			});
 			$(".select2-search,.select2-focusser").remove();

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
 				//item_v是一个建筑的object，里面有buildingAddr和buildingId两个成员
 				console.log("item="+item+"  value="+item_v);
 								
 			}
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
					<input id="buildingName" name="buildingName" type="hidden" value=""/>
					<!--TODO END-->

					<div>
						<div class="div-a">
							<h4><span style="color:red">*</span>疏散通道(个)&nbsp;&nbsp;:</h4>
						</div>	
						<div class="div-b">			
						<input type="number" id="leaveRoad" name="leaveRoad" class="input-me " style="width:130px;margin-top:2%" required="required"  placeholder="请填入数字" />
						</div>
					</div>

					<div  style ="clear:both; border:0;height:1px;background:#AFAFAF"></div>
					<!--done-->

					<div>
						<div class="div-a">
							<h4><span style="color:red">*</span>安全出口(个)&nbsp;&nbsp;:</h4>
						</div>	
						<div class="div-b">			
						<input type="number" id="safeLeaveRoad" name="safeLeaveRoad" class="input-me " style="width:130px;margin-top:2%" required="required"  placeholder="请填入数字" />
						</div>
					</div>

					<div  style ="clear:both; border:0;height:1px;background:#AFAFAF"></div>
					<!--done-->
					
					<div>
						<div class="div-a">
							<h4><span style="color:red">*</span>独居老人人数&nbsp;&nbsp;:</h4>
						</div>	
						<div class="div-b">			
						<input type="number" id="singleOldPersonCount" name="singleOldPersonCount" class="input-me " style="width:100px;margin-top:2%" required="required"  placeholder="请填入数字" />
						</div>
					</div>

					<div  style ="clear:both; border:0;height:1px;background:#AFAFAF"></div>
					<!--done-->

					<div>
						<div class="div-a">
							<h4><span style="color:red">*</span>简易喷淋系统(套)&nbsp;&nbsp;:</h4>
						</div>	
						<div class="div-b">			
						<input type="number" id="jyplSystemCount" name="jyplSystemCount" class="input-me " style="width:90px;margin-top:2%" required="required"  placeholder="数字" />
						</div>
					</div>

					<div  style ="clear:both; border:0;height:1px;background:#AFAFAF"></div>
					<!--done-->

					<div>
						<div class="div-a">
							<h4><span style="color:red">*</span>独立式感烟探测器(个)&nbsp;&nbsp;:</h4>
						</div>	
						<div class="div-b">			
						<input type="number" id="monitorSmokingCount" name="monitorSmokingCount" class="input-me " style="width:90px;margin-top:2%" required="required"  placeholder="数字" />
						</div>
					</div>

					<div  style ="clear:both; border:0;height:1px;background:#AFAFAF"></div>
					<!--done-->



					<div >
						<div class="div-c1">
							<h4><span style="color:red">*</span>建筑消防设施（多选）:</h4>
						</div>
						<div class="div-c2">
						    <input type="checkbox" name="xfss" id="xfss" value="室内消火栓系统" />室内消火栓系统
						    <input type="checkbox" name="xfss" id="xfss" value="自动灭火系统" />
						    自动灭火系统
						    <input type="checkbox" name="xfss" id="xfss" value="火灾自动报警系统" />火灾自动报警系统
						    <input type="checkbox" name="xfss" id="xfss" value="防烟和排烟设施" />防烟和排烟设施
						    <input type="checkbox" name="xfss" id="xfss" value="消防应急照明" />
						    消防应急照明
						    <input type="checkbox" name="xfss" id="xfss" value="疏散指示标志" />
						    疏散指示标志
						    <input type="checkbox" name="xfss" id="xfss" value="消防电梯" />消防电梯
						    <input type="checkbox" name="xfss" id="xfss" value="灭火器" />灭火器
						    <input type="checkbox" name="xfss" id="xfss" value="其他" />其他

						</div>

						<div class="div-c3">
						<input type="text" id="xfssOther" name="xfssOther" class="input-me" 
						placeholder="其他详情" style="width:60px;margin-top:265%;border-bottom: 1px #98CBF7;" required="required" />
						</div>
					</div>

					<div  style ="clear:both; border:0;height:1px;background:#AFAFAF"></div>
					<!--end add 建筑消防设施 done-->
					

					<hr />
					<h3>主要消防隐患</h3>
					<hr />
					<!--安全疏散-->
					<div >
						<div class="div-c1" style="width:30%">
							<span style="color:red">*</span>安全疏散(通道、出口、楼梯)（多选）:
						</div>
						<div class="div-c2" style="width:50%">
						    <input type="checkbox" name="yinhuanSafeLeave" id="yinhuanSafeLeave" value="无隐患" />无隐患
						    <input type="checkbox" name="yinhuanSafeLeave" id="yinhuanSafeLeave" value="未设置" />
						    未设置
						    <input type="checkbox" name="yinhuanSafeLeave" id="yinhuanSafeLeave" value="消防通道阻塞" />消防通道阻塞
						    <input type="checkbox" name="yinhuanSafeLeave" id="yinhuanSafeLeave" value="安全出口阻塞或锁闭" />安全出口阻塞或锁闭
						    <input type="checkbox" name="yinhuanSafeLeave" id="yinhuanSafeLeave" value="未设置前室" />
						    未设置前室
						    <input type="checkbox" name="yinhuanSafeLeave" id="yinhuanSafeLeave" value="疏散宽度不足" />
						    疏散宽度不足
						    <input type="checkbox" name="yinhuanSafeLeave" id="yinhuanSafeLeave" value="通向疏散通道、楼梯的防火门未按要求设置" />通向疏散通道、楼梯的防火门未按要求设置
						    
						    <input type="checkbox" name="yinhuanSafeLeave" id="yinhuanSafeLeave" value="其他" />其他

						</div>

						<div class="div-c3">
						<input type="text" id="yinhuanSafeLeaveOther" name="yinhuanSafeLeaveOther" class="input-me" 
						placeholder="其他详情" style="width:80px;margin-top:230%;border-bottom: 1px #98CBF7;" required="required" />
						</div>
					</div>

					<div  style ="clear:both; border:0;height:1px;background:#AFAFAF"></div>
					<!--end add 安全疏散 done-->



					<!--应急照明-->
					<div >
						<div class="div-c1" style="width:30%">
							<span style="color:red">*</span>应急照明（多选）:
						</div>
						<div class="div-c2" style="width:50%">
						    <input type="checkbox" name="yinhuanYjzmDevice" id="yinhuanYjzmDevice" value="无隐患" />无隐患
						    <input type="checkbox" name="yinhuanYjzmDevice" id="yinhuanYjzmDevice" value="未设置" />未设置
						    <input type="checkbox" name="yinhuanYjzmDevice" id="yinhuanYjzmDevice" value="配置不符合要求" />配置不符合要求
						    <input type="checkbox" name="yinhuanYjzmDevice" id="yinhuanYjzmDevice" value="损坏" />损坏
						    <input type="checkbox" name="yinhuanYjzmDevice" id="yinhuanYjzmDevice" value="其他" />其他
						</div>

						<div class="div-c3">
						<input type="text" id="yinhuanYjzmDeviceOther" name="yinhuanYjzmDeviceOther" class="input-me" 
						placeholder="其他详情" style="width:80px;margin-top:230%;border-bottom: 1px #98CBF7;" required="required" />
						</div>
					</div>

					<div  style ="clear:both; border:0;height:1px;background:#AFAFAF"></div>
					<!--end add 应急照明 done-->

					<!--疏散指示标志-->
					<div >
						<div class="div-c1" style="width:30%">
							<span style="color:red">*</span>疏散指示标志（多选）:
						</div>
						<div class="div-c2" style="width:50%">
						    <input type="checkbox" name="yinhuanLeaveItem" id="yinhuanLeaveItem" value="无隐患" />无隐患
						    <input type="checkbox" name="yinhuanLeaveItem" id="yinhuanLeaveItem" value="未设置" />未设置
						    <input type="checkbox" name="yinhuanLeaveItem" id="yinhuanLeaveItem" value="配置不符合要求" />配置不符合要求
						    <input type="checkbox" name="yinhuanLeaveItem" id="yinhuanLeaveItem" value="损坏" />损坏
						    <input type="checkbox" name="yinhuanLeaveItem" id="yinhuanLeaveItem" value="其他" />其他
						</div>

						<div class="div-c3">
						<input type="text" id="yinhuanLeaveItemOther" name="yinhuanLeaveItemOther" class="input-me" 
						placeholder="其他详情" style="width:80px;margin-top:230%;border-bottom: 1px #98CBF7;" required="required" />
						</div>
					</div>

					<div  style ="clear:both; border:0;height:1px;background:#AFAFAF"></div>
					<!--end add 疏散指示标志 done-->

					<!--消防给水-->
					<div >
						<div class="div-c1" style="width:30%">
							<span style="color:red">*</span>消防给水（多选）:
						</div>
						<div class="div-c2" style="width:50%">
						    <input type="checkbox" name="yinhuanXfGiveWater" id="yinhuanXfGiveWater" value="无隐患" />无隐患
						    <input type="checkbox" name="yinhuanXfGiveWater" id="yinhuanXfGiveWater" value="未设置" />未设置
						    <input type="checkbox" name="yinhuanXfGiveWater" id="yinhuanXfGiveWater" value="消防水池或消防水箱无水" />消防水池或消防水箱无水
						    <input type="checkbox" name="yinhuanXfGiveWater" id="yinhuanXfGiveWater" value="消防水池或消防水箱不能正常使用" />消防水池或消防水箱不能正常使用
						    <input type="checkbox" name="yinhuanXfGiveWater" id="yinhuanXfGiveWater" value="其他" />其他
						</div>

						<div class="div-c3">
						<input type="text" id="yinhuanXfGiveWaterOther" name="yinhuanXfGiveWaterOther" class="input-me" 
						placeholder="其他详情" style="width:80px;margin-top:230%;border-bottom: 1px #98CBF7;" required="required" />
						</div>
					</div>

					<div  style ="clear:both; border:0;height:1px;background:#AFAFAF"></div>
					<!--end add 消防给水 done-->



					<!--室内消火栓系统-->
					<div class="form-group input-group">
						<label for="yinhuanInnerKillFireSystem">
							<h4><span style="color:red">*</span>室内消火栓系统:（必选、多选）</h4>
						</label>
						<div class="form-group input-group">
						    <select id="yinhuanInnerKillFireSystem" name="yinhuanInnerKillFireSystem" class="js-example-basic-multiple form-control" multiple="multiple" required="required" style="width:100%">
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
						    <select id="yinhuanAutoKillFireSystem" name="yinhuanAutoKillFireSystem" class="js-example-basic-multiple form-control" multiple="multiple" required="required"
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
						    <select id="yinhuanFireAutoReportSystem" name="yinhuanFireAutoReportSystem" class="js-example-basic-multiple form-control" multiple="multiple" required="required"
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
						    <select id="yinhuanFilterSmokeSystem" name="yinhuanFilterSmokeSystem" class="js-example-basic-multiple form-control" multiple="multiple" required="required"
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
						    <select id="yinhhuanXfDianTi" name="yinhhuanXfDianTi" class="js-example-basic-multiple form-control" multiple="multiple" required="required"
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
						    <select id="yinhuanDianLanJin" name="yinhuanDianLanJin" class="js-example-basic-multiple form-control" multiple="multiple" required="required"
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
