<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.master" Inherits="System.Web.Mvc.ViewPage<ServiceDB.Models.Supplier>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Удаление
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<div class="row">
    <div class="span6 offset3">

        <h2>Удаление поставщика</h2>

        <h3>Вы уверены, что желаете удалить?</h3>
        <fieldset>
            <legend>Поставщик</legend>

            <div class="display-label">Название</div>
            <div class="display-field">
                <%: Html.DisplayFor(model => model.Name) %>
            </div>

            <div class="display-label">Телефон</div>
            <div class="display-field">
                <%: Html.DisplayFor(model => model.Phone) %>
            </div>

            <div class="display-label">Адрес</div>
            <div class="display-field">
                <%: Html.DisplayFor(model => model.Address) %>
            </div>

            <div class="display-label">Контактное лицо</div>
            <div class="display-field">
                <%: Html.DisplayFor(model => model.Contact_name) %>
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
