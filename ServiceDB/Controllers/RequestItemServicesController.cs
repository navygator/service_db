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
	public class RequestItemServicesController : Controller
	{
		private EntityDataModelContainer db = new EntityDataModelContainer();

		//
		// GET: /RequestItemServices/

		public ViewResult Index()
		{
			var requestitemservices = db.RequestItemServices.Include("RequestItem").Include("Service");
			return View(requestitemservices.ToList());
		}

		//
		// GET: /RequestItemServices/Details/5

		public ViewResult Details(int id)
		{
			RequestItemService requestitemservice = db.RequestItemServices.Single(r => r.Id == id);
			return View(requestitemservice);
		}

		//
		// GET: /RequestItemServices/Create

		public ActionResult Create(int requestItemId)
		{
			ViewBag.RequestItem_id = new SelectList(db.RequestItems, "Id", "Serial_num");
			ViewBag.Service_id = new SelectList(db.Services, "Id", "Name");
			
			var requestitemservices = new RequestItemService();
			requestitemservices.RequestItem_id = requestItemId;
			
			return View(requestitemservices);
		} 

		//
		// POST: /RequestItemServices/Create

		[HttpPost]
		public ActionResult Create(RequestItemService requestitemservice)
		{
			if (ModelState.IsValid)
			{
				db.RequestItemServices.AddObject(requestitemservice);
				db.SaveChanges();
				return RedirectToAction("Edit", "RequestItems", new { @id = requestitemservice.RequestItem_id });
			}

			ViewBag.RequestItem_id = new SelectList(db.RequestItems, "Id", "Serial_num", requestitemservice.RequestItem_id);
			ViewBag.Service_id = new SelectList(db.Services, "Id", "Name", requestitemservice.Service_id);
			return View(requestitemservice);
		}
		
		//
		// GET: /RequestItemServices/Edit/5
 
		public ActionResult Edit(int id)
		{
			RequestItemService requestitemservice = db.RequestItemServices.Single(r => r.Id == id);
			ViewBag.RequestItem_id = new SelectList(db.RequestItems, "Id", "Serial_num", requestitemservice.RequestItem_id);
			ViewBag.Service_id = new SelectList(db.Services, "Id", "Name", requestitemservice.Service_id);
			return View(requestitemservice);
		}

		//
		// POST: /RequestItemServices/Edit/5

		[HttpPost]
		public ActionResult Edit(RequestItemService requestitemservice)
		{
			if (ModelState.IsValid)
			{
				db.RequestItemServices.Attach(requestitemservice);
				db.ObjectStateManager.ChangeObjectState(requestitemservice, EntityState.Modified);
				db.SaveChanges();
				return RedirectToAction("Edit", "RequestItems", new { @id = requestitemservice.RequestItem_id });
			}
			ViewBag.RequestItem_id = new SelectList(db.RequestItems, "Id", "Serial_num", requestitemservice.RequestItem_id);
			ViewBag.Service_id = new SelectList(db.Services, "Id", "Name", requestitemservice.Service_id);
			return View(requestitemservice);
		}

		//
		// GET: /RequestItemServices/Delete/5
 
		public ActionResult Delete(int id)
		{
			RequestItemService requestitemservice = db.RequestItemServices.Single(r => r.Id == id);
			return View(requestitemservice);
		}

		//
		// POST: /RequestItemServices/Delete/5

		[HttpPost, ActionName("Delete")]
		public ActionResult DeleteConfirmed(int id)
		{            
			RequestItemService requestitemservice = db.RequestItemServices.Single(r => r.Id == id);
			db.RequestItemServices.DeleteObject(requestitemservice);
			db.SaveChanges();
			return RedirectToAction("Edit", "RequestItems", new { @id = requestitemservice.RequestItem_id });
		}

		protected override void Dispose(bool disposing)
		{
			db.Dispose();
			base.Dispose(disposing);
		}
	}
}