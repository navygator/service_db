<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>
<h2>Последние обновления</h2>
<ul class="nav nav-tabs nav-stacked">
    <% foreach (var item in ViewBag.Feed) %>
    <% { %>
       <li><a href="<%: item.Url %>"><%: item.Name %></a></li>
    <% } %>
</ul>
