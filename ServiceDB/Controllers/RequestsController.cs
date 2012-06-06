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
	public class RequestsController : Controller
	{
		private EntityDataModelContainer db = new EntityDataModelContainer();

		//
		// GET: /Default1/

		public ViewResult Index()
		{
			var requests = db.Requests.Include("State").Include("Contragent");
			return View(requests.ToList());
		}

		//
		// GET: /Default1/Details/5

		public ViewResult Details(int id)
		{
			Request request = db.Requests.Single(r => r.Id == id);
			return View(request);
		}

		//
		// GET: /Default1/Create

		public ActionResult Create()
		{
			var request = new Request();
			ViewBag.State_id = new SelectList(db.States, "Id", "Name", 1);
			ViewBag.Contragent_id = new SelectList(db.Contragents, "Id", "FIO");

			request.Date = DateTime.Now;
			return View(request);
		} 

		//
		// POST: /Default1/Create

		[HttpPost]
		public ActionResult Create(Request request)
		{
			if (ModelState.IsValid)
			{
				db.Requests.AddObject(request);
				db.SaveChanges();
				return RedirectToAction("Edit", new { @id = request.Id });  
			}

			ViewBag.State_id = new SelectList(db.States, "Id", "Name", request.State_id);
			ViewBag.Contragent_id = new SelectList(db.Contragents, "Id", "FIO", request.Contragent_id);
			return View(request);
		}
		
		//
		// GET: /Default1/Edit/5
 
		public ActionResult Edit(int id)
		{
			Request request = db.Requests.Single(r => r.Id == id);
			ViewBag.State_id = new SelectList(db.States, "Id", "Name", request.State_id);
			ViewBag.Contragent_id = new SelectList(db.Contragents, "Id", "FIO", request.Contragent_id);
			return View(request);
		}

		//
		// POST: /Default1/Edit/5

		[HttpPost]
		public ActionResult Edit(Request request)
		{
			if (ModelState.IsValid)
			{
				db.Requests.Attach(request);
				db.ObjectStateManager.ChangeObjectState(request, EntityState.Modified);
				db.SaveChanges();
				return RedirectToAction("Index");
			}
			ViewBag.State_id = new SelectList(db.States, "Id", "Name", request.State_id);
			ViewBag.Contragent_id = new SelectList(db.Contragents, "Id", "FIO", request.Contragent_id);
			return View(request);
		}

		//
		// GET: /Default1/Delete/5
 
		public ActionResult Delete(int id)
		{
			Request request = db.Requests.Single(r => r.Id == id);
			return View(request);
		}

		//
		// POST: /Default1/Delete/5

		[HttpPost, ActionName("Delete")]
		public ActionResult DeleteConfirmed(int id)
		{            
			Request request = db.Requests.Single(r => r.Id == id);
			db.Requests.DeleteObject(request);
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