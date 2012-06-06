<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<ServiceDB.Models.Request>" %>
<fieldset>
    <legend>Заявка</legend>

    <div class="display-label">Дата приемки</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.Date) %>
    </div>

    <div class="display-label">Клиент</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.Contragent.FIO) %>
    </div>

    <div class="display-label">Статус</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.State.Name) %>
    </div>
</fieldset>

