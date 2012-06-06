<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.master" Inherits="System.Web.Mvc.ViewPage<ServiceDB.Models.Good>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Редактировать
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<div class="row">
    <div class="span6 offset3">

        <h1>Редактировать товар</h1>

        <script src="<%: Url.Content("~/Scripts/jquery.validate.min.js") %>" type="text/javascript"></script>
        <script src="<%: Url.Content("~/Scripts/jquery.validate.unobtrusive.min.js") %>" type="text/javascript"></script>

        <% using (Html.BeginForm()) { %>
            <%: Html.ValidationSummary(true) %>
            <fieldset>
                <legend>Товар</legend>

                <%: Html.HiddenFor(model => model.Id) %>

                <div class="editor-label">
                    <%: Html.LabelFor(model => model.Name) %>
                </div>
                <div class="editor-field">
                    <%: Html.EditorFor(model => model.Name) %>
                    <%: Html.ValidationMessageFor(model => model.Name) %>
                </div>

                <p>
                    <input type="submit" value="Сохранить" class="btn btn-primary" />
                </p>
            </fieldset>
        <% } %>

        <div>
            <%: Html.ActionLink("К списку", "Index") %>
        </div>
    </div>
</div>
</asp:Content>
