<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.master" Inherits="System.Web.Mvc.ViewPage<ServiceDB.Models.RequestPart>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Удаление
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<div class="row">
    <div class="span6 offset3">

        <h1>Удалить запчасть из заявки</h1>

        <h3>Вы уверены, что желаете удалить?</h3>
        <fieldset>
            <legend>Запчасть</legend>

            <div class="display-label">Заявка</div>
            <div class="display-field">
                <%: Html.DisplayFor(model => model.Request.Name) %>
            </div>

            <div class="display-label">Запчасть</div>
            <div class="display-field">
                <%: Html.DisplayFor(model => model.Part.Part_num) %>
            </div>

            <div class="display-label">S/N</div>
            <div class="display-field">
                <%: Html.DisplayFor(model => model.Serial_num) %>
            </div>

            <div class="display-label">Поставщик</div>
            <div class="display-field">
                <%: Html.DisplayFor(model => model.Supplier.Name) %>
            </div>

            <div class="display-label">Дата прихода</div>
            <div class="display-field">
                <%: Html.DisplayFor(model => model.Date_in) %>
            </div>

            <div class="display-label">Цена</div>
            <div class="display-field">
                <%: Html.DisplayFor(model => model.Price) %>
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
