<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.master" Inherits="System.Web.Mvc.ViewPage<ServiceDB.Models.RequestItem>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Edit
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2>Edit</h2>

<script src="<%: Url.Content("~/Scripts/jquery.validate.min.js") %>" type="text/javascript"></script>
<script src="<%: Url.Content("~/Scripts/jquery.validate.unobtrusive.min.js") %>" type="text/javascript"></script>

<% using (Html.BeginForm()) { %>
    <%: Html.ValidationSummary(true) %>
    <fieldset>
        <legend>RequestItem</legend>

        <%: Html.HiddenFor(model => model.Id) %>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.Request_id, "Request") %>
        </div>
        <div class="editor-field">
            <%: Html.DropDownList("Request_id", String.Empty) %>
            <%: Html.ValidationMessageFor(model => model.Request_id) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.Good_id, "Good") %>
        </div>
        <div class="editor-field">
            <%: Html.DropDownList("Good_id", String.Empty) %>
            <%: Html.ValidationMessageFor(model => model.Good_id) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.Serial_num) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.Serial_num) %>
            <%: Html.ValidationMessageFor(model => model.Serial_num) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.Warranty_id, "Warranty") %>
        </div>
        <div class="editor-field">
            <%: Html.DropDownList("Warranty_id", String.Empty) %>
            <%: Html.ValidationMessageFor(model => model.Warranty_id) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.Employee_id, "Employee") %>
        </div>
        <div class="editor-field">
            <%: Html.DropDownList("Employee_id", String.Empty) %>
            <%: Html.ValidationMessageFor(model => model.Employee_id) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.Description) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.Description) %>
            <%: Html.ValidationMessageFor(model => model.Description) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.Packing) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.Packing) %>
            <%: Html.ValidationMessageFor(model => model.Packing) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.Defect) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.Defect) %>
            <%: Html.ValidationMessageFor(model => model.Defect) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.More_info) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.More_info) %>
            <%: Html.ValidationMessageFor(model => model.More_info) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.Diagnostic_result) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.Diagnostic_result) %>
            <%: Html.ValidationMessageFor(model => model.Diagnostic_result) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.State_id, "State") %>
        </div>
        <div class="editor-field">
            <%: Html.DropDownList("State_id", String.Empty) %>
            <%: Html.ValidationMessageFor(model => model.State_id) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.Updated_at) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.Updated_at) %>
            <%: Html.ValidationMessageFor(model => model.Updated_at) %>
        </div>

        <p>
            <input type="submit" value="Save" />
        </p>
    </fieldset>
<% } %>

<div>
    <%: Html.ActionLink("Back to List", "Index") %>
</div>

</asp:Content>
