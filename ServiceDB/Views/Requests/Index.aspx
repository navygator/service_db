<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<ServiceDB.Models.Request>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Заявки
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h1>Список заявок</h1>

<table class="table table-striped">
    <tr>
        <th>#</th>
        <th>Дата</th>
        <th>Клиент</th>
        <th>Статус</th>
        <th>Действия</th>
    </tr>

<% foreach (var item in Model) { %>
    <tr>
        <td>
            <%: Html.ActionLink(item.Id.ToString(), "Details", new { id=item.Id }) %> 
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.Date) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.Contragent.FIO) %>
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
<p>
    <%: Html.ActionLink("Добавить", "Create", null, new { @class = "btn btn-primary" })%>
</p>

</asp:Content>
