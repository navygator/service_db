<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<ServiceDB.Models.PartItem>" %>
<fieldset>
    <legend>Запчасть</legend>

    <div class="display-label">Парт-номер</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.Part.Part_num) %>
    </div>

    <div class="display-label">Серийный номер</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.Serial_num) %>
    </div>

    <div class="display-label">Поставщик</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.Supplier.Name) %>
    </div>

    <div class="display-label">Дата прихода</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.Date_in) %>
    </div>

    <div class="display-label">Цена</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.Price) %>
    </div>
</fieldset>

