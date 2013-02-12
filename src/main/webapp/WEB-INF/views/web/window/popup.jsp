<%@taglib prefix="kendo" uri="http://www.kendoui.com/jsp/tags"%>
<%@taglib prefix="demo" tagdir="/WEB-INF/tags"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:url value="/web/grid/remote-data/read" var="transportReadUrl" />

<!DOCTYPE html>
<html>
<head>
<title>Home</title>
<link href="<c:url value='/resources/css/web/kendo.common.min.css'/>"
	rel="stylesheet" />
<link href="<c:url value='/resources/css/web/kendo.rtl.min.css'/>"
	rel="stylesheet" />
<link href="<c:url value='/resources/css/web/kendo.metro.min.css'/>"
	rel="stylesheet" />
<link
	href="<c:url value='/resources/css/dataviz/kendo.dataviz.min.css'/>"
	rel="stylesheet" />
<link
	href="<c:url value='/resources/css/dataviz/kendo.dataviz.default.min.css'/>"
	rel="stylesheet" />

<script src="<c:url value='/resources/js/jquery.min.js' />"></script>
<script src="<c:url value='/resources/js/kendo.all.min.js' />"></script>
<script
	src="<c:url value='/resources/js/cultures/kendo.culture.zh.min.js' />"
	charset="utf-8"></script>
<script type="text/javascript">kendo.culture("zh");</script>
<script src="<c:url value='/resources/shared/js/console.js'/>"></script>
<script src="<c:url value='/resources/shared/js/prettify.js'/>"></script>


<style type="text/css">

html
{
    padding:0;border:0;margin:0;
    width:100%;height:100%;   
}

<!--
body {
	margin: 0;
	padding: 0;
	border: 0;
	width: 100%;
	height: 100%;
	overflow: hidden;
	font-family: Tahoma, Verdana;
	font-size: 12px;
	line-height: 22px;
}

* {
	font-size: 12px;
}

/** category **/
#grid .k-toolbar {
	min-height: 27px;
}

.category-label {
	vertical-align: middle;
	padding-right: .5em;
}

#categories {
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

    function onChange(arg) {
	        var selected = $.map(this.select(), function(item) {
	            return $(item).text();
	        });
		//kendoConsole.log("Selected: " + selected.length + " item(s), [" + selected.join(", ") + "]");
	       
	 }
	    
    
    	function categoriesChange() {	
		 var value = this.value(),
		 	 grid = $("#grid").data("kendoGrid");
		 
         if (value) {
             grid.dataSource.filter({ field: "categoryId", operator: "eq", value: parseInt(value) });
         } else {
             grid.dataSource.filter({});
         }
	}
	
	
	function doSearch()  {
		var value=$('#searchField').val();
		var grid = $("#grid").data("kendoGrid");
		if(value) {
			  grid.dataSource.filter({ field: "productName", operator: "contains", value:  value});
			
		}else {
			grid.dataSource.filter({});
		}
	}
	
	function onKeyEnter(event) {
		var searchOnEnter=false;
		if(searchOnEnter) {
			doSearch();
		}else {
			var keycode = (event.keyCode ? event.keyCode : event.which);
			if(keycode == '13'){
				doSearch();
			}
		}
		//event.preventDefault();
		//event.stopPropagation();
	}
	
	function confirm() {
		var grid = $("#grid").data("kendoGrid");
		var selectedRows=grid.select();
		
		var selectedDataItems = [];

        for (var i = 0; i < selectedRows.length; i++) {
            var dataItem = grid.dataItem(selectedRows[i]);
            selectedDataItems.push(dataItem);
            //alert(dataItem.productId+' '+dataItem.productName);
        }
		
		
		
		if(!selectedDataItems || selectedDataItems.length==0) {
			alert('please select!');
		}
		
		window.parent.setValue(selectedDataItems[0].productName,selectedDataItems[0].productId);
		
		window.parent.close();
	
	}
	
	function cancel() {
		window.parent.close();
	}
	

//-->
</script>
</head>



<body>
	<c:url value="/web/grid/toolbar-template/categories"
		var="categoriesReadUrl" />
	<c:url value="/web/grid/remote-data/read" var="transportReadUrl" />


	<kendo:grid name="grid" pageable="true" groupable="false"
		sortable="true" filterable="true" selectable="mutilple"
		change="onChange">


		<kendo:grid-toolbarTemplate>
			<div class="toolbar-left">
				<label class="category-label" for="productName">Product Name</label>
				<input type="text" class="k-input k-textbox" name="productName"
					id="searchField" onkeyup="onKeyEnter(event)" /> <a
					class="k-button k-button-icontext k-grid-update"
					href="javascript:doSearch()"> <span class="k-icon k-i-search"></span>Search
				</a>
			</div>
			<div class="toolbar-right">
				<label class="category-label" for="categories">Show products
					by category:</label>
				<kendo:dropDownList name="categories" optionLabel="All"
					dataTextField="categoryName" dataValueField="categoryId"
					autoBind="false" change="categoriesChange">
					<kendo:dataSource>
						<kendo:dataSource-transport>
							<kendo:dataSource-transport-read url="${categoriesReadUrl}" />
						</kendo:dataSource-transport>
					</kendo:dataSource>
				</kendo:dropDownList>
			</div>
		</kendo:grid-toolbarTemplate>

		<kendo:grid-columns>
			<kendo:grid-column title="Product Name" field="productName" />
			<kendo:grid-column title="Unit Price" field="unitPrice"
				format="{0:c}" />
			<kendo:grid-column title="Units In Stock" field="unitsInStock" />
		</kendo:grid-columns>
		<kendo:dataSource pageSize="10" serverPaging="true"
			serverSorting="true" serverFiltering="true" serverGrouping="true">
			<kendo:dataSource-schema data="data" total="total" groups="data">
				<kendo:dataSource-schema-model>
					<kendo:dataSource-schema-model-fields>
						<kendo:dataSource-schema-model-field name="productName"
							type="string" />
						<kendo:dataSource-schema-model-field name="unitPrice"
							type="number" />
						<kendo:dataSource-schema-model-field name="unitsInStock"
							type="number" />
					</kendo:dataSource-schema-model-fields>
				</kendo:dataSource-schema-model>
			</kendo:dataSource-schema>
			<kendo:dataSource-transport>
				<kendo:dataSource-transport-read url="${transportReadUrl}"
					type="POST" contentType="application/json" />
			</kendo:dataSource-transport>
		</kendo:dataSource>
	</kendo:grid>

	<div style="width: 940px; margin-top: 10px; padding-left: 350px">
		<a class="k-button k-button-icontext k-grid-update"
			href="javascript:confirm()"> <span class="k-icon k-update"></span>ok
		</a> <a class="k-button k-button-icontext k-grid-update"
			href="javascript:cancel()"> <span class="k-icon k-i-cancel"></span>cancel
		</a>
	</div>
</body>