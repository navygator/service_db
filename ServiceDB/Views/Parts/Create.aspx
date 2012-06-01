<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.master" Inherits="System.Web.Mvc.ViewPage<ServiceDB.Models.Part>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Новый
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<div class="row">
    <div class="span6 offset3">

        <h1>Новая запчасть</h1>

        <script src="<%: Url.Content("~/Scripts/jquery.validate.min.js") %>" type="text/javascript"></script>
        <script src="<%: Url.Content("~/Scripts/jquery.validate.unobtrusive.min.js") %>" type="text/javascript"></script>

        <% using (Html.BeginForm()) { %>
            <%: Html.ValidationSummary(true) %>
            <fieldset>
                <legend>Запчасть</legend>

                <div class="editor-label">
                    <%: Html.LabelFor(model => model.Category_id, "Категория") %>
                </div>
                <div class="editor-field">
                    <%: Html.DropDownList("Category_id", String.Empty) %>
                    <%: Html.ValidationMessageFor(model => model.Category_id) %>
                </div>

                <div class="editor-label">
                    <%: Html.LabelFor(model => model.Vendor_id, "Производитель") %>
                </div>
                <div class="editor-field">
                    <%: Html.DropDownList("Vendor_id", String.Empty) %>
                    <%: Html.ValidationMessageFor(model => model.Vendor_id) %>
                </div>

                <div class="editor-label">
                    <%: Html.LabelFor(model => model.Part_num, "Парт-номер") %>
                </div>
                <div class="editor-field">
                    <%: Html.EditorFor(model => model.Part_num) %>
                    <%: Html.ValidationMessageFor(model => model.Part_num) %>
                </div>

                <div class="editor-label">
                    <%: Html.LabelFor(model => model.Description, "Описание") %>
                </div>
                <div class="editor-field">
                    <%: Html.EditorFor(model => model.Description) %>
                    <%: Html.ValidationMessageFor(model => model.Description) %>
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
