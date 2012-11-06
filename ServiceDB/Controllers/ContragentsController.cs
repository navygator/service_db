using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ServiceDB.Models;

namespace ServiceDB.Controllers
{ 
	public class ContragentsController : Controller
	{
		//
		// GET: /Contragents/

		public ViewResult Index()
		{
			return View(Contragent.All());
		}

		//
		// GET: /Contragents/Details/5

		public ViewResult Details(int id)
		{
			var contragent = Contragent.Find(id);
			return View(contragent);
		}

		//
		// GET: /Contragents/Create

		public ActionResult Create()
		{
			return View();
		} 

		//
		// POST: /Contragents/Create

		[HttpPost]
		public ActionResult Create(Contragent contragent)
		{
			if (ModelState.IsValid && Contragent.Create(contragent))
			{
				return RedirectToAction("Index");  
			}

			return View(contragent);
		}
		
		//
		// GET: /Contragents/Edit/5
 
		public ActionResult Edit(int id)
		{
			var contragent = Contragent.Find(id);
			return View(contragent);
		}

		//
		// POST: /Contragents/Edit/5

		[HttpPost]
		public ActionResult Edit(Contragent contragent)
		{
			if (ModelState.IsValid && Contragent.Update(contragent))
			{
				return RedirectToAction("Index");
			}
			return View(contragent);
		}

		//
		// GET: /Contragents/Delete/5
 
		public ActionResult Delete(int id)
		{
			var contragent = Contragent.Find(id);
			return View(contragent);
		}

		//
		// POST: /Contragents/Delete/5

		[HttpPost, ActionName("Delete")]
		public ActionResult DeleteConfirmed(int id)
		{            
			Contragent.Destroy(id);
			return RedirectToAction("Index");
		}

		protected override void Dispose(bool disposing)
		{
			base.Dispose(disposing);
		}
	}
}