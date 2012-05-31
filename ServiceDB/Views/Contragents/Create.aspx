<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.master" Inherits="System.Web.Mvc.ViewPage<ServiceDB.Models.Contragent>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Новый
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<div class="row">
    <div class="span6 offset3">

        <h1>Новый контрагент</h1>

        <script src="<%: Url.Content("~/Scripts/jquery.validate.min.js") %>" type="text/javascript"></script>
        <script src="<%: Url.Content("~/Scripts/jquery.validate.unobtrusive.min.js") %>" type="text/javascript"></script>

        <% using (Html.BeginForm()) { %>
            <%: Html.ValidationSummary(true) %>
            <fieldset>
                <legend>Контрагент</legend>

                <div class="editor-label">
                    <%: Html.LabelFor(model => model.FIO, "ФИО") %>
                </div>
                <div class="editor-field">
                    <%: Html.EditorFor(model => model.FIO) %>
                    <%: Html.ValidationMessageFor(model => model.FIO) %>
                </div>

                <div class="editor-label">
                    <%: Html.LabelFor(model => model.Phone, "Телефон") %>
                </div>
                <div class="editor-field">
                    <%: Html.EditorFor(model => model.Phone) %>
                    <%: Html.ValidationMessageFor(model => model.Phone) %>
                </div>

                <div class="editor-label">
                    <%: Html.LabelFor(model => model.Address, "Адрес") %>
                </div>
                <div class="editor-field">
                    <%: Html.EditorFor(model => model.Address) %>
                    <%: Html.ValidationMessageFor(model => model.Address) %>
                </div>

                <div class="editor-label">
                    <%: Html.LabelFor(model => model.EMail, "Email") %>
                </div>
                <div class="editor-field">
                    <%: Html.EditorFor(model => model.EMail) %>
                    <%: Html.ValidationMessageFor(model => model.EMail) %>
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
