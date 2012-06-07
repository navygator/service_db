<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.master" Inherits="System.Web.Mvc.ViewPage<ServiceDB.Models.RequestItem>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Create
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<div class="row">
    <div class="span6 offset3">
        <h1>Добавить товар</h1>

        <script src="<%: Url.Content("~/Scripts/jquery.validate.min.js") %>" type="text/javascript"></script>
        <script src="<%: Url.Content("~/Scripts/jquery.validate.unobtrusive.min.js") %>" type="text/javascript"></script>

        <% using (Html.BeginForm()) { %>
            <%: Html.ValidationSummary(true) %>
            <fieldset>
                <legend>Ремонт</legend>
                <%: Html.HiddenFor(model => model.Request_id) %>

                <div class="editor-label">
                    <%: Html.LabelFor(model => model.Good_id, "Товар") %>
                </div>
                <div class="editor-field">
                    <%: Html.DropDownList("Good_id", String.Empty) %>
                    <%: Html.ValidationMessageFor(model => model.Good_id) %>
                </div>

                <div class="editor-label">
                    <%: Html.LabelFor(model => model.Serial_num) %>
                </div>
                <div class="editor-field">
                    <%: Html.EditorFor(model => model.Serial_num) %>
                    <%: Html.ValidationMessageFor(model => model.Serial_num) %>
                </div>

                <div class="editor-label">
                    <%: Html.LabelFor(model => model.Warranty_id, "Гарантия") %>
                </div>
                <div class="editor-field">
                    <%: Html.DropDownList("Warranty_id", String.Empty) %>
                    <%: Html.ValidationMessageFor(model => model.Warranty_id) %>
                </div>

                <div class="editor-label">
                    <%: Html.LabelFor(model => model.Employee_id, "Мастер") %>
                </div>
                <div class="editor-field">
                    <%: Html.DropDownList("Employee_id", String.Empty) %>
                    <%: Html.ValidationMessageFor(model => model.Employee_id) %>
                </div>

                <div class="editor-label">
                    <%: Html.LabelFor(model => model.Description) %>
                </div>
                <div class="editor-field">
                    <%: Html.EditorFor(model => model.Description) %>
                    <%: Html.ValidationMessageFor(model => model.Description) %>
                </div>

                <div class="editor-label">
                    <%: Html.LabelFor(model => model.Packing) %>
                </div>
                <div class="editor-field">
                    <%: Html.EditorFor(model => model.Packing) %>
                    <%: Html.ValidationMessageFor(model => model.Packing) %>
                </div>

                <div class="editor-label">
                    <%: Html.LabelFor(model => model.Defect) %>
                </div>
                <div class="editor-field">
                    <%: Html.EditorFor(model => model.Defect) %>
                    <%: Html.ValidationMessageFor(model => model.Defect) %>
                </div>

                <div class="editor-label">
                    <%: Html.LabelFor(model => model.More_info) %>
                </div>
                <div class="editor-field">
                    <%: Html.EditorFor(model => model.More_info) %>
                    <%: Html.ValidationMessageFor(model => model.More_info) %>
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
            <%: Html.ActionLink("К заявке", "Edit", "Requests", new { @id = Model.Request_id }, null)%>
        </div>
    </div>
</div>
</asp:Content>
