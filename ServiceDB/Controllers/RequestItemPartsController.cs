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
	public class RequestItemPartsController : Controller
	{
		private EntityDataModelContainer db = new EntityDataModelContainer();

		//
		// GET: /RequestParts/

		public ViewResult Index()
		{
			ViewBag.Message = "Список запчастей в заявках";
			var requestsparts = db.RequestItemParts.Include("PartItem").Include("RequestItem");
			return View(requestsparts.ToList());
		}

		public ViewResult GetParts(int id)
		{
			ViewBag.Message = "Запчасти в заявке";
			var requestItemPart = db.RequestItemParts.Where(part => part.RequestItem_id == id).Include("PartItem").Include("RequestItem");
			return View("Index", requestItemPart.ToList());
		}
		//
		// GET: /RequestParts/Details/5

		public ViewResult Details(int id)
		{
			var requestItemPart = db.RequestItemParts.Single(r => r.Id == id);
			return View(requestItemPart);
		}

		//
		// GET: /RequestParts/Create

		public ActionResult Create(int requestItemId)
		{
			ViewBag.Part_id = new SelectList(db.Parts, "Id", "Description");
			ViewBag.PartItem_id = new SelectList(db.PartItems.Where(pi => pi.Id == -1), "Id", "Serial_num");
			ViewBag.Supplier_id = new SelectList(db.Suppliers, "Id", "Name");

			var part = new RequestItemPart();

			part.RequestItem_id = requestItemId;
			return View(part);
		} 

		//
		// POST: /RequestParts/Create

		[HttpPost]
		public ActionResult Create(RequestItemPart requestpart)
		{
			if (ModelState.IsValid)
			{
				db.RequestItemParts.AddObject(requestpart);
				db.SaveChanges();
				return RedirectToAction("Edit", "RequestItems", new { @id = requestpart.RequestItem_id });  
			}

			ViewBag.PartItem_id = new SelectList(db.PartItems, "Id", "Serial_num", requestpart.PartItem_id);
			ViewBag.RequestItem_id = new SelectList(db.RequestItems, "Id", "Name", requestpart.RequestItem_id);
			return View(requestpart);
		}
		
		//
		// GET: /RequestParts/Edit/5
 
		public ActionResult Edit(int id)
		{
			RequestItemPart requestpart = db.RequestItemParts.Single(r => r.Id == id);
			ViewBag.PartItem_id = new SelectList(db.PartItems, "Id", "Serial_num", requestpart.PartItem_id);
			ViewBag.RequestItem_id = new SelectList(db.RequestItems, "Id", "Name", requestpart.RequestItem_id);
			return View(requestpart);
		}

		//
		// POST: /RequestParts/Edit/5

		[HttpPost]
		public ActionResult Edit(RequestItemPart requestpart)
		{
			if (ModelState.IsValid)
			{
				db.RequestItemParts.Attach(requestpart);
				db.ObjectStateManager.ChangeObjectState(requestpart, EntityState.Modified);
				db.SaveChanges();
				return RedirectToAction("Edit", "RequestItems", new { @id = requestpart.RequestItem_id });
			}
			ViewBag.PartItem_id = new SelectList(db.PartItems, "Id", "Serial_num", requestpart.PartItem_id);
			ViewBag.RequestItem_id = new SelectList(db.RequestItems, "Id", "Name", requestpart.RequestItem_id);
			return View(requestpart);
		}

		//
		// GET: /RequestParts/Delete/5
 
		public ActionResult Delete(int id)
		{
			RequestItemPart requestpart = db.RequestItemParts.Single(r => r.Id == id);
			return View(requestpart);
		}

		//
		// POST: /RequestParts/Delete/5

		[HttpPost, ActionName("Delete")]
		public ActionResult DeleteConfirmed(int id)
		{
			RequestItemPart requestpart = db.RequestItemParts.Single(r => r.Id == id);
			db.RequestItemParts.DeleteObject(requestpart);
			db.SaveChanges();
			return RedirectToAction("Edit", "RequestItems", new { @id = requestpart.RequestItem_id });
		}

		public JsonResult FreeItems(int partId)
		{
			var parts = db.PartItems.Where(pi => pi.Part_id == partId && pi.RequestItemPart.Count == 0);
			var json = Json(new SelectList(parts, "Id", "Serial_num", 0), JsonRequestBehavior.AllowGet);
			return json;
		}

		protected override void Dispose(bool disposing)
		{
			db.Dispose();
			base.Dispose(disposing);
		}
	}
}