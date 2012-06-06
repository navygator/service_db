<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<ServiceDB.Models.Request>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Заявки
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h1>Список заявок</h1>

<table class="table table-striped">
    <tr>
        <th>Название</th>
        <th>Товар</th>
        <th>S/N</th>
        <th>Мастер</th>
        <th>Услуга</th>
        <th>Описание</th>
        <th>Неисправность</th>
        <th>Гарантия</th>
        <th>Статус</th>
        <th>Контрагент</th>
        <th>Результаты диагностики</th>
        <th>Действия</th>
    </tr>

<% foreach (var item in Model) { %>
    <tr>
        <td>
            <%: Html.ActionLink(item.Name, "Details", new { id=item.Id }) %> 
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.Item) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.Serial_num) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.Employee.FIO) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.Service) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.Description) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.Defect) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.Warranty.Name) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.State.Name) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.Contragent.FIO) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.Diagnostic_result) %>
        </td>
        <td>
            <%: Html.ActionLink("Редактировать", "Edit", new { @id=item.Id } , new { @class="btn btn-mini" }) %> 
            <%: Html.ActionLink("Удалить", "Delete", new { @id=item.Id} , new { @class="btn btn-mini btn-danger" }) %>
        </td>
    </tr>
<% } %>

</table>
<p>
    <%: Html.ActionLink("Добавить", "Create", null, new { @class = "btn btn-primary" })%>
</p>

</asp:Content>
