<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>
        <title>Home</title>
		<link href="<c:url value='/resources/css/web/kendo.common.min.css'/>" rel="stylesheet" />
		<link href="<c:url value='/resources/css/web/kendo.rtl.min.css'/>" rel="stylesheet" />
		<link href="<c:url value='/resources/css/web/kendo.metro.min.css'/>" rel="stylesheet" />
		<link href="<c:url value='/resources/css/dataviz/kendo.dataviz.min.css'/>" rel="stylesheet" />
		<link href="<c:url value='/resources/css/dataviz/kendo.dataviz.default.min.css'/>" rel="stylesheet" />
		<link href="<c:url value='/resources/shared/styles/examples-offline.css'/>" rel="stylesheet">
		
		<script src="<c:url value='/resources/js/jquery.min.js' />"></script>
		<script src="<c:url value='/resources/js/kendo.all.min.js' />"></script>
		<script src="<c:url value='/resources/js/cultures/kendo.culture.zh.min.js' />" charset="utf-8"></script>
		<script type="text/javascript">kendo.culture("zh");</script>
		<script src="<c:url value='/resources/shared/js/console.js'/>"></script>
		<script src="<c:url value='/resources/shared/js/prettify.js'/>"></script>
    </head>
    <body>
    	<div class="page">
    		<a class="offline-button" href="<c:url value='../' />">Back to all examples</a>
    		<div id="example" class="k-content">
    		
    		

