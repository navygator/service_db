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
        private EntityDataModelContainer db = new EntityDataModelContainer();

        //
        // GET: /Parts/

        public ViewResult Index()
        {
            var parts = db.Parts.Include("Category").Include("Vendor");
            return View(parts.ToList());
        }

        //
        // GET: /Parts/Details/5

        public ViewResult Details(int id)
        {
            Part part = db.Parts.Single(p => p.Id == id);
            return View(part);
        }

        //
        // GET: /Parts/Create

        public ActionResult Create()
        {
            ViewBag.Category_id = new SelectList(db.Categories, "Id", "Name");
            ViewBag.Vendor_id = new SelectList(db.Vendors, "Id", "Name");
            ViewBag.Supplier_id = new SelectList(db.Clients, "Id", "Name");
            return View();
        } 

        //
        // POST: /Parts/Create

        [HttpPost]
        public ActionResult Create(Part part)
        {
            if (ModelState.IsValid)
            {
                db.Parts.AddObject(part);
                db.SaveChanges();
                return RedirectToAction("Index");  
            }

            ViewBag.Category_id = new SelectList(db.Categories, "Id", "Name", part.Category_id);
            ViewBag.Vendor_id = new SelectList(db.Vendors, "Id", "Name", part.Vendor_id);
            return View(part);
        }
        
        //
        // GET: /Parts/Edit/5
 
        public ActionResult Edit(int id)
        {
            Part part = db.Parts.Single(p => p.Id == id);
            ViewBag.Category_id = new SelectList(db.Categories, "Id", "Name", part.Category_id);
            ViewBag.Vendor_id = new SelectList(db.Vendors, "Id", "Name", part.Vendor_id);
            return View(part);
        }

        //
        // POST: /Parts/Edit/5

        [HttpPost]
        public ActionResult Edit(Part part)
        {
            if (ModelState.IsValid)
            {
                db.Parts.Attach(part);
                db.ObjectStateManager.ChangeObjectState(part, EntityState.Modified);
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.Category_id = new SelectList(db.Categories, "Id", "Name", part.Category_id);
            ViewBag.Vendor_id = new SelectList(db.Vendors, "Id", "Name", part.Vendor_id);
            return View(part);
        }

        //
        // GET: /Parts/Delete/5
 
        public ActionResult Delete(int id)
        {
            Part part = db.Parts.Single(p => p.Id == id);
            return View(part);
        }

        //
        // POST: /Parts/Delete/5

        [HttpPost, ActionName("Delete")]
        public ActionResult DeleteConfirmed(int id)
        {            
            Part part = db.Parts.Single(p => p.Id == id);
            db.Parts.DeleteObject(part);
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