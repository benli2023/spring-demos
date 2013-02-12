<%@taglib prefix="kendo" uri="http://www.kendoui.com/jsp/tags"%>
<%@taglib prefix="demo" tagdir="/WEB-INF/tags"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:url value="/dataviz/bubble-charts/grouped-data/read" var="readUrl" />

<demo:header />
	<div id="example" class="k-content">
         <div class="chart-wrapper">
         	 <kendo:chart name="chart">
         	 	 <kendo:chart-title text="Job Growth for 2011 and 2012" />
         	 	 <kendo:chart-legend position="bottom" />
         	 	 <kendo:dataSource>
	        	 	 <kendo:dataSource-transport>
	             		 <kendo:dataSource-transport-read url="${readUrl}" dataType="json" type="POST" contentType="application/json" />
	                 </kendo:dataSource-transport>
	                 <kendo:dataSource-group>
	                 	 <kendo:dataSource-groupItem field="year" />
	                 </kendo:dataSource-group>
                 </kendo:dataSource>
         	 	 <kendo:chart-series>
         	 	 	<kendo:chart-seriesItem type="bubble" xfield="growth" yfield="jobs" sizeField="applications" categoryField="company" />
         	 	 </kendo:chart-series>
         	 	 <kendo:chart-xAxis>
         	 	 	<kendo:chart-xAxisItem axisCrossingValue="-10000" majorUnit="2000">
         	 	 		<kendo:chart-xAxisItem-labels format="{0:N0}" skip="1" />
         	 	 		<kendo:chart-xAxisItem-plotBands>
         	 	 			<kendo:chart-xAxisItem-plotBand from="-5000" to="0" color="#00f" opacity="0.05" />
         	 	 		</kendo:chart-xAxisItem-plotBands>
         	 	 	</kendo:chart-xAxisItem>
         	 	 </kendo:chart-xAxis>
         	 	 <kendo:chart-yAxis>
         	 	 	<kendo:chart-yAxisItem>
         	 	 		<kendo:chart-yAxisItem-labels format="{0:N0}" skip="1" />
         	 	 		<kendo:chart-yAxisItem-line visible="false" />
         	 	 	</kendo:chart-yAxisItem>
         	 	 </kendo:chart-yAxis>
         	 	 <kendo:chart-tooltip visible="true" template="#= category # (#= dataItem.Year #): #= kendo.toString(value.size, 'N0') # applications" />
         	 </kendo:chart>
        	 
        	 <ul class="k-content">
		         <li>Circle size shows number of job applicants</li>
		         <li>Vertical position shows number of employees</li>
		         <li>Horizontal position shows job growth</li>
		     </ul>
        </div>
    </div>
    <style>
	    .chart-wrapper {
	        position: relative;
	    }
	
	    .chart-wrapper ul {
	        font-size: 11px;
	        margin: 62px 16px 0 0;
	        padding: 30px;
	        position: absolute;
	        right: 0;
	        top: 0;
	        text-transform: uppercase;
	        width: 150px;
	        height: 105px;
	    }
	</style>
<demo:footer />