<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.master" Inherits="System.Web.Mvc.ViewPage<ServiceDB.Models.Request>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Delete
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2>Delete</h2>

<h3>Are you sure you want to delete this?</h3>
<fieldset>
    <legend>Request</legend>

    <div class="display-label">Name</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.Name) %>
    </div>

    <div class="display-label">Item</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.Item) %>
    </div>

    <div class="display-label">Serial_num</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.Serial_num) %>
    </div>

    <div class="display-label">Employee</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.Employee.FIO) %>
    </div>

    <div class="display-label">Service</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.Service) %>
    </div>

    <div class="display-label">Description</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.Description) %>
    </div>

    <div class="display-label">More_info</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.More_info) %>
    </div>

    <div class="display-label">Packing</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.Packing) %>
    </div>

    <div class="display-label">Defect</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.Defect) %>
    </div>

    <div class="display-label">Warranty</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.Warranty.Name) %>
    </div>

    <div class="display-label">State</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.State.Name) %>
    </div>

    <div class="display-label">Contragent</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.Contragent.FIO) %>
    </div>

    <div class="display-label">SC_num</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.SC_num) %>
    </div>

    <div class="display-label">Diagnostic_result</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.Diagnostic_result) %>
    </div>
</fieldset>
<% using (Html.BeginForm()) { %>
    <p>
        <input type="submit" value="Delete" /> |
        <%: Html.ActionLink("Back to List", "Index") %>
    </p>
<% } %>

</asp:Content>
