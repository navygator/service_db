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
	public class VendorsController : Controller
	{
		//
		// GET: /Vendors/

		public ViewResult Index()
		{
			return View(Vendor.All());
		}

		//
		// GET: /Vendors/Details/5

		public ViewResult Details(int id)
		{
			var vendor = Vendor.Find(id);
			return View(vendor);
		}

		//
		// GET: /Vendors/Create

		public ActionResult Create()
		{
			return View();
		} 

		//
		// POST: /Vendors/Create

		[HttpPost]
		public ActionResult Create(Vendor vendor)
		{
			if (ModelState.IsValid && Vendor.Create(vendor))
			{
				return RedirectToAction("Index");  
			}

			return View(vendor);
		}
		
		//
		// GET: /Vendors/Edit/5
 
		public ActionResult Edit(int id)
		{
			var vendor = Vendor.Find(id);
			return View(vendor);
		}

		//
		// POST: /Vendors/Edit/5

		[HttpPost]
		public ActionResult Edit(Vendor vendor)
		{
			if (ModelState.IsValid && Vendor.Update(vendor))
			{
				return RedirectToAction("Index");
			}
			return View(vendor);
		}

		//
		// GET: /Vendors/Delete/5
 
		public ActionResult Delete(int id)
		{
			var vendor = Vendor.Find(id);
			return View(vendor);
		}

		//
		// POST: /Vendors/Delete/5

		[HttpPost, ActionName("Delete")]
		public ActionResult DeleteConfirmed(int id)
		{
			Vendor.Destroy(id);
			return RedirectToAction("Index");
		}

		protected override void Dispose(bool disposing)
		{
			base.Dispose(disposing);
		}
	}
}