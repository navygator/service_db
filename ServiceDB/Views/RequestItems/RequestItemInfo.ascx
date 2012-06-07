<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<ServiceDB.Models.RequestItem>" %>

<fieldset>
    <legend>Товар в ремонте</legend>

    <div class="display-label">Товар</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.Good.Name) %>
    </div>

    <div class="display-label">Серийный №</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.Serial_num) %>
    </div>

    <div class="display-label">Гарантия</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.Warranty.Name) %>
    </div>

    <div class="display-label">Мастер</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.Employee.FIO) %>
    </div>

    <div class="display-label">Описание</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.Description) %>
    </div>

    <div class="display-label">Комплектация</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.Packing) %>
    </div>

    <div class="display-label">Неисправность</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.Defect) %>
    </div>

    <div class="display-label">Доп. инфо</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.More_info) %>
    </div>

    <div class="display-label">Результаты диагностики</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.Diagnostic_result) %>
    </div>

    <div class="display-label">Статус</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.State.Name) %>
    </div>

</fieldset>

