<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String filePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+"/nytsyFiles/element/";

String ptbId = request.getParameter("ptbId");

System.out.println("ptbId="+ptbId);
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>投入品购买记录</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link href="${basePath}static/js/easyui-1.3.4/themes/icon.css" rel="stylesheet" type="text/css"/>
	<link href="${basePath}static/js/easyui-1.3.4/demo/demo.css" rel="stylesheet" type="text/css"/>
	<link href="${basePath}static/js/easyui-1.3.4/themes/default/easyui.css" id="easyuiTheme" rel="stylesheet" type="text/css"/>
	<script src="${basePath}static/js/jquery/jquery-1.8.0.min.js"　type="text/javascript"></script>	
	<script src="${basePath}static/js/easyui-1.3.4/jquery.easyui.min.js"　type="text/javascript"></script>
	<script src="${basePath}static/js/easyui-1.3.4/locale/easyui-lang-zh_CN.js" type="text/javascript"></script>
	<script src="${basePath}static/js/hontek/comm/hontek.js"　type="text/javascript"></script>
	<!-- 图片显示 -->
	<link rel="stylesheet" type="text/css" href="${basePath}static/js/fancybox/jquery.fancybox-1.3.4.css" media="screen" />
	<script src="${basePath}static/js/fancybox/jquery.mousewheel-3.0.4.pack.js" type="text/javascript" ></script>
	<script src="${basePath}static/js/fancybox/jquery.fancybox-1.3.4.pack.js" type="text/javascript" ></script>
	<script type="text/javascript" src="${basePath}static/js/easyui-1.3.4/datagrid-detailview.js"></script>
	
	<script type="text/javascript">
		$(function(){
			
			//表格数据			
			$('#datagrid').datagrid({  
				 // title:'投入品购买记录',
				  iconCls : 'icon-table',
			      url:'marketInInfoBase_findList.action',//url调用Action方法  
			      queryParams:{"marketInInfoBase.flag":"3","marketInInfoBase.ptbId":<%=ptbId%>},
			      loadMsg : '数据装载中......',  			      
			      fit:true,			    
			      striped : true,//设置为true将交替显示行背景。  			       
			      fitColumns:true,//允许表格自动缩放，以适应父容器  
			      columns:[[
							{field:'marketId',title:'零售市场编码',width:50,align:'center'},							
							{field:'marketName',title:'零售市场名称',width:100,align:'center'},
							{field:'inDate',title:'进场日期',width:100,align:'center'},
							{field:'wholesalerId',title:'零售商编码',width:50,align:'center'},
							{field:'wholesalerName',title:'零售商名称',width:100,align:'center'},
							{field:'tranId',title:'交易凭证号',width:50,align:'center'},
							{field:'quarantineAnimalProductsId',title:'动物产品检疫合格证号',width:100,align:'center'},	
							{field:'inspectionMeatId',title:'肉品品质检验合格证号',width:100,align:'center'},
							{field:'batchId',title:'进货批次号',width:100,align:'center'}
				      ]],
		          pagination : true,//分页  
		          rownumbers : true,//行数  				          
		          onLoadSuccess : function(data) {
					f_timeout(data);
				  },
			 	  onClickRow: function(rowIndex, rowData){
		 			$(this).datagrid('unselectAll');
		 			$(this).datagrid('selectRow',rowIndex);
		 		  },
		 			view: detailview,
		 		    detailFormatter:function(index,row){
		 		        return '<div style="padding:2px"><table class="ddv"></table></div>';
		 		    },
		 		    onExpandRow: function(index,row){
		 		     var ddv = $(this).datagrid('getRowDetail',index).find('table.ddv');	 		     
		 		   	 var queryParams = {"marketInInfoDetail.miibId":row.miibId};	 		        
		 		        ddv.datagrid({
		 		            url:'marketInInfoDetail_findList.action',
		 		            queryParams:queryParams,
		 		            fitColumns:true,
		 		            singleSelect:true,
		 		            rownumbers:true,
		 		            loadMsg:'数据加载中。。。',
		 		            height:'auto',
		 		            columns:[[
		 		                {field:'goodsCode',title:'商品编码',width:50,align : 'center'},
		 		                {field:'goodsName',title:'商品名称',width:100,align : 'center'},
		 		                {field:'weight',title:'重量',width:50,align : 'center'},
		 		                {field:'areaOriginId',title:'产地编码',width:50,align : 'center'},
		 		                {field:'areaOriginName',title:'产地名称',width:50,align : 'center'},
		 		                {field:'baseName',title:'生产基地',width:50,align : 'center'},
		 		                {field:'wsSupplierId',title:'批发市场编码',width:100,align : 'center'},
		 		                {field:'wsSupplierName',title:'批发市场名称',width:100,align : 'center'},
		 						{field : 'saleTranId',title : '零售凭证号',width : 100,align : 'center'}
		 		            ]],
		 		            onResize:function(){
		 		                $('#datagrid').datagrid('fixDetailRowHeight',index);
		 		            },
		 		            onLoadSuccess:function(){
		 		                setTimeout(function(){
		 		                    $('#datagrid').datagrid('fixDetailRowHeight',index);
		 		                },0);
		 		            }
		 		        });
		 		        $('#datagrid').datagrid('fixDetailRowHeight',index);
		 		    }
			});

		});
	
	</script>
	
  </head>
  <body>
     <input type="hidden" id="filePath" value="<%=filePath %>">
  
   <!-- 列表 -->
   <table id="datagrid"></table>  
   
  </body>
</html>
