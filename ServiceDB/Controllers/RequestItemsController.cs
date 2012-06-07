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
	public class RequestItemsController : Controller
	{
		private EntityDataModelContainer db = new EntityDataModelContainer();

		//
		// GET: /RequestItems/

		public ViewResult Index()
		{
			ViewBag.Message = "Товар в ремонте";
			var requestitems = db.RequestItems.Include("Warranty").Include("Employee").Include("Request").Include("State").Include("Good");
			return View(requestitems.ToList());
		}

		//
		// GET: /RequestItems/Details/5

		public ViewResult Details(int id)
		{
			RequestItem requestitem = db.RequestItems.Single(r => r.Id == id);
			return View(requestitem);
		}

		//
		// GET: /RequestItems/Create

		public ActionResult Create(int requestId)
		{
			ViewBag.Warranty_id = new SelectList(db.Warranties, "Id", "Name");
			ViewBag.Employee_id = new SelectList(db.Employees, "Id", "FIO");
			ViewBag.Request_id = new SelectList(db.Requests, "Id", "Id");
			ViewBag.State_id = new SelectList(db.States, "Id", "Name");
			ViewBag.Good_id = new SelectList(db.Goods, "Id", "Name");

			var requestItem = new RequestItem();
			requestItem.Request_id = requestId;
			return View(requestItem);
		} 

		//
		// POST: /RequestItems/Create

		[HttpPost]
		public ActionResult Create(RequestItem requestitem)
		{
			if (ModelState.IsValid)
			{
				db.RequestItems.AddObject(requestitem);
				db.SaveChanges();
				return RedirectToAction("Edit", "Requests", new { @id = requestitem.Request_id });  
			}

			ViewBag.Warranty_id = new SelectList(db.Warranties, "Id", "Name", requestitem.Warranty_id);
			ViewBag.Employee_id = new SelectList(db.Employees, "Id", "FIO", requestitem.Employee_id);
			ViewBag.Request_id = new SelectList(db.Requests, "Id", "Id", requestitem.Request_id);
			ViewBag.State_id = new SelectList(db.States, "Id", "Name", requestitem.State_id);
			ViewBag.Good_id = new SelectList(db.Goods, "Id", "Name", requestitem.Good_id);
			return View(requestitem);
		}
		
		//
		// GET: /RequestItems/Edit/5
 
		public ActionResult Edit(int id)
		{
			RequestItem requestitem = db.RequestItems.Single(r => r.Id == id);
			ViewBag.Warranty_id = new SelectList(db.Warranties, "Id", "Name", requestitem.Warranty_id);
			ViewBag.Employee_id = new SelectList(db.Employees, "Id", "FIO", requestitem.Employee_id);
			ViewBag.Request_id = new SelectList(db.Requests, "Id", "Id", requestitem.Request_id);
			ViewBag.State_id = new SelectList(db.States, "Id", "Name", requestitem.State_id);
			ViewBag.Good_id = new SelectList(db.Goods, "Id", "Name", requestitem.Good_id);
			return View(requestitem);
		}

		//
		// POST: /RequestItems/Edit/5

		[HttpPost]
		public ActionResult Edit(RequestItem requestitem)
		{
			if (ModelState.IsValid)
			{
				db.RequestItems.Attach(requestitem);
				db.ObjectStateManager.ChangeObjectState(requestitem, EntityState.Modified);
				db.SaveChanges();
				return RedirectToAction("Edit", "Requests", new { @id = requestitem.Request_id});
			}
			ViewBag.Warranty_id = new SelectList(db.Warranties, "Id", "Name", requestitem.Warranty_id);
			ViewBag.Employee_id = new SelectList(db.Employees, "Id", "FIO", requestitem.Employee_id);
			ViewBag.Request_id = new SelectList(db.Requests, "Id", "Id", requestitem.Request_id);
			ViewBag.State_id = new SelectList(db.States, "Id", "Name", requestitem.State_id);
			ViewBag.Good_id = new SelectList(db.Goods, "Id", "Name", requestitem.Good_id);
			return View(requestitem);
		}

		//
		// GET: /RequestItems/Delete/5
 
		public ActionResult Delete(int id)
		{
			RequestItem requestitem = db.RequestItems.Single(r => r.Id == id);
			return View(requestitem);
		}

		//
		// POST: /RequestItems/Delete/5

		[HttpPost, ActionName("Delete")]
		public ActionResult DeleteConfirmed(int id)
		{            
			RequestItem requestitem = db.RequestItems.Single(r => r.Id == id);
			db.RequestItems.DeleteObject(requestitem);
			db.SaveChanges();
			return RedirectToAction("Edit", "Requests", new { @id = requestitem.Request_id });
		}

		protected override void Dispose(bool disposing)
		{
			db.Dispose();
			base.Dispose(disposing);
		}
	}
}