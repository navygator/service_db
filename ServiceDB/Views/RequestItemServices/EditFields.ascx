<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<ServiceDB.Models.RequestItemService>" %>

    <%: Html.HiddenFor(model => model.RequestItem_id) %>

<div class="editor-label">
    <%: Html.LabelFor(model => model.Service_id) %>
</div>
<div class="editor-field">
    <%: Html.DropDownList("Service_id", String.Empty) %>
    <%: Html.ValidationMessageFor(model => model.Service_id) %>
</div>

<div class="editor-label">
    <%: Html.LabelFor(model => model.Price) %>
</div>
<div class="editor-field">
    <%: Html.EditorFor(model => model.Price) %>
    <%: Html.ValidationMessageFor(model => model.Price) %>
</div>

