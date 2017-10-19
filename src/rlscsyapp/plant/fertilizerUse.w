<?xml version="1.0" encoding="utf-8"?>
<div xmlns="http://www.w3.org/1999/xhtml" component="$UI/system/components/justep/window/window" design="device:m;" xid="window" class="window">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="top:16px;left:641px;height:auto;" onParamsReceive="modelParamsReceive"> 
  <div component="$UI/system/components/justep/data/data" autoLoad="false" xid="fertilizerUseData" idColumn="fuid" onCustomRefresh="fertilizerUseDataCustomRefresh" limit="10">
  
  <column label="fuid" name="fuid" type="Integer" xid="xid1"></column>
  <column label="recId" name="recId" type="Integer" xid="xid2"></column>
  <column label="funame" name="funame" type="String" xid="xid4"></column>
  <column label="purpose" name="purpose" type="String" xid="xid5"></column>
  <column label="userarea" name="userarea" type="String" xid="xid6"></column>
  <column label="usedate" name="usedate" type="String" xid="xid7"></column>
  <column label="usertotal" name="usertotal" type="String" xid="xid8"></column>
  <column label="useman" name="useman" type="String" xid="xid9"></column>
  <column label="crttime" name="crttime" type="String" xid="xid17"></column>
  <column label="remark" name="remark" type="String" xid="xid18"></column></div>
  
  </div>  
  <div component="$UI/system/components/justep/panel/panel" 
    class="x-panel x-full" xid="panel1"> 
      <div class="x-panel-top" xid="top1"> 
        <div component="$UI/system/components/justep/titleBar/titleBar" title="肥料使用记录"
          class="x-titlebar" xid="marketTitle">
          <div class="x-titlebar-left"> 
            <a component="$UI/system/components/justep/button/button"
              label="" class="btn btn-link btn-only-icon" icon="icon-arrow-left-c"
              onClick="{operation:'window.close'}" xid="backBtn"> 
              <i class="icon-arrow-left-c"/>  
              <span></span> 
            </a> 
          </div>  
          <div class="x-titlebar-title">肥料使用记录</div>  
          <div class="x-titlebar-right reverse"> 
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-only-icon" label="button" xid="addPfBaseBtn" icon="linear linear-bus" onClick="addPfBaseBtnClick">
   <i xid="i1" class="linear linear-bus"></i>
   <span xid="span1"></span></a></div>
        </div> 
      </div>  
    <div class="x-panel-content  x-scroll-view" xid="content1" _xid="C787DDC3E180000112ADB9C0A81D8900" style="bottom: 0px;"><div class="x-scroll" component="$UI/system/components/justep/scrollView/scrollView" xid="scrollView1" onPullUp="scrollView1PullUp" style="width:100%;">
   <div class="x-content-center x-pull-down container" xid="div1">
    <i class="x-pull-down-img glyphicon x-icon-pull-down" xid="i4"></i>
    <span class="x-pull-down-label" xid="span19">下拉刷新...</span></div> 
   <div class="x-scroll-content" xid="div3">
    <div component="$UI/system/components/justep/list/list" class="x-list x-cards" xid="list1" data="fertilizerUseData" limit="-1" disablePullToRefresh="false" disableInfiniteLoad="false" autoLoad="false">
     <ul class="x-list-template  list-group" xid="listTemplateUl1">
      <li xid="li1" style="width:100%;" class="list-group-item">
       <div class="caption" xid="div2">
        <div component="$UI/system/components/justep/row/row" class="x-row" xid="row2">
         <div class="x-col" xid="col5">
          <span xid="span2" ><![CDATA[肥料名称：]]></span>
          <span xid="span10" bind-text=' ref("funame")'></span></div> </div> 
        <div component="$UI/system/components/justep/row/row" class="x-row" xid="row1">
         <div class="x-col" xid="col1">
          <span xid="span4"><![CDATA[施用目的：]]></span>
          <span xid="span3" bind-text=' ref("purpose")'></span></div> </div> 
        <div component="$UI/system/components/justep/row/row" class="x-row" xid="row3">
         <div class="x-col" xid="col2">
          <span xid="span6"><![CDATA[施用面积：]]></span>
          <span xid="span5" bind-text=' ref("userarea")'></span></div> </div> 
        <div component="$UI/system/components/justep/row/row" class="x-row" xid="row7">
         <div class="x-col" xid="col9">
          <span xid="span14"><![CDATA[使用日期：]]></span>
          <span xid="span13" bind-text=' ref("usedate")'></span></div> </div> 
        <div component="$UI/system/components/justep/row/row" class="x-row" xid="row4">
         <div class="x-col" xid="col7">
          <span xid="span9"><![CDATA[　施用量：]]></span>
          <span xid="span8" bind-text=' ref("usertotal")'></span></div> </div> 
        
        <div component="$UI/system/components/justep/row/row" class="x-row" xid="row5">
   <div class="x-col" xid="col4">
    <span xid="span12"><![CDATA[　施用人：]]></span>
    <span xid="span11" bind-text=' ref("useman")'></span></div> </div><div component="$UI/system/components/justep/row/row" class="x-row" xid="row6">
         <div class="x-col" xid="col6">
          <a component="$UI/system/components/justep/button/button" class="btn btn-success btn-xs btn-block" label="修改" xid="button1" icon="icon-edit" onClick="updateClick">
           <i xid="i2" class="icon-edit"></i>
           <span xid="span16">修改</span></a> </div> 
         <div class="x-col" xid="col3">
          <a component="$UI/system/components/justep/button/button" class="btn btn-success btn-xs btn-block" label="删除" xid="button4" icon="icon-close" onClick="deleteClick">
           <i xid="i5" class="icon-close"></i>
           <span xid="span7">删除</span></a> </div> 
         
         </div> 
  </div> </li> </ul> </div> </div> 
   <div class="x-content-center x-pull-up" xid="div4">
    <span class="x-pull-up-label" xid="span20">加载更多...</span></div> </div></div>
  </div> 
<span component="$UI/system/components/justep/messageDialog/messageDialog" xid="messageDialog1" type="YesNo" onYes="messageDialog1Yes" message="是否删除该信息" style="top:13px;left:30px;"></span>
  <span component="$UI/system/components/justep/windowDialog/windowDialog" xid="editwindowDialog" src="$UI/rlscsyapp/plant/editFertilizerUse.w" onReceived="editwindowDialogReceived" style="top:13px;left:71px;"></span></div>