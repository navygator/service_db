<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.master" Inherits="System.Web.Mvc.ViewPage<ServiceDB.Models.Employee>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Удалить
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<div class="row">
    <div class="span6 offset3">
        <h1>Удалить сотрудника</h1>

        <h3>Вы уверены, что желаете удалить?</h3>
        <fieldset>
            <legend>Данные</legend>

            <div class="display-label">ФИО</div>
            <div class="display-field">
                <%: Html.DisplayFor(model => model.FIO) %>
            </div>

            <div class="display-label">Адрес</div>
            <div class="display-field">
                <%: Html.DisplayFor(model => model.Address) %>
            </div>

            <div class="display-label">Телефон</div>
            <div class="display-field">
                <%: Html.DisplayFor(model => model.Phone) %>
            </div>

            <div class="display-label">Email</div>
            <div class="display-field">
                <%: Html.DisplayFor(model => model.Email) %>
            </div>
        </fieldset>
        <% using (Html.BeginForm()) { %>
            <p>
                <input type="submit" value="Удалить" class="btn btn-danger" /> 
                <%: Html.ActionLink("К списку", "Index", null, new { @class="btn btn-primary"})%>
            </p>
        <% } %>
    </div>
</div>
</asp:Content>
