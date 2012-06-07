<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<IEnumerable<ServiceDB.Models.RequestItemPart>>" %>

<table class="table table-striped">
    <tr>
        <th>Запчасть</th>
        <th>Серийный №</th>
        <th>Price</th>
    </tr>

<% foreach (var item in Model) { %>
    <tr>
        <td>
            <%: Html.DisplayFor(modelItem => item.Part_id) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.Serial_num) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.Price) %>
        </td>
    </tr>
<% } %>

</table>
