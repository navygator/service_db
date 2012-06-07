<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.master" Inherits="System.Web.Mvc.ViewPage<ServiceDB.Models.Service>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Новый
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<div class="row">
    <div class="span6 offset3">

        <h1>Новая услуга</h1>

        <script src="<%: Url.Content("~/Scripts/jquery.validate.min.js") %>" type="text/javascript"></script>
        <script src="<%: Url.Content("~/Scripts/jquery.validate.unobtrusive.min.js") %>" type="text/javascript"></script>

        <% using (Html.BeginForm()) { %>
            <%: Html.ValidationSummary(true) %>
            <% Html.RenderPartial("Service_edit", Model); %>
        <% } %>

        <div>
            <%: Html.ActionLink("К списку", "Index") %>
        </div>
    </div>
</div>

</asp:Content>
