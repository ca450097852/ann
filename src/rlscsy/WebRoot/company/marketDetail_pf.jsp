<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.hontek.comm.base.LoginUser"%>
<%@page import="com.hontek.sys.pojo.EntStyle"%>
<%@page import="com.hontek.company.pojo.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
Object obj = session.getAttribute("loginCompany");
Company enterprise = (Company)obj;
if(obj==null){
	response.sendRedirect("ajaxSessionTimeoutToCom.action");
	return;
}
//批次ID
String miibId = request.getParameter("miibId");
String ptbId = request.getParameter("ptbId");

//批次名称
String batchName = request.getParameter("batchName");
batchName = batchName==null ? "" : batchName;
batchName = java.net.URLDecoder.decode(batchName , "UTF-8");

//批次日期
String inDate = request.getParameter("inDate");
inDate = inDate==null ? "" : inDate;


EntStyle companyStyle = session.getAttribute("companyStyle")==null?null:(EntStyle)session.getAttribute("companyStyle");
String styleFile = "blue";
if(companyStyle!=null){
	if(companyStyle.getScCss()!=null && !"".equals(companyStyle.getScCss())){
		styleFile = companyStyle.getScCss();
	}
}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>肉类蔬菜进场明细</title>
<link type="text/css" rel="stylesheet" href="<%=styleFile %>/css/all_style.css"/>
<script src="<%=basePath %>static/js/jquery/jquery-1.8.0.min.js"　type="text/javascript"></script>

<script src="<%=basePath %>static/js/easyui-1.3.4/jquery.easyui.min.js"　type="text/javascript"></script>
<script src="<%=basePath %>static/js/easyui-1.3.4/locale/easyui-lang-zh_CN.js" type="text/javascript"></script>
<script language="JavaScript" src="<%=basePath %>static/js/layer/layer.js"></script>
<script type="text/javascript" src="js/marketDetail_pf.js"></script>

<link href="<%=styleFile %>/css/style.css" rel="stylesheet" type="text/css" />
<link href="<%=basePath %>static/js/easyui-1.3.4/themes/bootstrap/easyui.css" id="easyuiTheme" rel="stylesheet" type="text/css"/>	

<script type="text/javascript" src="<%=basePath %>static/js/fancybox/jquery.mousewheel-3.0.4.pack.js"></script>
<script type="text/javascript" src="<%=basePath %>static/js/fancybox/jquery.fancybox-1.3.4.pack.js"></script>
<link rel="stylesheet" type="text/css" href="<%=basePath %>static/js/fancybox/jquery.fancybox-1.3.4.css" media="screen" />

<script type="text/javascript" src="<%=basePath %>uploadify/jquery.uploadify.js"></script>
<link rel="stylesheet" href="<%=basePath %>uploadify/uploadify.css" type="text/css"></link>

<style type="text/css">
.weitianxie table td{line-height:25px;text-align: center;}

.combo .combo-text {
    border: 0 none;
    font-size: 12px;
    margin: 0;
    padding: 0 2px;
    vertical-align: top;
}
#proImgInfo td{line-height:20px;text-align: left;}

#proImgList table td input {
    border: 1px solid #ccc;
    height: 25px;
    width: 300px;
}

</style>


</head>


