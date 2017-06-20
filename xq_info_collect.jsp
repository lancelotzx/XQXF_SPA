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
<title>武汉消防</title>
<!-- BOOTSTRAP CORE STYLE CSS -->
<link href="assets/css/bootstrap.css" rel="stylesheet" />
<!-- FONT AWESOME CSS -->
 <!-- FLEXSLIDER CSS -->
<link href="assets/css/flexslider.css" rel="stylesheet" />
<!-- CUSTOM STYLE CSS -->
<link href="assets/css/style.css" rel="stylesheet" />    
<!-- Google	Fonts -->
<link href='http://fonts.googleapis.com/css?family=Open+Sans:400,700,300' rel='stylesheet' type='text/css' />

<script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
<script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<!--
<link href="http://cdn.bootcss.com/select2/4.0.3/css/select2.min.css" rel="stylesheet" type='
text/css' />
<script src="http://cdn.bootcss.com/select2/4.0.3/js/select2.min.js"></script>
-->

<link href="http://cdn.bootcss.com/bootstrap-select/1.12.2/css/bootstrap-select.min.css" rel="stylesheet">
<script src="http://cdn.bootcss.com/bootstrap-select/1.12.2/js/bootstrap-select.min.js"></script>

<link href="assets/css/font-awesome.min.css" rel="stylesheet" />

<style> 
.div-a{ float:left;display:table-cell;vertical-align: middle; width: 52%;height: 50px} 
.div-b{ float:left;display:table-cell;vertical-align: middle; width: 48%} 

.div-c1{ float:left;width:50%;display:table-cell;vertical-align: middle;} 
.div-c2{ float:left;width:30%;display:table-cell;vertical-align: middle;} 
.div-c3{ float:left;width:20%;display:table-cell;vertical-align: middle;} 
.input-me{
	border-top-width: 0px;border-left-width: 0px;border-right-width: 0px;
	font-size: 12pt;background:#f5f5f5;border-bottom: 0px solid #98CBF7;
}


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

.unfinish{
	color:#2f9dce;
}

.optionfont{
	font-size: 18px;
}

</style> 


</head>
<body >
	<%
		String tempCellJsonString = request.getAttribute("cellBean").toString();		
	%>
	<script>


		//用来保存门栋-门牌地址对应关系
		function　Addr_Id_Obj(){
			var ai= new Object();
			ai.id="";
			ai.addr=[];
			return ai;
		}

		var ai_arr = [];

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
 				 	var tvalue = celljsonarr[i];
 				 	if("0" == tvalue){
 				 		tvalue="不用填写，系统自动生成";
 				 	}
 					$("#"+i).html("<h4>"+ tvalue +"</h4>");
 				}
 				else if("buildList" == i){ //建筑列表名字为Addr+'-'+Id,这里进行处理
 					//结构udate
 					var buildingA_I = celljsonarr[i];
 					for(var ii in buildingA_I){//A_I是一个Array(Object),ii=0
 						for(var jj in buildingA_I[ii]){//jj= buildingId/isFinished

 							if("buildingId" == jj){
 								var x = Addr_Id_Obj();
 								x.id = buildingA_I[ii][jj];
 								for(var i = 0;i < buildingA_I[ii]["mpdzList"].length;i++){
 									x.addr.push(buildingA_I[ii]["mpdzList"][i]);
 								}
 								ai_arr.push(x);




 								if("1" != buildingA_I[ii]["isFinished"]){
	 								//没有填完，蓝色
	 								$("#buildingAddr_Id").append("<option data-content=\"<span class='label label-info optionfont'>"+buildingA_I[ii][jj]+"栋"+"</span>\" value="+buildingA_I[ii][jj]+">"+buildingA_I[ii][jj]+"栋</option></hr>");

	 							}
	 							else if("1" == buildingA_I[ii]["isFinished"]){
	 								//填完了，绿色
		 							$("#buildingAddr_Id").append("<option data-content=\"<span class='label label-success optionfontm'>"+buildingA_I[ii][jj]+"栋"+"</span>\" value="+buildingA_I[ii][jj]+">"+buildingA_I[ii][jj]+"栋</option></hr>");

	 							}


 							}


	 					}
 					}
 				}

 					/*
 					console.log("AVC "+buildingA_I);
 					for(var j in buildingA_I)
 					{
 						$("#buildingAddr_Id").append("<option value="+buildingA_I[j]+">"
 							+buildingA_I[j]+"</option>");
 					}
 					*/
 				else if("xiaofangControlRoom"==i
 					||"smallXiaofangStation" == i
 					||"xiaofangCarRoad" == i
 					||"business" == i
 					||"dangerThing" == i
 					||"autoMobile" == i ){
 						if(""!=celljsonarr[i])
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
				 			//var buildingAddr;
				 			var buildingId;
				 			var temp = $("#buildingAddr_Id").val();
				 			//var idex = temp.indexOf('-');
				 			//buildingAddr = temp.substring(0,idex);
				 			//buildingId = temp.substring(idex+1,temp.length-1);//去掉栋字
				 			buildingId = temp;
				 			//$("#buildingAddr").val(buildingAddr);
				 			$("#buildingId").val(buildingId);//提交门栋数据

				 			for(var i in ai_arr){
				 				if(buildingId == ai_arr[i].id){
				 					$("#addr_list_title").empty();
				 					$("#addr_list_title").append("本门栋对应的门牌地址为：");
				 					$("#addr_list_val").empty();
				 					for(var j in ai_arr[i].addr)
				 						$("#addr_list_val").append("<p>"+(ai_arr[i].addr)[j]+"</p>");

				 				}
				 			}

				 			


				      		//$("#xq_info_collect_form").submit();
				  	 })
		});
	</script>


