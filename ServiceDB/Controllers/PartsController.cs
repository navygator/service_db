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
	public class PartsController : Controller
	{
		//
		// GET: /Parts/

		public ViewResult Index()
		{
			return View(Part.All());
		}

		//
		// GET: /Parts/Details/5

		public ViewResult Details(int id)
		{
			var part = Part.Find(id);
			return View(part);
		}

		//
		// GET: /Parts/Create

		public ActionResult Create()
		{
			ViewBag.Category_id = new SelectList(Category.All(), "Id", "Name");
			ViewBag.Vendor_id = new SelectList(Vendor.All(), "Id", "Name");
			ViewBag.Supplier_id = new SelectList(Supplier.All(), "Id", "Name");
			return View();
		} 

		//
		// POST: /Parts/Create

		[HttpPost]
		public ActionResult Create(Part part)
		{
			if (ModelState.IsValid && Part.Create(part))
			{
				return RedirectToAction("Index");  
			}

			ViewBag.Category_id = new SelectList(Category.All(), "Id", "Name", part.Category_id);
			ViewBag.Vendor_id = new SelectList(Vendor.All(), "Id", "Name", part.Vendor_id);
			return View(part);
		}
		
		//
		// GET: /Parts/Edit/5
 
		public ActionResult Edit(int id)
		{
			var part = Part.Find(id);
			ViewBag.Category_id = new SelectList(Category.All(), "Id", "Name", part.Category_id);
			ViewBag.Vendor_id = new SelectList(Vendor.All(), "Id", "Name", part.Vendor_id);
			return View(part);
		}

		//
		// POST: /Parts/Edit/5

		[HttpPost]
		public ActionResult Edit(Part part)
		{
			if (ModelState.IsValid && Part.Update(part))
			{
				return RedirectToAction("Index");
			}
			ViewBag.Category_id = new SelectList(Category.All(), "Id", "Name", part.Category_id);
			ViewBag.Vendor_id = new SelectList(Vendor.All(), "Id", "Name", part.Vendor_id);
			return View(part);
		}

		//
		// GET: /Parts/Delete/5
 
		public ActionResult Delete(int id)
		{
			var part = Part.Find(id);
			return View(part);
		}

		//
		// POST: /Parts/Delete/5

		[HttpPost, ActionName("Delete")]
		public ActionResult DeleteConfirmed(int id)
		{
			Part.Destroy(id);
			return RedirectToAction("Index");
		}

		protected override void Dispose(bool disposing)
		{
			base.Dispose(disposing);
		}
	}
}