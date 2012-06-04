using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ServiceDB.Controllers
{
	public class HomeController : Controller
	{
		public ActionResult Index()
		{
			ViewBag.Message = "Добро пожаловать в базу учета СЦ";
			ViewBag.Feed = Models.Feed.All();
			return View();
		}

		public ActionResult About()
		{
			return View();
		}
	}
}
