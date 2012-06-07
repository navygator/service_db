<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<ServiceDB.Models.RequestItemPart>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Запчасти по заявкам
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h1><%: ViewBag.Message %></h1>

<table class="table table-striped">
    <tr>
        <th></th>
        <th>Заявка</th>
        <th>Запчасть</th>
        <th>S/N</th>
        <th>Поставщик</th>
        <th>Дата прихода</th>
        <th>Цена</th>
        <th>Действия</th>
    </tr>

<% foreach (var item in Model) { %>
    <tr>
        <td>
             <%: Html.ActionLink("Подробно", "Details", new { id=item.Id }) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.RequestItem.Description) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.Part.Part_num) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.Serial_num) %>
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
            <%: Html.ActionLink("Править", "Edit", new { @id=item.Id } , new { @class="btn btn-mini" }) %> 
            <%: Html.ActionLink("Удалить", "Delete", new { @id=item.Id} , new { @class="btn btn-mini btn-danger" }) %>
        </td>
    </tr>
<% } %>

</table>

</asp:Content>
