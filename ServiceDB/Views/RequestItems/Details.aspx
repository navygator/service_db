<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.master" Inherits="System.Web.Mvc.ViewPage<ServiceDB.Models.RequestItem>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Details
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2>Details</h2>

<fieldset>
    <legend>RequestItem</legend>

    <div class="display-label">Request</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.Request.Id) %>
    </div>

    <div class="display-label">Good</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.Good.Name) %>
    </div>

    <div class="display-label">Serial_num</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.Serial_num) %>
    </div>

    <div class="display-label">Warranty</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.Warranty.Name) %>
    </div>

    <div class="display-label">Employee</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.Employee.FIO) %>
    </div>

    <div class="display-label">Description</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.Description) %>
    </div>

    <div class="display-label">Packing</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.Packing) %>
    </div>

    <div class="display-label">Defect</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.Defect) %>
    </div>

    <div class="display-label">More_info</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.More_info) %>
    </div>

    <div class="display-label">Diagnostic_result</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.Diagnostic_result) %>
    </div>

    <div class="display-label">State</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.State.Name) %>
    </div>

    <div class="display-label">Updated_at</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.Updated_at) %>
    </div>
</fieldset>
<p>

    <%: Html.ActionLink("Edit", "Edit", new { id=Model.Id }) %> |
    <%: Html.ActionLink("Back to List", "Index") %>
</p>

</asp:Content>
