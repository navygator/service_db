<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.master" Inherits="System.Web.Mvc.ViewPage<ServiceDB.Models.Request>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Новый
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<div class="row">
    <h1>Новая заявка</h1>

    <script src="<%: Url.Content("~/Scripts/jquery.validate.min.js") %>" type="text/javascript"></script>
    <script src="<%: Url.Content("~/Scripts/jquery.validate.unobtrusive.min.js") %>" type="text/javascript"></script>

    <div class="span5">
        <% using (Html.BeginForm()) { %>
            <%: Html.ValidationSummary(true) %>
            <fieldset>
                <legend>Заявка</legend>

                <div class="editor-label">
                    <%: Html.LabelFor(model => model.Name, "Название") %>
                </div>
                <div class="editor-field">
                    <%: Html.EditorFor(model => model.Name) %>
                    <%: Html.ValidationMessageFor(model => model.Name) %>
                </div>

                <div class="editor-label">
                    <%: Html.LabelFor(model => model.Item, "Товар") %>
                </div>
                <div class="editor-field">
                    <%: Html.EditorFor(model => model.Item) %>
                    <%: Html.ValidationMessageFor(model => model.Item) %>
                </div>

                <div class="editor-label">
                    <%: Html.LabelFor(model => model.Defect, "Неисправность") %>
                </div>
                <div class="editor-field">
                    <%: Html.EditorFor(model => model.Defect) %>
                    <%: Html.ValidationMessageFor(model => model.Defect) %>
                </div>

                <div class="editor-label">
                    <%: Html.LabelFor(model => model.Serial_num, "Серийный номер") %>
                </div>
                <div class="editor-field">
                    <%: Html.EditorFor(model => model.Serial_num) %>
                    <%: Html.ValidationMessageFor(model => model.Serial_num) %>
                </div>

                <div class="editor-label">
                    <%: Html.LabelFor(model => model.Packing, "Комплектация")%>
                </div>
                <div class="editor-field">
                    <%: Html.EditorFor(model => model.Packing)%>
                    <%: Html.ValidationMessageFor(model => model.Packing) %>
                </div>

                <div class="editor-label">
                    <%: Html.LabelFor(model => model.Contragent_id, "Клиент") %>
                </div>
                <div class="editor-field">
                    <%: Html.DropDownList("Contragent_id", String.Empty) %>
                    <%: Html.ValidationMessageFor(model => model.Contragent_id) %>
                </div>

                <div class="editor-label">
                    <%: Html.LabelFor(model => model.Description, "Описание") %>
                </div>
                <div class="editor-field">
                    <%: Html.TextAreaFor(model => model.Description)%>
                    <%: Html.ValidationMessageFor(model => model.Description) %>
                </div>
                <p>
                    <input type="submit" value="Создать" class="btn btn-primary"/>
                </p>
            </fieldset>
        <div>
            <%: Html.ActionLink("К списку", "Index") %>
        </div>
    </div>
    <div class="span5 offset1">
            <fieldset>
                <legend>Работа</legend>
                <div class="editor-label">
                    <%: Html.LabelFor(model => model.More_info, "Доп. инфор") %>
                </div>
                <div class="editor-field">
                    <%: Html.TextAreaFor(model => model.More_info)%>
                    <%: Html.ValidationMessageFor(model => model.More_info) %>
                </div>

                <div class="editor-label">
                    <%: Html.LabelFor(model => model.Warranty_id, "Гарантия") %>
                </div>
                <div class="editor-field">
                    <%: Html.DropDownList("Warranty_id", String.Empty) %>
                    <%: Html.ValidationMessageFor(model => model.Warranty_id) %>
                </div>

                <div class="editor-label">
                    <%: Html.LabelFor(model => model.Service, "Услуга") %>
                </div>
                <div class="editor-field">
                    <%: Html.EditorFor(model => model.Service) %>
                    <%: Html.ValidationMessageFor(model => model.Service) %>
                </div>

                <div class="editor-label">
                    <%: Html.LabelFor(model => model.Employee_id, "Мастер") %>
                </div>
                <div class="editor-field">
                    <%: Html.DropDownList("Employee_id", String.Empty) %>
                    <%: Html.ValidationMessageFor(model => model.Employee_id) %>
                </div>

                <div class="editor-label">
                    <%: Html.LabelFor(model => model.State_id, "Статус") %>
                </div>
                <div class="editor-field">
                    <%: Html.DropDownList("State_id", String.Empty) %>
                    <%: Html.ValidationMessageFor(model => model.State_id) %>
                </div>

                <div class="editor-label">
                    <%: Html.LabelFor(model => model.SC_num, "Номер заявки СЦ") %>
                </div>
                <div class="editor-field">
                    <%: Html.EditorFor(model => model.SC_num) %>
                    <%: Html.ValidationMessageFor(model => model.SC_num) %>
                </div>

                <div class="editor-label">
                    <%: Html.LabelFor(model => model.Diagnostic_result, "Результаты диагностики") %>
                </div>
                <div class="editor-field">
                    <%: Html.TextAreaFor(model => model.Diagnostic_result) %>
                    <%: Html.ValidationMessageFor(model => model.Diagnostic_result) %>
                </div>
            </fieldset>
        </div>
        <% } %>
</div>
</asp:Content>
