<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<IEnumerable<ServiceDB.Models.RequestItem>>" %>
<fieldset>
    <legend>Товар в ремонт</legend>
        <table class="table table-striped">
        <tr>
            <th>Наименование</th>
            <th>Серийный №</th>
            <th>Неисправность</th>
            <th>Статус</th>
        </tr>
        <% foreach(var item in Model) { %>
        <tr>
            <th><%: Html.DisplayFor(modelItem => item.Good.Name) %></th>
            <th><%: Html.DisplayFor(modelItem => item.Serial_num) %></th>
            <th><%: Html.DisplayFor(modelItem => item.Defect) %></th>
            <th><%: Html.DisplayFor(modelItem => item.State.Name) %></th>
        </tr>
        <% } %>
    </table>
</fieldset>

