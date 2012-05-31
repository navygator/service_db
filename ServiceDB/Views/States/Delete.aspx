<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.master" Inherits="System.Web.Mvc.ViewPage<ServiceDB.Models.State>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Удаление
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<div class="row">
    <div class="span6 offset3">

        <h2>Удаление статуса</h2>

        <h3>Вы уверены, что желаете удалить?</h3>
        <fieldset>
            <legend>Статус</legend>

            <div class="display-label">Наименование</div>
            <div class="display-field">
                <%: Html.DisplayFor(model => model.Name) %>
            </div>
        </fieldset>
        <% using (Html.BeginForm()) { %>
            <p>
                <input type="submit" value="Удалить" class="btn btn-danger"/> 
                <%: Html.ActionLink("К списку", "Index", null, new { @class="btn btn-primary" })%>
            </p>
        <% } %>
    </div>
</div>
</asp:Content>
