<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<ServiceDB.Models.Service>" %>

<fieldset>
    <legend>Услуга</legend>

    <div class="editor-label">
        <%: Html.LabelFor(model => model.Name) %>
    </div>
    <div class="editor-field">
        <%: Html.EditorFor(model => model.Name) %>
        <%: Html.ValidationMessageFor(model => model.Name) %>
    </div>

    <p>
        <input type="submit" value="Сохранить" class="btn btn-primary"/>
    </p>
</fieldset>
