<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<ServiceDB.Models.Service>" %>
<fieldset>
    <legend>Услуга</legend>

    <div class="display-label">Наименование</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.Name) %>
    </div>

</fieldset>

