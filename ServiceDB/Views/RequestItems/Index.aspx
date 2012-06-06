<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<ServiceDB.Models.RequestItem>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Товар
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h1><%: ViewBag.Message %></h1>

<table class="table table-striped">
    <tr>
        <th>Заявка</th>
        <th>Товар</th>
        <th>Серийный номер</th>
        <th>Гарантия</th>
        <th>Мастер</th>
        <th>Описание</th>
        <th>Комплектация</th>
        <th>Неисправность</th>
        <th>Доп. инфо</th>
        <th>Результаты диагностики</th>
        <th>Статус</th>
        <th>Действия</th>
    </tr>

<% foreach (var item in Model) { %>
    <tr>
        <td>
            <%: Html.ActionLink(item.Request_id.ToString(), "Details", new { id=item.Id }) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.Good.Name) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.Serial_num) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.Warranty.Name) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.Employee.FIO) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.Description) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.Packing) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.Defect) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.More_info) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.Diagnostic_result) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.State.Name) %>
        </td>
        <td>
            <%: Html.ActionLink("Править", "Edit", new { @id=item.Id } , new { @class="btn btn-mini" }) %> 
            <%: Html.ActionLink("Удалить", "Delete", new { @id=item.Id} , new { @class="btn btn-mini btn-danger" }) %>
        </td>
    </tr>
<% } %>

</table>

</asp:Content>
