<%@taglib prefix="kendo" uri="http://www.kendoui.com/jsp/tags"%>
<%@taglib prefix="demo" tagdir="/WEB-INF/tags"%>
<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
<%@ page contentType="text/html;charset=UTF-8" %>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:url value="/resources/web/window/armchair-402.png" var="armchair" />

<demo:header />



	
<style>
<!--
	
body
{
    /* font-family:Tahoma, Verdana, 宋体;   
    font-size:12px; */
    /*line-height:22px;*/
} 

html
{
    overflow-y:scroll;
    font:12px 'Lucida Sans Unicode','Lucida Grande',arial,helvetica,sans-serif;
    background:#e2e2e2 url("flowers-left.png") no-repeat fixed 0 400px;
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
    

//-->
</script>



<script>
	    function onClose() {
	        $("#undo").show();
	    }
	
	    $(document).ready(function() {
	        $("#undo").bind("click", function() {
	       			// var kendoWindow = $("#window").data("kendoWindow");
	                //kendoWindow.open();
	               //$("#undo").hide();
	            });
	            
	    });
	</script>
	<c:url value="/web/grid/products/" var="transportReadUrl" />
	
	<kendo:window name="window" title="选择列表" draggable="true" visible="false"
	resizable="true" width="940" height="406" close="onClose" modal="true">
	<kendo:window-content>
	   <kendo:grid name="grid" pageable="true" groupable="false" sortable="true" filterable="true">
        <kendo:grid-columns>
            <kendo:grid-column title="Product Name" field="productName" />
            <kendo:grid-column title="Unit Price" field="unitPrice" format="{0:c}" />
            <kendo:grid-column title="Units In Stock" field="unitsInStock" />
        </kendo:grid-columns>
        <kendo:dataSource pageSize="10">
             <kendo:dataSource-schema>
                <kendo:dataSource-schema-model>
                    <kendo:dataSource-schema-model-fields>
                        <kendo:dataSource-schema-model-field name="productName" type="string" />
                        <kendo:dataSource-schema-model-field name="unitPrice" type="number" />
                        <kendo:dataSource-schema-model-field name="unitsInStock" type="number" />
                    </kendo:dataSource-schema-model-fields>
                </kendo:dataSource-schema-model>
            </kendo:dataSource-schema>
            <kendo:dataSource-transport>
                <kendo:dataSource-transport-read url="${transportReadUrl}"/>
            </kendo:dataSource-transport>
        </kendo:dataSource>
    </kendo:grid>
	</kendo:window-content>
</kendo:window>
		   <kendo:grid name="grid" pageable="true" groupable="false" sortable="true" filterable="true">
        <kendo:grid-columns>
            <kendo:grid-column title="Product Name" field="productName" />
            <kendo:grid-column title="Unit Price" field="unitPrice" format="{0:c}" />
            <kendo:grid-column title="Units In Stock" field="unitsInStock" />
        </kendo:grid-columns>
        <kendo:dataSource pageSize="10">
             <kendo:dataSource-schema>
                <kendo:dataSource-schema-model>
                    <kendo:dataSource-schema-model-fields>
                        <kendo:dataSource-schema-model-field name="productName" type="string" />
                        <kendo:dataSource-schema-model-field name="unitPrice" type="number" />
                        <kendo:dataSource-schema-model-field name="unitsInStock" type="number" />
                    </kendo:dataSource-schema-model-fields>
                </kendo:dataSource-schema-model>
            </kendo:dataSource-schema>
            <kendo:dataSource-transport>
                <kendo:dataSource-transport-read url="${transportReadUrl}"/>
            </kendo:dataSource-transport>
        </kendo:dataSource>
    </kendo:grid>
	
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

<span class="mini-buttonedit" style="border-width: 0px; width: 125px;" id="btnEdit1">
<span class="mini-buttonedit-border" style="width: 123px;">
<input type="input" class="mini-buttonedit-input" autocomplete="off" placeholder="" id="btnEdit1$text" name="b" style="width: 103px;">
 	<span class="mini-buttonedit-button" onmouseover="OOl0(this,'mini-buttonedit-button-hover');" onmouseout="o00O(this,'mini-buttonedit-button-hover');" onclick="openDialog()">
 		<span class="mini-buttonedit-icon"></span>
	</span>
	<span class="mini-buttonedit-close" style="display: none;"></span>
</span>
</span>
<demo:footer />
