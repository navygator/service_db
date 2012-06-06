<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.master" Inherits="System.Web.Mvc.ViewPage<ServiceDB.Models.Request>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Details
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<div class="row">
    <h1>Информация по заявке №<%: Model.Id.ToString() %></h1>
    <div class="span4">
        <% Html.RenderPartial("RequestInfo", Model); %>
        <p>
            <%: Html.ActionLink("Редактировать", "Edit", new { @id=Model.Id }, new { @class="btn btn-primary" }) %>
        </p>
        <p>
             <%: Html.ActionLink("К списку", "Index")%>
        </p>
    </div>
    <div class="span7 offset1">
        <% Html.RenderPartial("Items", Model.RequestItem ); %>
    </div>
</div>
</asp:Content>
