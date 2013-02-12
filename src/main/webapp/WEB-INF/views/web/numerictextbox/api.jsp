<%@taglib prefix="kendo" uri="http://www.kendoui.com/jsp/tags"%>
<%@taglib prefix="demo" tagdir="/WEB-INF/tags"%>

<demo:header />

<kendo:numericTextBox name="numerictextbox"></kendo:numericTextBox>

<script>
    $(document).ready(function () {
        var numerictextbox = $("#numerictextbox").data("kendoNumericTextBox");

        var setValue = function () {
            numerictextbox.value($("#value").val());
        };

        $("#enable").click(function () {
            numerictextbox.enable();
        });

        $("#disable").click(function () {
            numerictextbox.enable(false);
        });

        $("#value").kendoNumericTextBox({
            change: setValue
        });

        $("#set").click(setValue);

        $("#get").click(function () {
            alert(numerictextbox.value());
        });
    });
</script>
<div class="configuration k-widget k-header" style="width: 220px">
    <span class="configHead">API Functions</span>
    <ul class="options">
        <li>
            <button id="get" class="k-button">Get value</button>
        </li>
        <li>
            <input id="value" value="10" style="float:none" />
            <button id="set" class="k-button">Set value</button>
        </li>
        <li>
            <button id="enable" class="k-button">Enable</button> or <button id="disable" class="k-button">Disable</button>
        </li>
    </ul>
</div>

<demo:footer />