<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.master" Inherits="System.Web.Mvc.ViewPage<ServiceDB.Models.RequestItemService>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Удаление
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<div class="row">
    <div class="span6 offset3">
        <h1>Удалить услуги</h1>

        <h3>Вы уверены, что желаете удалить?</h3>
        <% Html.RenderPartial("ViewFields", Model); %>
        <% using (Html.BeginForm()) { %>
            <p>
                <input type="submit" value="Удалить" class="btn btn-danger" /> 
                <%: Html.ActionLink("К товару", "Edit", "RequestItems", new { @id = Model.RequestItem_id }, new { @class = "btn btn-primary" })%>
            </p>
        <% } %>
    </div>
</div>
</asp:Content>
