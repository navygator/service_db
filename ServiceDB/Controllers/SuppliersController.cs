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
		//
		// GET: /Suppliers/

		public ViewResult Index()
		{
			return View(Supplier.All());
		}

		//
		// GET: /Suppliers/Details/5

		public ViewResult Details(int id)
		{
			var supplier = Supplier.Find(id);
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
			if (ModelState.IsValid && Supplier.Create(supplier))
			{
				return RedirectToAction("Index");  
			}

			return View(supplier);
		}
		
		//
		// GET: /Suppliers/Edit/5
 
		public ActionResult Edit(int id)
		{
			var supplier = Supplier.Find(id);
			return View(supplier);
		}

		//
		// POST: /Suppliers/Edit/5

		[HttpPost]
		public ActionResult Edit(Supplier supplier)
		{
			if (ModelState.IsValid && Supplier.Update(supplier))
			{
				return RedirectToAction("Index");
			}
			return View(supplier);
		}

		//
		// GET: /Suppliers/Delete/5
 
		public ActionResult Delete(int id)
		{
			var supplier = Supplier.Find(id);
			return View(supplier);
		}

		//
		// POST: /Suppliers/Delete/5

		[HttpPost, ActionName("Delete")]
		public ActionResult DeleteConfirmed(int id)
		{
			Supplier.Destroy(id);
			return RedirectToAction("Index");
		}

		protected override void Dispose(bool disposing)
		{
			base.Dispose(disposing);
		}
	}
}