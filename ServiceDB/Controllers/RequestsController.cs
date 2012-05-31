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
        // GET: /Requests/

        public ViewResult Index()
        {
            var requests = db.Requests.Include("State").Include("Warranty").Include("Employee").Include("Contragent");
            return View(requests.ToList());
        }

        //
        // GET: /Requests/Details/5

        public ViewResult Details(int id)
        {
            Request request = db.Requests.Single(r => r.Id == id);
            return View(request);
        }

        //
        // GET: /Requests/Create

        public ActionResult Create()
        {
            ViewBag.State_id = new SelectList(db.States, "Id", "Name");
            ViewBag.Warranty_id = new SelectList(db.Warranties, "Id", "Name");
            ViewBag.Employee_id = new SelectList(db.Employees, "Id", "FIO");
            ViewBag.Contragent_id = new SelectList(db.Contragents, "Id", "FIO");
            return View();
        } 

        //
        // POST: /Requests/Create

        [HttpPost]
        public ActionResult Create(Request request)
        {
            if (ModelState.IsValid)
            {
                db.Requests.AddObject(request);
                db.SaveChanges();
                return RedirectToAction("Index");  
            }

            ViewBag.State_id = new SelectList(db.States, "Id", "Name", request.State_id);
            ViewBag.Warranty_id = new SelectList(db.Warranties, "Id", "Name", request.Warranty_id);
            ViewBag.Employee_id = new SelectList(db.Employees, "Id", "FIO", request.Employee_id);
            ViewBag.Contragent_id = new SelectList(db.Contragents, "Id", "FIO", request.Contragent_id);
            return View(request);
        }
        
        //
        // GET: /Requests/Edit/5
 
        public ActionResult Edit(int id)
        {
            Request request = db.Requests.Single(r => r.Id == id);
            ViewBag.State_id = new SelectList(db.States, "Id", "Name", request.State_id);
            ViewBag.Warranty_id = new SelectList(db.Warranties, "Id", "Name", request.Warranty_id);
            ViewBag.Employee_id = new SelectList(db.Employees, "Id", "FIO", request.Employee_id);
            ViewBag.Contragent_id = new SelectList(db.Contragents, "Id", "FIO", request.Contragent_id);
            return View(request);
        }

        //
        // POST: /Requests/Edit/5

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
            ViewBag.Warranty_id = new SelectList(db.Warranties, "Id", "Name", request.Warranty_id);
            ViewBag.Employee_id = new SelectList(db.Employees, "Id", "FIO", request.Employee_id);
            ViewBag.Contragent_id = new SelectList(db.Contragents, "Id", "FIO", request.Contragent_id);
            return View(request);
        }

        //
        // GET: /Requests/Delete/5
 
        public ActionResult Delete(int id)
        {
            Request request = db.Requests.Single(r => r.Id == id);
            return View(request);
        }

        //
        // POST: /Requests/Delete/5

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