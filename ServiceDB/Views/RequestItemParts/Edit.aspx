﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.master" Inherits="System.Web.Mvc.ViewPage<ServiceDB.Models.RequestItemPart>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Редактировать
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<div class="row">
    <div class="span6 offset3">

        <h1>Редактировать запчасть</h1>

        <script src="<%: Url.Content("~/Scripts/jquery.validate.min.js") %>" type="text/javascript"></script>
        <script src="<%: Url.Content("~/Scripts/jquery.validate.unobtrusive.min.js") %>" type="text/javascript"></script>

        <% using (Html.BeginForm()) { %>
            <%: Html.ValidationSummary(true) %>
            <fieldset>
                <legend>Запчасть</legend>

                <%: Html.HiddenFor(model => model.RequestItem_id) %>

                <h3><%: Html.DisplayFor(model => model.PartItem.Part.Description) %></h3>

                <div class="editor-label">
                    <%: Html.LabelFor(model => model.PartItem_id, "Серийный номер") %>
                </div>
                <div class="editor-field">
                    <%: Html.DropDownList("PartItem_id", String.Empty) %>
                    <%: Html.ValidationMessageFor(model => model.PartItem_id) %>
                </div>

                <p>
                    <input type="submit" value="Сохранить" class="btn btn-primary"/>
                </p>
            </fieldset>
        <% } %>

        <div>
            <%: Html.ActionLink("К товару", "Edit", "RequestItems", new { @id = Model.RequestItem_id }, null)%>
        </div>
    </div>
</div>
</asp:Content>
