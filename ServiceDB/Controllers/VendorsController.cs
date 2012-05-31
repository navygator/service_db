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
        private EntityDataModelContainer db = new EntityDataModelContainer();

        //
        // GET: /Vendors/

        public ViewResult Index()
        {
            return View(db.Vendors.ToList());
        }

        //
        // GET: /Vendors/Details/5

        public ViewResult Details(int id)
        {
            Vendor vendor = db.Vendors.Single(v => v.Id == id);
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
            if (ModelState.IsValid)
            {
                db.Vendors.AddObject(vendor);
                db.SaveChanges();
                return RedirectToAction("Index");  
            }

            return View(vendor);
        }
        
        //
        // GET: /Vendors/Edit/5
 
        public ActionResult Edit(int id)
        {
            Vendor vendor = db.Vendors.Single(v => v.Id == id);
            return View(vendor);
        }

        //
        // POST: /Vendors/Edit/5

        [HttpPost]
        public ActionResult Edit(Vendor vendor)
        {
            if (ModelState.IsValid)
            {
                db.Vendors.Attach(vendor);
                db.ObjectStateManager.ChangeObjectState(vendor, EntityState.Modified);
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(vendor);
        }

        //
        // GET: /Vendors/Delete/5
 
        public ActionResult Delete(int id)
        {
            Vendor vendor = db.Vendors.Single(v => v.Id == id);
            return View(vendor);
        }

        //
        // POST: /Vendors/Delete/5

        [HttpPost, ActionName("Delete")]
        public ActionResult DeleteConfirmed(int id)
        {            
            Vendor vendor = db.Vendors.Single(v => v.Id == id);
            db.Vendors.DeleteObject(vendor);
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