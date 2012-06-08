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
		private EntityDataModelContainer db = new EntityDataModelContainer();

		//
		// GET: /PartItems/

		public ViewResult Index()
		{
			var partitems = db.PartItems.Include("Supplier").Include("Part");
			return View(partitems.ToList());
		}

		//
		// GET: /PartItems/Details/5

		public ViewResult Details(int id)
		{
			PartItem partitem = db.PartItems.Single(p => p.Id == id);
			return View(partitem);
		}

		//
		// GET: /PartItems/Create

		public ActionResult Create()
		{
			ViewBag.Supplier_id = new SelectList(db.Suppliers, "Id", "Name");
			ViewBag.Part_id = new SelectList(db.Parts, "Id", "Part_num");
			
			var partitem = new PartItem();
			partitem.Date_in = DateTime.Now;
			
			return View(partitem);
		} 

		//
		// POST: /PartItems/Create

		[HttpPost]
		public ActionResult Create(PartItem partitem)
		{
			if (ModelState.IsValid)
			{
				db.PartItems.AddObject(partitem);
				db.SaveChanges();
				return RedirectToAction("Index");  
			}

			ViewBag.Supplier_id = new SelectList(db.Suppliers, "Id", "Name", partitem.Supplier_id);
			ViewBag.Part_id = new SelectList(db.Parts, "Id", "Part_num", partitem.Part_id);
			return View(partitem);
		}
		
		//
		// GET: /PartItems/Edit/5
 
		public ActionResult Edit(int id)
		{
			PartItem partitem = db.PartItems.Single(p => p.Id == id);
			ViewBag.Supplier_id = new SelectList(db.Suppliers, "Id", "Name", partitem.Supplier_id);
			ViewBag.Part_id = new SelectList(db.Parts, "Id", "Part_num", partitem.Part_id);
			return View(partitem);
		}

		//
		// POST: /PartItems/Edit/5

		[HttpPost]
		public ActionResult Edit(PartItem partitem)
		{
			if (ModelState.IsValid)
			{
				db.PartItems.Attach(partitem);
				db.ObjectStateManager.ChangeObjectState(partitem, EntityState.Modified);
				db.SaveChanges();
				return RedirectToAction("Index");
			}
			ViewBag.Supplier_id = new SelectList(db.Suppliers, "Id", "Name", partitem.Supplier_id);
			ViewBag.Part_id = new SelectList(db.Parts, "Id", "Part_num", partitem.Part_id);
			return View(partitem);
		}

		//
		// GET: /PartItems/Delete/5
 
		public ActionResult Delete(int id)
		{
			PartItem partitem = db.PartItems.Single(p => p.Id == id);
			return View(partitem);
		}

		//
		// POST: /PartItems/Delete/5

		[HttpPost, ActionName("Delete")]
		public ActionResult DeleteConfirmed(int id)
		{            
			PartItem partitem = db.PartItems.Single(p => p.Id == id);
			db.PartItems.DeleteObject(partitem);
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