<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.master" Inherits="System.Web.Mvc.ViewPage<ServiceDB.Models.Request>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Edit
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<h1>Редактировать заявку №<%: Model.Id.ToString() %></h1>

<div class="row">
    <div class="span4">

        <script src="<%: Url.Content("~/Scripts/jquery.validate.min.js") %>" type="text/javascript"></script>
        <script src="<%: Url.Content("~/Scripts/jquery.validate.unobtrusive.min.js") %>" type="text/javascript"></script>
        <script src="<%: Url.Content("~/Scripts/requests.js") %>" type="text/javascript"></script>

        <% using (Html.BeginForm()) { %>
            <%: Html.ValidationSummary(true) %>
            <fieldset>
                <legend>Заявка</legend>

                <%: Html.HiddenFor(model => model.Id) %>

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
                    <input type="submit" value="Сохранить" class="btn btn-primary" />
                </p>
            </fieldset>
        <% } %>

        <div>
            <%: Html.ActionLink("К списку", "Index") %>
        </div>
    </div>
    <div class="span7 offset1">
        <fieldset>
            <legend>Товар в ремонт</legend>
                <table class="table table-striped">
                <tr>
                    <th>Наименование</th>
                    <th>Серийный №</th>
                    <th>Неисправность</th>
                    <th>Статус</th>
                    <th>Действия</th>
                </tr>
                <% foreach(var item in Model.RequestItem) { %>
                <tr>
                    <th><%: Html.DisplayFor(modelItem => item.Good.Name) %></th>
                    <th><%: Html.DisplayFor(modelItem => item.Serial_num) %></th>
                    <th><%: Html.DisplayFor(modelItem => item.Defect) %></th>
                    <th><%: Html.DisplayFor(modelItem => item.State.Name) %></th>
                    <th>
                        <%: Html.ActionLink("Править", "Edit", "RequestItems", new { @id=item.Id } , new { @class="btn btn-mini" }) %> 
                        <%: Html.ActionLink("Удалить", "Delete", "RequestItems", new { @id = item.Id }, new { @class = "btn btn-mini btn-danger" })%>
                    </th>
                </tr>
                <% } %>
            </table>
        </fieldset>
        <p>
            <%: Html.ActionLink("Добавить", "Create", "RequestItems", new { @requestid = Model.Id }, new { @class = "btn btn-primary" })%>
        </p>
    </div>
</div>

</asp:Content>
