<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<ServiceDB.Models.PartItem>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Склад
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h1>Склад запчастей</h1>

<table class="table table-striped">
    <tr>
        <th>Парт-номер</th>
        <th>Описание</th>
        <th>Серийный №</th>
        <th>Поставщик</th>
        <th>Дата прихода</th>
        <th>Цена</th>
        <th>Действия</th>
    </tr>

<% foreach (var item in Model) { %>
    <tr>
        <td>
            <%: Html.DisplayFor(modelItem => item.Part.Part_num) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.Part.Description) %>
        </td>
        <td>
            <%: Html.ActionLink(item.Serial_num, "Details", new { id=item.Id }) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.Supplier.Name) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.Date_in) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.Price) %>
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
