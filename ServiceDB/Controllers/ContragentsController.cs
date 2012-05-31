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
    public class ContragentsController : Controller
    {
        private EntityDataModelContainer db = new EntityDataModelContainer();

        //
        // GET: /Contragents/

        public ViewResult Index()
        {
            return View(db.Contragents.ToList());
        }

        //
        // GET: /Contragents/Details/5

        public ViewResult Details(int id)
        {
            Contragent contragent = db.Contragents.Single(c => c.Id == id);
            return View(contragent);
        }

        //
        // GET: /Contragents/Create

        public ActionResult Create()
        {
            return View();
        } 

        //
        // POST: /Contragents/Create

        [HttpPost]
        public ActionResult Create(Contragent contragent)
        {
            if (ModelState.IsValid)
            {
                db.Contragents.AddObject(contragent);
                db.SaveChanges();
                return RedirectToAction("Index");  
            }

            return View(contragent);
        }
        
        //
        // GET: /Contragents/Edit/5
 
        public ActionResult Edit(int id)
        {
            Contragent contragent = db.Contragents.Single(c => c.Id == id);
            return View(contragent);
        }

        //
        // POST: /Contragents/Edit/5

        [HttpPost]
        public ActionResult Edit(Contragent contragent)
        {
            if (ModelState.IsValid)
            {
                db.Contragents.Attach(contragent);
                db.ObjectStateManager.ChangeObjectState(contragent, EntityState.Modified);
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(contragent);
        }

        //
        // GET: /Contragents/Delete/5
 
        public ActionResult Delete(int id)
        {
            Contragent contragent = db.Contragents.Single(c => c.Id == id);
            return View(contragent);
        }

        //
        // POST: /Contragents/Delete/5

        [HttpPost, ActionName("Delete")]
        public ActionResult DeleteConfirmed(int id)
        {            
            Contragent contragent = db.Contragents.Single(c => c.Id == id);
            db.Contragents.DeleteObject(contragent);
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