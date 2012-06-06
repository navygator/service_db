<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.master" Inherits="System.Web.Mvc.ViewPage<ServiceDB.Models.Request>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Просмотр
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<div class="row">
    <div class="span6 offset3">

        <h1>Информация о заявке</h1>

        <fieldset>
            <legend>Заявка</legend>

                        <div class="display-label">Название</div>
            <div class="display-field">
                <%: Html.DisplayFor(model => model.Name) %>
            </div>

            <div class="display-label">Товар</div>
            <div class="display-field">
                <%: Html.DisplayFor(model => model.Item) %>
            </div>

            <div class="display-label">Серийный номер</div>
            <div class="display-field">
                <%: Html.DisplayFor(model => model.Serial_num) %>
            </div>

            <div class="display-label">Мастер</div>
            <div class="display-field">
                <%: Html.DisplayFor(model => model.Employee.FIO) %>
            </div>

            <div class="display-label">Услуга</div>
            <div class="display-field">
                <%: Html.DisplayFor(model => model.Service) %>
            </div>

            <div class="display-label">Описание</div>
            <div class="display-field">
                <%: Html.DisplayFor(model => model.Description) %>
            </div>

            <div class="display-label">Доп. инфо</div>
            <div class="display-field">
                <%: Html.DisplayFor(model => model.More_info) %>
            </div>

            <div class="display-label">Комплектация</div>
            <div class="display-field">
                <%: Html.DisplayFor(model => model.Packing) %>
            </div>

            <div class="display-label">Неисправность</div>
            <div class="display-field">
                <%: Html.DisplayFor(model => model.Defect) %>
            </div>

            <div class="display-label">Гарантия</div>
            <div class="display-field">
                <%: Html.DisplayFor(model => model.Warranty.Name) %>
            </div>

            <div class="display-label">Статус</div>
            <div class="display-field">
                <%: Html.DisplayFor(model => model.State.Name) %>
            </div>

            <div class="display-label">Клиент</div>
            <div class="display-field">
                <%: Html.DisplayFor(model => model.Contragent.FIO) %>
            </div>

            <div class="display-label">Номер заявки в СЦ</div>
            <div class="display-field">
                <%: Html.DisplayFor(model => model.SC_num) %>
            </div>

            <div class="display-label">Результаты диагностики</div>
            <div class="display-field">
                <%: Html.DisplayFor(model => model.Diagnostic_result) %>
            </div>
        </fieldset>
        <p>
            <%: Html.ActionLink("Редактировать", "Edit", new { @id=Model.Id }, new { @class="btn btn-primary" }) %>
            <%: Html.ActionLink("Запчасти", "GetParts", "RequestParts", new { @id = Model.Id }, new { @class = "btn btn-primary" })%>
        </p>
        <p>
             <%: Html.ActionLink("К списку", "Index")%>
        </p>
    </div>
</div>
</asp:Content>
