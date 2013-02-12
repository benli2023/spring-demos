<%@taglib prefix="kendo" uri="http://www.kendoui.com/jsp/tags"%>
<%@taglib prefix="demo" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:url value="/resources/web/window/armchair-402.png" var="armchair" />
<c:url value="/web/grid/toolbar-template/categories" var="categoriesReadUrl" />


	<demo:header />

	
<style>
<!--
	
* {
	font-size:12px;
}	

body
{
    font-family:Tahoma, Verdana;   
    font-size:12px;
    line-height:22px;
}
	
body .mini-textbox *,
body .mini-buttonedit *
{

    box-sizing:content-box;     
    -moz-box-sizing:content-box;
    -ms-box-sizing:content-box;
    -webkit-box-sizing:content-box;      
}


.mini-buttonedit-border
{
    background:white;
    border: solid 1px #a5acb5;
    width:123px;
    height:19px;
    display:inline-block;
    position:static;
    float:left;
    overflow:hidden;
}


.mini-buttonedit-input
{
    background:none;
    border: 0; 
    width:100px;    
    height:19px;
    line-height:19px;
    
    font-family: Verdana;
    font-size: 9pt;        
    padding: 0;
    margin:0;
    padding-left:1px;
    padding-right:1px;
     
    outline:none;
    
    float:left;
    z-index:1;
    cursor:text;
}


.mini-buttonedit-button, .mini-buttonedit-close
{    
    border:0px;
    padding:1px;
    
    background:none;
    width:15px;
    height:15px;
    overflow:hidden;
    cursor:pointer;
    
    margin-top:1px;
    margin-right:1px;
    float:right;
    z-index:10;
    
    
}

.mini-buttonedit-icon
{
    display:block;
    width:15px;
    height:15px;
    overflow:hidden;
    background:url(<c:url value="/resources/web/popup/icon1.gif" />) no-repeat 50% 50%;
}

.mini-buttonedit-close
{
    background:url(<c:url value="/resources/web/popup/close.gif" />) no-repeat 50% 50%;
}

.mini-buttonedit-button-hover,
.mini-buttonedit-hover .mini-buttonedit-button
{
    border:1px solid #ababab;
    padding:0;
    background:#dde6fe url(<c:url value="/resources/web/popup/hover.png" />) repeat-x 0 0;   
}

div.k-window-content {
	padding:0px;
	margin:0px;
	overflow: hidden;
}

div.k-window {
border-left:0px;
border-right:0px;
}

div.k-window-content {
border-top:0px;
}

div.k-window-titlebar {
border-bottom:0px;
/*border-left:1px solid #ccc;*/
/*border-right:1px solid #ccc;*/
}

  #grid .k-toolbar
     {
         min-height: 27px;
     }
     .category-label
     {
         vertical-align: middle;
         padding-right: .5em;
     }
     #categories
     {
         vertical-align: middle;
     }
     .toolbar-right {
         float: right;
         margin-right: .8em;
     }	
     
        .toolbar-left {
         float: left;
         margin-left: .8em;
     }	
	
-->
</style>	

<script type="text/javascript">
<!--

	function OOl0(obj,cssClazz) {
		$(obj).addClass(cssClazz);
	}
	function o00O(obj,cssClazz) {
		$(obj).removeClass(cssClazz);
	}
	function openDialog() {
		 var kendoWindow = $("#window").data("kendoWindow");
	     kendoWindow.open();
	}
    function onClose() {
        //$("#undo").show();
    }
    
    function close() {
    
   	 var kendoWindow = $("#window").data("kendoWindow");
	     kendoWindow.close();
    }
    
    function setValue(txt,val) {
    	$('#popup_input_id').val(txt);
    	$('#hidden_popup_id').val(val);
    }

    
    
//-->
</script>


<c:url value="/web/grid/remote-data/read" var="transportReadUrl" />

	<kendo:window name="window" title="select from list" draggable="true" visible="false"
	resizable="true" width="940" height="450" close="onClose" modal="true" iframe="true" content="/kendo/web/window/popup">
</kendo:window>
	   
    

	
	<!--  
	<span id="undo" style="display: none" class="k-button">Click here
	to open the window.</span>
	-->



<!--  
<style scoped="scoped">
#example {
	min-height: 500px;
}

#undo {
	text-align: center;
	position: absolute;
	white-space: nowrap;
	padding: 1em;
	cursor: pointer;
}

.armchair {
	float: left;
	margin: 30px 30px 120px 30px;
	text-align: center;
}

.armchair img {
	display: block;
	margin-bottom: 10px;
}
</style>
-->

<div></div>
    <div style="margin-top:10px">
<span class="mini-buttonedit" style="border-width: 0px; width: 125px;" id="btnEdit1">
<span class="mini-buttonedit-border" style="width: 123px;">
<input type="input" class="mini-buttonedit-input" autocomplete="off" placeholder=""  name="b" style="width: 103px;" id="popup_input_id" >
<input type="hidden" name="" value="" id="hidden_popup_id"/>
 	<span class="mini-buttonedit-button" onmouseover="OOl0(this,'mini-buttonedit-button-hover');" onmouseout="o00O(this,'mini-buttonedit-button-hover');" onclick="openDialog()">
 		<span class="mini-buttonedit-icon"></span>
	</span>
	<span class="mini-buttonedit-close" style="display: none;"></span>
</span>
</span>
</div>
<demo:footer />
