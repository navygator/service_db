<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.master" Inherits="System.Web.Mvc.ViewPage<ServiceDB.Models.Part>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Просмотр
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<div class="row">
    <div class="span4 offset3">
        <h1>Инмормация о запчасти</h1>

        <fieldset>
            <legend>Запчасть</legend>

            <div class="display-label">Категория</div>
            <div class="display-field">
                <%: Html.DisplayFor(model => model.Category.Name) %>
            </div>

            <div class="display-label">Производитель</div>
            <div class="display-field">
                <%: Html.DisplayFor(model => model.Vendor.Name) %>
            </div>

            <div class="display-label">Парт-номер</div>
            <div class="display-field">
                <%: Html.DisplayFor(model => model.Part_num) %>
            </div>

            <div class="display-label">Описание</div>
            <div class="display-field">
                <%: Html.DisplayFor(model => model.Description) %>
            </div>

        </fieldset>
        <p>
            <%: Html.ActionLink("Редактировать", "Edit", new { @id=Model.Id }, new { @class="btn btn-primary" }) %>
        </p>
        <p>
             <%: Html.ActionLink("К списку", "Index")%>
        </p>
    </div>
</div>
</asp:Content>
