<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<IEnumerable<ServiceDB.Models.RequestItemService>>" %>

<table class="table table-striped">
    <tr>
        <th>Услуга</th>
    </tr>

<% foreach (var item in Model) { %>
    <tr>
        <td>
            <%: Html.DisplayFor(modelItem => item.Service_id) %>
        </td>
    </tr>
<% } %>

</table>
