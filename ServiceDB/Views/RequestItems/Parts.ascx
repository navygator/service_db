<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<IEnumerable<ServiceDB.Models.RequestItemPart>>" %>

<table class="table table-striped">
    <tr>
        <th>Запчасть</th>
        <th>Серийный №</th>
        <th>Цена</th>
    </tr>

<% foreach (var item in Model) { %>
    <tr>
        <td>
            <%: Html.DisplayFor(modelItem => item.PartItem.Part.Description) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.PartItem.Serial_num)%>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.PartItem.Price)%>
        </td>
    </tr>
<% } %>

</table>
