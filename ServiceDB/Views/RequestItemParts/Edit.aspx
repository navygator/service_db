<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.master" Inherits="System.Web.Mvc.ViewPage<ServiceDB.Models.RequestItemPart>" %>

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

                <div class="editor-label">
                    <%: Html.LabelFor(model => model.Part_id) %>
                </div>
                <div class="editor-field">
                    <%: Html.DropDownList("Part_id", String.Empty) %>
                    <%: Html.ValidationMessageFor(model => model.Part_id) %>
                </div>

                <div class="editor-label">
                    <%: Html.LabelFor(model => model.Serial_num) %>
                </div>
                <div class="editor-field">
                    <%: Html.EditorFor(model => model.Serial_num) %>
                    <%: Html.ValidationMessageFor(model => model.Serial_num) %>
                </div>

                <div class="editor-label">
                    <%: Html.LabelFor(model => model.Supplier_id) %>
                </div>
                <div class="editor-field">
                    <%: Html.DropDownList("Supplier_id", String.Empty) %>
                    <%: Html.ValidationMessageFor(model => model.Supplier_id) %>
                </div>

                <div class="editor-label">
                    <%: Html.LabelFor(model => model.Date_in) %>
                </div>
                <div class="editor-field">
                    <%: Html.EditorFor(model => model.Date_in) %>
                    <%: Html.ValidationMessageFor(model => model.Date_in) %>
                </div>

                <div class="editor-label">
                    <%: Html.LabelFor(model => model.Price) %>
                </div>
                <div class="editor-field">
                    <%: Html.EditorFor(model => model.Price) %>
                    <%: Html.ValidationMessageFor(model => model.Price) %>
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
