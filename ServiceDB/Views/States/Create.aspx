<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.master" Inherits="System.Web.Mvc.ViewPage<ServiceDB.Models.State>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Новый
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<div class="row">
    <div class="span6 offset3">
        <h1>Новый статус</h1>

        <script src="<%: Url.Content("~/Scripts/jquery.validate.min.js") %>" type="text/javascript"></script>
        <script src="<%: Url.Content("~/Scripts/jquery.validate.unobtrusive.min.js") %>" type="text/javascript"></script>

        <% using (Html.BeginForm()) { %>
            <%: Html.ValidationSummary(true) %>
            <fieldset>
                <legend>Стаус</legend>

                <div class="editor-label">
                    <%: Html.LabelFor(model => model.Name, "Наименование") %>
                </div>
                <div class="editor-field">
                    <%: Html.EditorFor(model => model.Name) %>
                    <%: Html.ValidationMessageFor(model => model.Name) %>
                </div>

                <p>
                    <input type="submit" value="Создать", class="btn btn-primary" />
                </p>
            </fieldset>
        <% } %>

        <div>
            <%: Html.ActionLink("К списку", "Index") %>
        </div>
    </div>
</div>
</asp:Content>
