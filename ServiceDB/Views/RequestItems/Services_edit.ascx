<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<IEnumerable<ServiceDB.Models.RequestItemService>>" %>
<table class="table table-striped">
    <tr>
        <th>Услуга</th>
        <th>Цена</th>
        <th>Действия</th>
    </tr>

<% foreach (var item in Model) { %>
    <tr>
        <td><%: Html.DisplayFor(modelItem => item.Service.Name) %></td>
        <td><%: Html.DisplayFor(modelItem => item.Price) %></td>
        <td>
            <%: Html.ActionLink("Править", "Edit", "RequestItemServices", new { @id=item.Id } , new { @class="btn btn-mini" }) %> 
            <%: Html.ActionLink("Удалить", "Delete", "RequestItemServices", new { @id = item.Id }, new { @class = "btn btn-mini btn-danger" })%>
        </td>
    </tr>
<% } %>
</table>

