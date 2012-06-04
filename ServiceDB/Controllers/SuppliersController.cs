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
	public class SuppliersController : Controller
	{
		private EntityDataModelContainer db = new EntityDataModelContainer();

		//
		// GET: /Suppliers/

		public ViewResult Index()
		{
			return View(db.Suppliers.ToList());
		}

		//
		// GET: /Suppliers/Details/5

		public ViewResult Details(int id)
		{
			Supplier supplier = db.Suppliers.Single(s => s.Id == id);
			return View(supplier);
		}

		//
		// GET: /Suppliers/Create

		public ActionResult Create()
		{
			return View();
		} 

		//
		// POST: /Suppliers/Create

		[HttpPost]
		public ActionResult Create(Supplier supplier)
		{
			if (ModelState.IsValid)
			{
				db.Suppliers.AddObject(supplier);
				db.SaveChanges();
				return RedirectToAction("Index");  
			}

			return View(supplier);
		}
		
		//
		// GET: /Suppliers/Edit/5
 
		public ActionResult Edit(int id)
		{
			Supplier supplier = db.Suppliers.Single(s => s.Id == id);
			return View(supplier);
		}

		//
		// POST: /Suppliers/Edit/5

		[HttpPost]
		public ActionResult Edit(Supplier supplier)
		{
			if (ModelState.IsValid)
			{
				db.Suppliers.Attach(supplier);
				db.ObjectStateManager.ChangeObjectState(supplier, EntityState.Modified);
				db.SaveChanges();
				return RedirectToAction("Index");
			}
			return View(supplier);
		}

		//
		// GET: /Suppliers/Delete/5
 
		public ActionResult Delete(int id)
		{
			Supplier supplier = db.Suppliers.Single(s => s.Id == id);
			return View(supplier);
		}

		//
		// POST: /Suppliers/Delete/5

		[HttpPost, ActionName("Delete")]
		public ActionResult DeleteConfirmed(int id)
		{
			Supplier supplier = db.Suppliers.Single(s => s.Id == id);
			db.Suppliers.DeleteObject(supplier);
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