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
		//
		// GET: /Categories/

		public ViewResult Index()
		{
			return View(Category.All());
		}

		//
		// GET: /Categories/Details/5

		public ViewResult Details(int id)
		{
			var category = Category.Find(id);
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
			if (ModelState.IsValid && Category.Create(category))
			{
				return RedirectToAction("Index");  
			}

			return View(category);
		}
		
		//
		// GET: /Categories/Edit/5
 
		public ActionResult Edit(int id)
		{
			var category = Category.Find(id);
			return View(category);
		}

		//
		// POST: /Categories/Edit/5

		[HttpPost]
		public ActionResult Edit(Category category)
		{
			if (ModelState.IsValid && Category.Update(category))
			{
				return RedirectToAction("Index");
			}
			return View(category);
		}

		//
		// GET: /Categories/Delete/5
 
		public ActionResult Delete(int id)
		{
			var category = Category.Find(id);
			return View(category);
		}

		//
		// POST: /Categories/Delete/5

		[HttpPost, ActionName("Delete")]
		public ActionResult DeleteConfirmed(int id)
		{
			Category.Destroy(id);
			return RedirectToAction("Index");
		}

		protected override void Dispose(bool disposing)
		{
			base.Dispose(disposing);
		}
	}
}