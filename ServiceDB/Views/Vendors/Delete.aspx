<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.master" Inherits="System.Web.Mvc.ViewPage<ServiceDB.Models.Vendor>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Удаление
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<div class="row">
    <div class="span6 offset3">

        <h1>Удалить производителя</h1>

        <h3>Вы уверены, что желаете удалить?</h3>
        <fieldset>
            <legend>Производитель</legend>

            <div class="display-label">Название</div>
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
