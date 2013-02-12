<%@taglib prefix="kendo" uri="http://www.kendoui.com/jsp/tags"%>
<%@taglib prefix="demo" tagdir="/WEB-INF/tags"%>
<demo:header />
    <div class="k-rtl">
        <label for="states">Select a state in USA:</label>
        <kendo:autoComplete name="states" filter="contains">
            <kendo:dataSource data="${states}">
            </kendo:dataSource>
        </kendo:autoComplete>
    </div>
<demo:footer />