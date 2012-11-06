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
		//
		// GET: /Goods/

		public ViewResult Index()
		{
			return View(Good.All());
		}

		//
		// GET: /Goods/Details/5

		public ViewResult Details(int id)
		{
			var good = Good.Find(id);
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
			if (ModelState.IsValid && Good.Create(good))
			{
				return RedirectToAction("Index");  
			}

			return View(good);
		}
		
		//
		// GET: /Goods/Edit/5
 
		public ActionResult Edit(int id)
		{
			var good = Good.Find(id);
			return View(good);
		}

		//
		// POST: /Goods/Edit/5

		[HttpPost]
		public ActionResult Edit(Good good)
		{
			if (ModelState.IsValid && Good.Update(good))
			{
				return RedirectToAction("Index");
			}
			return View(good);
		}

		//
		// GET: /Goods/Delete/5
 
		public ActionResult Delete(int id)
		{
			var good = Good.Find(id);
			return View(good);
		}

		//
		// POST: /Goods/Delete/5

		[HttpPost, ActionName("Delete")]
		public ActionResult DeleteConfirmed(int id)
		{
			Good.Destroy(id);
			return RedirectToAction("Index");
		}

		protected override void Dispose(bool disposing)
		{
			base.Dispose(disposing);
		}
	}
}