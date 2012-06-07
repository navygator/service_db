<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.master" Inherits="System.Web.Mvc.ViewPage<ServiceDB.Models.RequestItemService>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Новый
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<div class="row">
    <div class="span6 offset3">

        <h1>Добавить услуги</h1>

        <script src="<%: Url.Content("~/Scripts/jquery.validate.min.js") %>" type="text/javascript"></script>
        <script src="<%: Url.Content("~/Scripts/jquery.validate.unobtrusive.min.js") %>" type="text/javascript"></script>

        <% using (Html.BeginForm()) { %>
            <%: Html.ValidationSummary(true) %>
            <fieldset>
                <legend>Услуга</legend>
                <% Html.RenderPartial("EditFields", Model); %>
                <p>
                    <input type="submit" value="Добавить" class="btn btn-primary"/>
                </p>
            </fieldset>
        <% } %>

        <div>
            <%: Html.ActionLink("К товару", "Edit", "RequestItems", new { @id = Model.RequestItem_id }, null)%>
        </div>
    </div>
</div>
</asp:Content>
