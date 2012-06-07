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
	public class ServicesController : Controller
	{
		private EntityDataModelContainer db = new EntityDataModelContainer();

		//
		// GET: /Services/

		public ViewResult Index()
		{
			return View(db.Services.ToList());
		}

		//
		// GET: /Services/Details/5

		public ViewResult Details(int id)
		{
			var service = db.Services.Single(s => s.Id == id);
			return View(service);
		}

		//
		// GET: /Services/Create

		public ActionResult Create()
		{
			return View();
		} 

		//
		// POST: /Services/Create

		[HttpPost]
		public ActionResult Create(Models.Service service)
		{
			if (ModelState.IsValid)
			{
				db.Services.AddObject(service);
				db.SaveChanges();
				return RedirectToAction("Index");  
			}

			return View(service);
		}
		
		//
		// GET: /Services/Edit/5
 
		public ActionResult Edit(int id)
		{
			var service = db.Services.Single(s => s.Id == id);
			return View(service);
		}

		//
		// POST: /Services/Edit/5

		[HttpPost]
		public ActionResult Edit(Models.Service service)
		{
			if (ModelState.IsValid)
			{
				db.Services.Attach(service);
				db.ObjectStateManager.ChangeObjectState(service, EntityState.Modified);
				db.SaveChanges();
				return RedirectToAction("Index");
			}
			return View(service);
		}

		//
		// GET: /Services/Delete/5
 
		public ActionResult Delete(int id)
		{
			var service = db.Services.Single(s => s.Id == id);
			return View(service);
		}

		//
		// POST: /Services/Delete/5

		[HttpPost, ActionName("Delete")]
		public ActionResult DeleteConfirmed(int id)
		{
			var service = db.Services.Single(s => s.Id == id);
			db.Services.DeleteObject(service);
			db.SaveChanges();
			return RedirectToAction("Index");
		}

		protected override void Dispose(bool disposing)
		{
			db.Dispose();
			base.Dispose(disposing);
		}
	}
}