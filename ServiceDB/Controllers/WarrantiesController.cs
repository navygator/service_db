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
	public class WarrantiesController : Controller
	{
		//
		// GET: /Warranties/

		public ViewResult Index()
		{
			return View(Warranty.All());
		}

		//
		// GET: /Warranties/Details/5

		public ViewResult Details(int id)
		{
			var warranty = Warranty.Find(id);
			return View(warranty);
		}

		//
		// GET: /Warranties/Create

		public ActionResult Create()
		{
			return View();
		} 

		//
		// POST: /Warranties/Create

		[HttpPost]
		public ActionResult Create(Warranty warranty)
		{
			if (ModelState.IsValid && Warranty.Create(warranty))
			{
				return RedirectToAction("Index");  
			}

			return View(warranty);
		}
		
		//
		// GET: /Warranties/Edit/5
 
		public ActionResult Edit(int id)
		{
			var warranty = Warranty.Find(id);
			return View(warranty);
		}

		//
		// POST: /Warranties/Edit/5

		[HttpPost]
		public ActionResult Edit(Warranty warranty)
		{
			if (ModelState.IsValid && Warranty.Update(warranty))
			{
				return RedirectToAction("Index");
			}
			return View(warranty);
		}

		//
		// GET: /Warranties/Delete/5
 
		public ActionResult Delete(int id)
		{
			var warranty = Warranty.Find(id);
			return View(warranty);
		}

		//
		// POST: /Warranties/Delete/5

		[HttpPost, ActionName("Delete")]
		public ActionResult DeleteConfirmed(int id)
		{
			Warranty.Destroy(id);
			return RedirectToAction("Index");
		}

		protected override void Dispose(bool disposing)
		{
			base.Dispose(disposing);
		}
	}
}