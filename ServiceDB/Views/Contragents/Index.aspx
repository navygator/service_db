﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<ServiceDB.Models.Contragent>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Контрагенты
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h1>Список контрагентов</h1>

<table class="table table-striped">
    <tr>
        <th>ФИО</th>
        <th>Телефон</th>
        <th>Адрес</th>
        <th>EMail</th>
        <th>Действия</th>
    </tr>

<% foreach (var item in Model) { %>
    <tr>
        <td>
            <%: Html.ActionLink(item.FIO, "Details", new { id=item.Id }) %> 
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.Phone) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.Address) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.EMail) %>
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
