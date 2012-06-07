<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<ServiceDB.Models.RequestItemService>" %>
<fieldset>
    <legend>Услуги по заявке</legend>

    <%: Html.HiddenFor(model => model.RequestItem.Id) %>

    <div class="display-label">Услуга</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.Service.Name) %>
    </div>

    <div class="display-label">Цена</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.Price) %>
    </div>
</fieldset>

