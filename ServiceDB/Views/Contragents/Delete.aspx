<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.master" Inherits="System.Web.Mvc.ViewPage<ServiceDB.Models.Contragent>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Удаление
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<div class="row">
    <div class="span6 offset3">

        <h1>Удалить контрагента</h1>

        <h3>Вы уверены, что желаете удалить?</h3>
        <fieldset>
            <legend>Контрагент</legend>

            <div class="display-label">ФИО</div>
            <div class="display-field">
                <%: Html.DisplayFor(model => model.FIO) %>
            </div>

            <div class="display-label">Телефон</div>
            <div class="display-field">
                <%: Html.DisplayFor(model => model.Phone) %>
            </div>

            <div class="display-label">Адрес</div>
            <div class="display-field">
                <%: Html.DisplayFor(model => model.Address) %>
            </div>

            <div class="display-label">EMail</div>
            <div class="display-field">
                <%: Html.DisplayFor(model => model.EMail) %>
            </div>
        </fieldset>
        <% using (Html.BeginForm()) { %>
            <p>
                <input type="submit" value="Удалить" class="btn btn-danger" /> 
                <%: Html.ActionLink("К списку", "Index", null, new { @class="btn btn-primary" })%>
            </p>
        <% } %>
    </div>
</div>
</asp:Content>