<div class="navbar navbar-inverse navbar-fixed-top col-xs-12" id="menu">
	<div class="container">


		<div class="navbar-header">
			<div class="col-xs-1" style="margin-top:13px">
				<i onclick="javascript:window.location.href=
				'GoToIndexAction'" class="icon-angle-left icon-3x"></i>
			</div>
			
			<div class="col-xs-10" sytle="color:#fff"><h3 class="title">居民小区消防普查</h3></div>
		</div>
	   
	</div>
</div>

  <!--NAVBAR SECTION END-->
   



 
<div id="contact-sec"   >
	   <div class="overlay">
<div class="container set-pad">
	<div class="row">
		<div class="">
			<h2 id="cellnametitle" style="color:#2f9dce" data-scroll-reveal="enter from the bottom after 0.1s" class="header-line" >
			 	<!--use jquery add content:cellName小区名称-->
			 
			</h2>
		 
		</div>

	</div>
	<div style ="border:0;height:3px;background:#AFAFAF"></div>
		 <!--/.HEADER LINE END-->
	
		 <!--/.HEADER LINE END-->
	 
	   
		   
			 <div >
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
						<div class="div-b" style="" id="cellAddr">
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

					

					
					<div>
						<div class="div-a">
							<h4><span style="color:red">*</span>社区消防安全责任人:</h4>
						</div>
						<div class="div-b" >
							<input type="text" id="communityZrrPerson" name="communityZrrPerson" class="input-me" style="width:120px;margin-top:2%" required="required"  placeholder="请填写姓名" />
						</div>
					</div>

					<div  style ="clear:both; border:0;height:1px;background:#AFAFAF"></div>
					<!--end社区消防安全责任人 done-->

					<div >
						<div class="div-a">
							<h4><span style="color:red">*</span>社区民警:</h4>
						</div>
						<div class="div-b">
							<input type="text" id="communityGlrPerson" name="communityGlrPerson" class="input-me " style="width:120px;margin-top:2%" required="required"  placeholder="请填写姓名" />
						</div>
					</div>

					<div  style ="clear:both; border:0;height:1px;background:#AFAFAF"></div>
					<!--end社区消防安全管理人->社区民警 done-->

					<!--add 小区管理主体-->
					<div >
						<div class="div-a" style="">
							<h4><span style="color:red">*</span>小区管理主体:</h4>
						</div>
						<div class="div-b" style="">
							<div>
						    <select id="cellGlzt" name="cellGlzt" class="form-control" required="required">
						    		<option value="" selected="true" disabled="true">请选择
									</option>
									<option value="物业服务企业">物业服务企业</option>
									<option value="居民委员会">居民委员会</option>
									<option value="其他">其他</option>
						    </select>
						    </div>
						    <div class="\">
							<input type="text" id="cellGlztOther" name="cellGlztOther" class="input-me" placeholder="请填入管理主体名称" style="width:130px;" required="required" />
							</div>		  				     	
						</div>
						
					</div>

					<div  style ="clear:both; border:0;height:1px;background:#AFAFAF"></div>
					<!--end add 小区管理主体 done-->

					<div >
						<div class="div-a">
							<h4><span style="color:red">*</span>小区消防安全责任人:</h4>
						</div>
						<div class="div-b">
							<input type="text" id="cellZrrPerson" name="cellZrrPerson" class="input-me " style="width:120px;margin-top:2%" required="required"  placeholder="请填写姓名" />
						</div>
					</div>

					<div  style ="clear:both; border:0;height:1px;background:#AFAFAF"></div>
					<!--end小区消防安全责任人done-->

					<div >
						<div class="div-a">
							<h4><span style="color:red">*</span>小区消防安全管理人:</h4>
						</div>
						<div class="div-b">
							<input type="text" id="cellGlrPerson" name="cellGlrPerson" class="input-me " style="width:120px;margin-top:2%" required="required"  placeholder="请填写姓名" />
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
							<h4><span style="color:red">*</span>小区建筑数量(9层及以下):</h4>
						</div>	
						<div class="div-b">			
						<input type="number" min="0" id="buildingCountLess9" name="buildingCountLess9" class="input-me " style="width:60px;" required="required"  placeholder="请填入数字" />
						</div>
					</div>

					<div  style ="clear:both; border:0;height:1px;background:#AFAFAF"></div>
					<!--done-->

					<div>
						<div class="div-a">
							<h4><span style="color:red">*</span>小区建筑数量(10到33层):</h4>
						</div>	
						<div class="div-b">			
						<input type="number" min="0" id="buildingCount10_33" name="buildingCount10_33" class="input-me " style="width:60px;" required="required"  placeholder="请填入数字" />
						</div>
					</div>

					<div  style ="clear:both; border:0;height:1px;background:#AFAFAF"></div>
					<!--done-->

					<div>
						<div class="div-a">
							<h4><span style="color:red">*</span>小区建筑数量(33层以上):</h4>
						</div>	
						<div class="div-b">			
						<input type="number" min="0" id="buildingCountMore34" name="buildingCountMore34" class="input-me " style="width:60px;" required="required"  placeholder="请填入数字" />
						</div>
					</div>

					<div  style ="clear:both; border:0;height:1px;background:#AFAFAF"></div>
					<!--done-->

					
					
					<div >
						<div class="div-a">
							<h4><span style="color:red">*</span>是否有消防控制室:</h4>
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
							<h4><span style="color:red">*</span>是否有微型消防站:</h4>
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
							<h4><span style="color:red">*</span>是否有消防车道:</h4>
						</div>
						<div class="div-b" style="width:30%">
							<h4><input type="radio" name="xiaofangCarRoad" id="xiaofangCarRoad" value="有" required="required"／>有</h4>
							<h4><input type="radio" name="xiaofangCarRoad" id="xiaofangCarRoad" value="无" required="required"／>无</h4>
						    		  				     	
						</div>
					</div>

					<div  style ="clear:both; border:0;height:1px;background:#AFAFAF"></div>
					<!--消防车道done-->

					
					<div >
						<div class="div-a"><h4>疏散通道(个):</h4></div>
						<div class="div-b" id="leaveRoad" name="leaveRoad">						
						</div>
					</div>
					

					<div  style ="clear:both; border:0;height:1px;background:#AFAFAF"></div>

					<!--end add 疏散通道-->

					<div >
						<div class="div-a"><h4>安全出口(个):</h4></div>
						<div class="div-b" id="safeLeaveRoad" name="safeLeaveRoad">						
						</div>
					</div>
					

					<div  style ="clear:both; border:0;height:1px;background:#AFAFAF"></div>

					<!--end add 安全出口-->

					<div >
						<div class="div-a"><h4>独居老人(个):</h4></div>
						<div class="div-b" id="singleOldPersonCount" name="singleOldPersonCount">						
						</div>
					</div>
					

					<div  style ="clear:both; border:0;height:1px;background:#AFAFAF"></div>

					<!--end add 独居老人个数-->

					<div >
						<div class="div-a"><h4>简易喷淋系统(套):</h4></div>
						<div class="div-b" id="jyplSystemCount" name="jyplSystemCount">						
						</div>
					</div>
					

					<div  style ="clear:both; border:0;height:1px;background:#AFAFAF"></div>

					<!--end add 简易喷淋系统-->

					<div >
						<div class="div-a"><h4>独立式感烟探测器(个):</h4></div>
						<div class="div-b" id="monitorSmokingDeviceCount" name="monitorSmokingDeviceCount">						
						</div>
					</div>
					

					<div  style ="clear:both; border:0;height:1px;background:#AFAFAF"></div>

					<!--end add 独立式感烟探测器-->

					<div >
						<div class="div-a">
							<h4><span style="color:red">*</span>商业出租情况:</h4>
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
							<h4><span style="color:red">*</span>危险物品储存:</h4>
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
							<h4><span style="color:red">*</span>电动车存放:</h4>
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
						    <select id="buildingAddr_Id" name="buildingAddr_Id" class="selectpicker"  data-width="120px" required="required">
						    		<option value="" selected="true" disabled="true">请选择
									</option>
									
						    </select>	
						    <input id="buildingAddr" name="buildingAddr" value="" type="hidden" />
						    <input id="buildingId" name="buildingId" value="" type="hidden">	  				     	
						</div>
						
					</div>
					<div  style ="clear:both; border:0;height:1px;background:#AFAFAF"></div>
					<!--小区建筑选择end-->
					<!--门牌地址表-->
					<div class="container">
						<div class="div-a">
							<h4 id="addr_list_title">

							</h4>
						</div>
						<div class="div-b" id="addr_list_val">

						    	  				     	
						</div>
						
					</div>
					
					<div class="form-group">
						<button id="xq_submit" type="submit" class="btn btn-info btn-block btn-lg"
						style="background-color:#2f9dce">数据提交</button>
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
