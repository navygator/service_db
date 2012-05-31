<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.master" Inherits="System.Web.Mvc.ViewPage<ServiceDB.Models.State>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Просмотр
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<div class="row">
    <div class="span6 offset3">
        <h1>Статус</h1>

        <fieldset>
            <legend>Статус</legend>

            <div class="display-label">Наименование</div>
            <div class="display-field">
                <%: Html.DisplayFor(model => model.Name) %>
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
