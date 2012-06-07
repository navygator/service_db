<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.master" Inherits="System.Web.Mvc.ViewPage<ServiceDB.Models.Request>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Delete
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<h1>Удаление заявки</h1>
<h3>Вы уверены, что желаете удалить?</h3>
<div class="row">
    <div class="span3">
        <% Html.RenderPartial("RequestInfo", Model); %>
        <% using (Html.BeginForm()) { %>
            <p>
                <input type="submit" value="Удалить" class="btn btn-danger" /> 
                <%: Html.ActionLink("К списку", "Index", null, new { @class="btn btn-primary"})%>
            </p>
        <% } %>
    </div>
    <div class="span7 offset1">
        <% Html.RenderPartial("Items", Model.RequestItem ); %>
    </div>
</div>
</asp:Content>
