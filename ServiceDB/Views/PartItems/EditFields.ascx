<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<ServiceDB.Models.PartItem>" %>

<div class="editor-label">
    <%: Html.LabelFor(model => model.Part_id, "Запчасть") %>
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
    <%: Html.LabelFor(model => model.Supplier_id, "Поставщик") %>
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
