<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.master" Inherits="System.Web.Mvc.ViewPage<ServiceDB.Models.Supplier>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Просмотр
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<div class="row">
    <div class="span6 offset3">

        <h1>Поставщик</h1>

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
        <p>
            <%: Html.ActionLink("Редактировать", "Edit", new { id = Model.Id }, new { @class="btn btn-primary" })%> 
        </p>
        <p>
            <%: Html.ActionLink("К списку", "Index") %>
        </p>
    </div>
</div>
</asp:Content>
