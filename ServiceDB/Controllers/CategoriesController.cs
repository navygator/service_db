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
    public class CategoriesController : Controller
    {
        private EntityDataModelContainer db = new EntityDataModelContainer();

        //
        // GET: /Categories/

        public ViewResult Index()
        {
            return View(db.Categories.ToList());
        }

        //
        // GET: /Categories/Details/5

        public ViewResult Details(int id)
        {
            Category category = db.Categories.Single(c => c.Id == id);
            return View(category);
        }

        //
        // GET: /Categories/Create

        public ActionResult Create()
        {
            return View();
        } 

        //
        // POST: /Categories/Create

        [HttpPost]
        public ActionResult Create(Category category)
        {
            if (ModelState.IsValid)
            {
                db.Categories.AddObject(category);
                db.SaveChanges();
                return RedirectToAction("Index");  
            }

            return View(category);
        }
        
        //
        // GET: /Categories/Edit/5
 
        public ActionResult Edit(int id)
        {
            Category category = db.Categories.Single(c => c.Id == id);
            return View(category);
        }

        //
        // POST: /Categories/Edit/5

        [HttpPost]
        public ActionResult Edit(Category category)
        {
            if (ModelState.IsValid)
            {
                db.Categories.Attach(category);
                db.ObjectStateManager.ChangeObjectState(category, EntityState.Modified);
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(category);
        }

        //
        // GET: /Categories/Delete/5
 
        public ActionResult Delete(int id)
        {
            Category category = db.Categories.Single(c => c.Id == id);
            return View(category);
        }

        //
        // POST: /Categories/Delete/5

        [HttpPost, ActionName("Delete")]
        public ActionResult DeleteConfirmed(int id)
        {            
            Category category = db.Categories.Single(c => c.Id == id);
            db.Categories.DeleteObject(category);
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