<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.master" Inherits="System.Web.Mvc.ViewPage<ServiceDB.Models.Request>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Новый
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<div class="row">
    <div class="span6 offset3">

        <h1>Новая заявка</h1>

        <script src="<%: Url.Content("~/Scripts/jquery.validate.min.js") %>" type="text/javascript"></script>
        <script src="<%: Url.Content("~/Scripts/jquery.validate.unobtrusive.min.js") %>" type="text/javascript"></script>

        <% using (Html.BeginForm()) { %>
            <%: Html.ValidationSummary(true) %>
            <fieldset>
                <legend>Заявка</legend>

                <div class="editor-label">
                    <%: Html.LabelFor(model => model.Date) %>
                </div>
                <div class="editor-field">
                    <%: Html.EditorFor(model => model.Date) %>
                    <%: Html.ValidationMessageFor(model => model.Date) %>
                </div>

                <div class="editor-label">
                    <%: Html.LabelFor(model => model.Contragent_id, "Клиент") %>
                </div>
                <div class="editor-field">
                    <%: Html.DropDownList("Contragent_id", String.Empty) %>
                    <%: Html.ValidationMessageFor(model => model.Contragent_id) %>
                </div>

                <div class="editor-label">
                    <%: Html.LabelFor(model => model.State_id, "Статус") %>
                </div>
                <div class="editor-field">
                    <%: Html.DropDownList("State_id", String.Empty) %>
                    <%: Html.ValidationMessageFor(model => model.State_id) %>
                </div>
                <p>
                    <input type="submit" value="Создать" class="btn btn-primary"/>
                </p>
            </fieldset>
        <% } %>

        <div>
            <%: Html.ActionLink("К списку", "Index") %>
        </div>
    </div>
</div>
</asp:Content>
