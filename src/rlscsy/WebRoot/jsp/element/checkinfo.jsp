<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String filePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+"/nytsyFiles/element/";

String recId = request.getParameter("recId");
String flagStr = request.getParameter("flag");
boolean flag = "out".equals(flagStr);
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>检验记录</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link href="${basePath}static/js/easyui-1.3.4/themes/icon.css" rel="stylesheet" type="text/css"/>
	<link href="${basePath}static/js/easyui-1.3.4/demo/demo.css" rel="stylesheet" type="text/css"/>
	<link href="${basePath}<%=session.getAttribute("entStyle")==null?"static/js/easyui-1.3.4/themes/default/easyui.css":((com.hontek.sys.pojo.EntStyle)(session.getAttribute("entStyle"))).getScCss() %>" id="easyuiTheme" rel="stylesheet" type="text/css"/>
	<script src="${basePath}static/js/jquery/jquery-1.8.0.min.js"　type="text/javascript"></script>	
	<script src="${basePath}static/js/easyui-1.3.4/jquery.easyui.min.js"　type="text/javascript"></script>
	<script src="${basePath}static/js/easyui-1.3.4/locale/easyui-lang-zh_CN.js" type="text/javascript"></script>
	<script src="${basePath}static/js/hontek/comm/hontek.js"　type="text/javascript"></script>
	
	<!-- 图片显示 -->
	<link rel="stylesheet" type="text/css" href="${basePath}static/js/fancybox/jquery.fancybox-1.3.4.css" media="screen" />
	<script src="${basePath}static/js/fancybox/jquery.mousewheel-3.0.4.pack.js" type="text/javascript" ></script>
	<script src="${basePath}static/js/fancybox/jquery.fancybox-1.3.4.js" type="text/javascript" ></script>
	
	<script type="text/javascript">
		$(function(){
			var filePath = $("#filePath").val();
			//表格数据			
			$('#checkinfoDatagrid').datagrid({  
				  //title:'检验记录',
				  iconCls : 'icon-table',
			      url:'checkinfo_findCheckinfoList.action',//url调用Action方法  
			      queryParams:{"checkinfo.recId":<%=recId%>},
			      loadMsg : '数据装载中......',  			      
			      fit:true,			    
			      striped : true,//设置为true将交替显示行背景。  			       
			      fitColumns:true,//允许表格自动缩放，以适应父容器  
			      columns:[[
							{field:'checkName',title:'报告名称',width:100,align:'center'},
							//{field:'checkNum',title:'报告编号',width:100,align:'center'},
							{field:'checkTime',title:'检验时间',width:100,align:'center'},
							{field:'checkUnit',title:'检验单位',width:150,align:'center'},	
							{field:'checkResult',title:'检验结果',width:150,align:'center'},		
							{field:'elementApp',title:'报告附件',width:100,align:'center',
								formatter : function(value,row,index){ 
									if(value.length>0){
										var ht = "";				
										var app_group = "app_group"+row.checkId;
										for(var i = 0; i<value.length; i++){
											var appUrl = filePath+value[i].appUrl;
											if(i==0){
												ht+= "<a rel=\""+app_group+"\" href=\""+appUrl+"\" title=\""+value[i].appName+"\">查看附件</a>";
											}else{
												ht+= "<a rel=\""+app_group+"\" href=\""+appUrl+"\" title=\""+value[i].appName+"\"></a>";
											}
										}
										return ht;										
									}else{
										return '没有附件';
									}																						
								}
							}
				      ]],
		          pagination : true,//分页  
		          rownumbers : true,//行数  				          
		          onLoadSuccess : function(data) {
					f_timeout(data);
					if(data.total>0){						
						for(var i=0; i< data.total;i++){
							var rowX = data.rows[i];
							if(rowX.elementApp.length>0){
								<%
								if(flag){
									%>
									var app_group = "app_group"+rowX.checkId;
									$("a[rel="+app_group+"]").click(function(){
										$('#chimgDiv', window.parent.document).html($(this).parent().html());
										parent.showChildImg(app_group);
										return false;
									});
									<%
								}else{
									%>
									var app_group = "app_group"+rowX.checkId;
									$("a[rel="+app_group+"]").fancybox({
										/*'transitionIn'		: 'none',
										'transitionOut'		: 'none',
										'titlePosition' 	: 'over',
										'titleFormat'		: function(title, currentArray, currentIndex, currentOpts) {
											return '<span id="fancybox-title-over">图片 ' + (currentIndex + 1) + ' / ' + currentArray.length + (title.length ? ' &nbsp; ' + title : '') + '</span>';
										}*/
									});
									<%
								}
								%>
								
							}							
						}						
					}
				  },
			 	  onClickRow: function(rowIndex, rowData){
		 			$(this).datagrid('unselectAll');
		 			$(this).datagrid('selectRow',rowIndex);
		 		  }
			});

		});
	
	</script>
	
  </head>
  <body>
  
   <input type="hidden" id="filePath" value="<%=filePath %>">
  
   <!-- 列表 -->
   <table id="checkinfoDatagrid"></table>  
  </body>
</html>
