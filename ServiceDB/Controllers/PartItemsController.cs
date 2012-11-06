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
	public class PartItemsController : Controller
	{
		//
		// GET: /PartItems/

		public ViewResult Index()
		{
			return View(PartItem.All());
		}

		//
		// GET: /PartItems/Details/5

		public ViewResult Details(int id)
		{
			var partitem = PartItem.Find(id);
			return View(partitem);
		}

		//
		// GET: /PartItems/Create

		public ActionResult Create()
		{
			ViewBag.Supplier_id = new SelectList(Supplier.All(), "Id", "Name");
			ViewBag.Part_id = new SelectList(Part.All(), "Id", "Part_num");
			
			var partitem = new PartItem();
			partitem.Date_in = DateTime.Now;
			
			return View(partitem);
		} 

		//
		// POST: /PartItems/Create

		[HttpPost]
		public ActionResult Create(PartItem partitem)
		{
			if (ModelState.IsValid && PartItem.Create(partitem))
			{
				return RedirectToAction("Index");  
			}

			ViewBag.Supplier_id = new SelectList(Supplier.All(), "Id", "Name", partitem.Supplier_id);
			ViewBag.Part_id = new SelectList(Part.All(), "Id", "Part_num", partitem.Part_id);
			return View(partitem);
		}
		
		//
		// GET: /PartItems/Edit/5
 
		public ActionResult Edit(int id)
		{
			var partitem = PartItem.Find(id);
			ViewBag.Supplier_id = new SelectList(Supplier.All(), "Id", "Name", partitem.Supplier_id);
			ViewBag.Part_id = new SelectList(Part.All(), "Id", "Part_num", partitem.Part_id);
			return View(partitem);
		}

		//
		// POST: /PartItems/Edit/5

		[HttpPost]
		public ActionResult Edit(PartItem partitem)
		{
			if (ModelState.IsValid && PartItem.Update(partitem))
			{
				return RedirectToAction("Index");
			}
			ViewBag.Supplier_id = new SelectList(Supplier.All(), "Id", "Name", partitem.Supplier_id);
			ViewBag.Part_id = new SelectList(Part.All(), "Id", "Part_num", partitem.Part_id);
			return View(partitem);
		}

		//
		// GET: /PartItems/Delete/5
 
		public ActionResult Delete(int id)
		{
			var partitem = PartItem.Find(id);
			return View(partitem);
		}

		//
		// POST: /PartItems/Delete/5

		[HttpPost, ActionName("Delete")]
		public ActionResult DeleteConfirmed(int id)
		{
			PartItem.Destroy(id);
			return RedirectToAction("Index");
		}

		protected override void Dispose(bool disposing)
		{
			base.Dispose(disposing);
		}
	}
}