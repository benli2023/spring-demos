<%@page import="java.util.Calendar"%>
<%@taglib prefix="kendo" uri="http://www.kendoui.com/jsp/tags"%>
<%@taglib prefix="demo" tagdir="/WEB-INF/tags"%>
<demo:header />

<div class="configuration k-widget k-header">
    <span class="configHead">API Functions</span>
    <span class="configTitle">Get value</span>
    <ul class="options">
        <li>
            <button id="get" class="k-button">Get date</button>
        </li>
    </ul>
    <span class="configTitle">Set value</span>
    <ul class="options">
        <li>
            <input id="value" value="10/10/2000" style="float:none; width: 120px;" />
            <button id="set" class="k-button">Set date</button>
        </li>
    </ul>
    <span class="configTitle">Navigation</span>
    <ul class="options">
        <li>
            <select id="direction" style="vertical-align: top; width: 120px; margin-bottom: 3px;">
                <option value="up">upper view</option>
                <option value="down">lower view</option>
                <option value="past">past</option>
                <option value="future" selected="selected">future</option>
            </select>
            <button id="navigate" class="k-button">Navigate</button>
        </li>
    </ul>
</div>

<kendo:calendar name="calendar" value="<%= Calendar.getInstance().getTime() %>">
</kendo:calendar>

<script>
	$(document).ready(function() {
	    var calendar = $("#calendar").data("kendoCalendar"),
	    navigate = function () {
	        var value = $("#direction").val();
	        switch(value) {
	            case "up":
	                calendar.navigateUp();
	                break;
	            case "down":
	                calendar.navigateDown(calendar.value());
	                break;
	            case "past":
	                calendar.navigateToPast();
	                break;
	            default:
	                calendar.navigateToFuture();
	                break;
	        }
	    },
	    setValue = function () {
	        calendar.value($("#value").val());
	    };
	
	    $("#get").click(function() {
	        alert(calendar.value());
	    });
	
	    $("#value").kendoDatePicker({
	        change: setValue
	    });
	
	    $("#set").click(setValue);
	
	    $("#direction").kendoDropDownList({
	        change: navigate
	    });
	
	    $("#navigate").click(navigate);
	});
</script>

<demo:footer />