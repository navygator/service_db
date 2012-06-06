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
    public class GoodsController : Controller
    {
        private EntityDataModelContainer db = new EntityDataModelContainer();

        //
        // GET: /Goods/

        public ViewResult Index()
        {
            return View(db.Goods.ToList());
        }

        //
        // GET: /Goods/Details/5

        public ViewResult Details(int id)
        {
            Good good = db.Goods.Single(g => g.Id == id);
            return View(good);
        }

        //
        // GET: /Goods/Create

        public ActionResult Create()
        {
            return View();
        } 

        //
        // POST: /Goods/Create

        [HttpPost]
        public ActionResult Create(Good good)
        {
            if (ModelState.IsValid)
            {
                db.Goods.AddObject(good);
                db.SaveChanges();
                return RedirectToAction("Index");  
            }

            return View(good);
        }
        
        //
        // GET: /Goods/Edit/5
 
        public ActionResult Edit(int id)
        {
            Good good = db.Goods.Single(g => g.Id == id);
            return View(good);
        }

        //
        // POST: /Goods/Edit/5

        [HttpPost]
        public ActionResult Edit(Good good)
        {
            if (ModelState.IsValid)
            {
                db.Goods.Attach(good);
                db.ObjectStateManager.ChangeObjectState(good, EntityState.Modified);
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(good);
        }

        //
        // GET: /Goods/Delete/5
 
        public ActionResult Delete(int id)
        {
            Good good = db.Goods.Single(g => g.Id == id);
            return View(good);
        }

        //
        // POST: /Goods/Delete/5

        [HttpPost, ActionName("Delete")]
        public ActionResult DeleteConfirmed(int id)
        {            
            Good good = db.Goods.Single(g => g.Id == id);
            db.Goods.DeleteObject(good);
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