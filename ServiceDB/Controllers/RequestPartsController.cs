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
	public class RequestPartsController : Controller
	{
		private EntityDataModelContainer db = new EntityDataModelContainer();

		//
		// GET: /RequestParts/

		public ViewResult Index()
		{
			ViewBag.Message = "Список запчастей в заявках";
			var requestsparts = db.RequestsParts.Include("Part").Include("Supplier").Include("Request");
			return View(requestsparts.ToList());
		}

		public ViewResult GetParts(int id)
		{
			ViewBag.Message = "Запчасти в заявке";
			var requestsparts = db.RequestsParts.Where(part => part.Request_id == id).Include("Part").Include("Supplier").Include("Request");
			return View("Index", requestsparts.ToList());
		}
		//
		// GET: /RequestParts/Details/5

		public ViewResult Details(int id)
		{
			RequestPart requestpart = db.RequestsParts.Single(r => r.Id == id);
			return View(requestpart);
		}

		//
		// GET: /RequestParts/Create

		public ActionResult Create(int requestId)
		{
			ViewBag.Part_id = new SelectList(db.Parts, "Id", "Part_num");
			ViewBag.Supplier_id = new SelectList(db.Clients, "Id", "Name");
			//ViewBag.Request_id = new SelectList(db.Requests, "Id", "Name");

			RequestPart part = new RequestPart();
			part.Request_id = requestId;
			//ViewBag.Request_id = requestId;
			return View(part);
		} 

		//
		// POST: /RequestParts/Create

		[HttpPost]
		public ActionResult Create(RequestPart requestpart)
		{
			if (ModelState.IsValid)
			{
				db.RequestsParts.AddObject(requestpart);
				db.SaveChanges();
				return RedirectToAction("Details", "Requests", new { @id = requestpart.Request_id });  
			}

			ViewBag.Part_id = new SelectList(db.Parts, "Id", "Part_num", requestpart.Part_id);
			ViewBag.Supplier_id = new SelectList(db.Clients, "Id", "Name", requestpart.Supplier_id);
			ViewBag.Request_id = new SelectList(db.Requests, "Id", "Name", requestpart.Request_id);
			return View(requestpart);
		}
		
		//
		// GET: /RequestParts/Edit/5
 
		public ActionResult Edit(int id)
		{
			RequestPart requestpart = db.RequestsParts.Single(r => r.Id == id);
			ViewBag.Part_id = new SelectList(db.Parts, "Id", "Part_num", requestpart.Part_id);
			ViewBag.Supplier_id = new SelectList(db.Clients, "Id", "Name", requestpart.Supplier_id);
			ViewBag.Request_id = new SelectList(db.Requests, "Id", "Name", requestpart.Request_id);
			return View(requestpart);
		}

		//
		// POST: /RequestParts/Edit/5

		[HttpPost]
		public ActionResult Edit(RequestPart requestpart)
		{
			if (ModelState.IsValid)
			{
				db.RequestsParts.Attach(requestpart);
				db.ObjectStateManager.ChangeObjectState(requestpart, EntityState.Modified);
				db.SaveChanges();
				return RedirectToAction("Index");
			}
			ViewBag.Part_id = new SelectList(db.Parts, "Id", "Part_num", requestpart.Part_id);
			ViewBag.Supplier_id = new SelectList(db.Clients, "Id", "Name", requestpart.Supplier_id);
			ViewBag.Request_id = new SelectList(db.Requests, "Id", "Name", requestpart.Request_id);
			return View(requestpart);
		}

		//
		// GET: /RequestParts/Delete/5
 
		public ActionResult Delete(int id)
		{
			RequestPart requestpart = db.RequestsParts.Single(r => r.Id == id);
			return View(requestpart);
		}

		//
		// POST: /RequestParts/Delete/5

		[HttpPost, ActionName("Delete")]
		public ActionResult DeleteConfirmed(int id)
		{            
			RequestPart requestpart = db.RequestsParts.Single(r => r.Id == id);
			db.RequestsParts.DeleteObject(requestpart);
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