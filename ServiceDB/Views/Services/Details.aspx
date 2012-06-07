<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.master" Inherits="System.Web.Mvc.ViewPage<ServiceDB.Models.Service>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Details
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<div class="row">
    <div class="span6 offset3">

        <h1>Услуга</h1>
        <% Html.RenderPartial("Service_info", Model); %>
        <p>
            <%: Html.ActionLink("Редактировать", "Edit", new { @id=Model.Id }, new { @class="btn btn-primary" }) %>
        </p>
        <p>
             <%: Html.ActionLink("К списку", "Index")%>
        </p>
    </div>
</div>
</asp:Content>