<body>
	<input type="hidden" id="basePath" value="<%=basePath %>"/>
	<input type="hidden" id="ptbId" value="<%=ptbId %>"/>
	<input type="hidden" id="batchName" value="<%=batchName %>"/>
	<input type="hidden" id="comType" value="<%=enterprise.getComType() %>"/> 
	<div class="place">
	    <span>位置：</span>
	    <ul class="placeul">
	    <li><a href="proTypeBatch.jsp" target="rightFrame" level="1"><%=batchName %></a></li>
	    <li><a id="goPro" href="" target="rightFrame" level="1">进场基本信息（<%=inDate %>）</a></li>
	    <li>进场信息明细</li>
	    </ul>
	</div>
	   
    <div class="rightinfo">
    
    <div class="tools">
    
    	<ul class="toolbar">
        <li class="click" onclick="addRecord();"><span><img src="images/t01.png" /></span>添加</li>
        </ul>
        
    </div>
    
    <div id='proDiv'>
	    <table id="proTab" class="tablelist">
	    	<thead>
	    	<tr>
	    	<th>商品编码</th>	    	
	        <th>商品名称</th>
	        <th>重量</th>
	        <th>产地编码</th>
	        <th>产地名称</th>
	        <th>生产基地（种植户）</th>
	        <th>供货屠宰厂或批发市场编码</th>
	        <th>供货屠宰厂或批发市场名称</th>
	        <th>零售凭证号</th>
	        <th>操作</th>
	        </tr>
	        </thead>
	        <tbody>
	        </tbody>
	    </table>
    
   
	    <div class="pagin">
	    	<div class="message">共<i class="blue" id="total">0</i>条记录，当前显示第&nbsp;<i class="blue" id="page">0</i>&nbsp;页</div>
	        <ul class="paginList">
	        </ul>
	    </div>
	    
    </div>
    
    <div class="center_content3" style="display: none;">
	    
	   <input type="hidden" id="h_miibId" value="<%=miibId %>"/>
	    
	    <div class="formbody">
	    
	    <div class="formtitle"><span>添加档案</span></div>
			<div style="width: 100%" >
	    		<table style="width: 100%">
	    		<tr>
	    		<td style="width: 65%;" valign="top">
	    			<form id="recordForm" method="post">
			    	<input type="hidden" name="marketInInfoDetail.miibId" value="<%=miibId %>"/>
			    	<input type="hidden" name="marketInInfoDetail.miidId" />
			    	
			    	
			    	<input type="hidden" name="marketInInfoDetail.tranId" />
			    	<input type="hidden" name="marketInInfoDetail.quarantineAnimalProductsId" />
			    	<input type="hidden" name="marketInInfoDetail.inspectionMeatId" />
			    	<input type="hidden" name="marketInInfoDetail.provId" />
			    	<input type="hidden" name="marketInInfoDetail.quarantineVegeId" />
			    	<input type="hidden" name="marketInInfoDetail.batchId" />
			    	
			    	
			    	<table class="formtable">
			    		<tr>
			    			<td class="form_label">商品编码</td>
			    			<td class="form_value"><input name="marketInInfoDetail.goodsCode"  type="text"  class="easyui-validatebox" data-options="required:true"/></td>
			    		</tr>
			    		<tr>
			    			<td class="form_label">商品名称</td>
			    			<td class="form_value"><input name="marketInInfoDetail.goodsName"  type="text"  class="easyui-validatebox" data-options="required:true"/></td>
			    		</tr>
			    		<tr>
			    			<td class="form_label">重量</td>
			    			<td class="form_value"><input name="marketInInfoDetail.weight"  type="text"  class="easyui-validatebox" data-options="required:true"/></td>
			    		</tr>
			    		<tr>
			    			<td class="form_label">产地编码</td>
			    			<td class="form_value">
			    			<input name="marketInInfoDetail.areaOriginId" type="text" class="easyui-validatebox" data-options="required:true" />
			    			</td>
			    		</tr>
			    		<tr>
			    			<td class="form_label">产地名称</td>
			    			<td class="form_value"><input name="marketInInfoDetail.areaOriginName" type="text" class="easyui-validatebox" data-options="required:true" /></td>
			    		</tr>
			    		<tr>
			    			<td class="form_label">生产基地（种植户）</td>
			    			<td class="form_value"><input name="marketInInfoDetail.baseName" type="text" class="easyui-validatebox" data-options="required:true" /></td>
			    		</tr>
			    		<tr>
			    			<td class="form_label">供货屠宰厂或批发市场编码</td>
			    			<td class="form_value"><input name="marketInInfoDetail.wsSupplierId" type="text" class="easyui-validatebox" data-options="required:true" /></td>
			    		</tr>
			    		<tr>
			    			<td class="form_label">供货屠宰厂或批发市场名称</td>
			    			<td class="form_value"><input name="marketInInfoDetail.wsSupplierName" type="text" class="easyui-validatebox" data-options="required:true" /></td>
			    		</tr>
			    		<tr>
			    			<td class="form_label">零售凭证号</td>
			    			<td class="form_value"><input name="marketInInfoDetail.saleTranId" type="text" class="easyui-validatebox" data-options="required:true" /></td>
			    		</tr>
			    	</table>
			    </form>
	    		</td>
	    		<td style="width: 35%;">
	    		<!-- 提示信息 -->
			        <div style="width: 350px;height: 300px;float: right;">
				   		<div class="point" id="useguide">
				        </div>
			    	</div>
	
	    		</td>
	    		</tr>
	    	</table>
				                
	    </div>
	    
	     <ul class="forminfo">
			    <li><input id="subBut" name="" type="button" class="btn" onclick="submitForm();" value="确认保存"/>
			    	<label>&nbsp;</label><input name="" type="button" class="btn" onclick="exitContent();" value="取消"/>
			    </li>
		  </ul>
		    
		    
	    </div>
	    
	    
    </div>
    
    </div>
    
    <script type="text/javascript">
	$('.tablelist tbody tr:odd').addClass('odd');
	</script>
	<input type="hidden" id="h_entId" value="<%=((LoginUser)session.getAttribute("loginUser")).getEntId() %>"/>
    <input type="hidden" id="sessionId" value="<%=session.getId() %>"/>
</body>

</html>
