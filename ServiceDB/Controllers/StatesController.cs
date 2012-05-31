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
	public class StatesController : Controller
	{
		//
		// GET: /States/

		public ViewResult Index()
		{
			return View(State.All());
		}

		//
		// GET: /States/Details/5

		public ViewResult Details(int id)
		{
			var state = State.Find(id);
			return View(state);
		}

		//
		// GET: /States/Create

		public ActionResult Create()
		{
			return View();
		} 

		//
		// POST: /States/Create

		[HttpPost]
		public ActionResult Create(State state)
		{
			if (ModelState.IsValid && State.Create(state))
			{
				return RedirectToAction("Index");  
			}

			return View(state);
		}
		
		//
		// GET: /States/Edit/5
 
		public ActionResult Edit(int id)
		{
			var state = State.Find(id);
			return View(state);
		}

		//
		// POST: /States/Edit/5

		[HttpPost]
		public ActionResult Edit(State state)
		{
			if (ModelState.IsValid && State.Update(state))
			{
				return RedirectToAction("Index");
			}
			return View(state);
		}

		//
		// GET: /States/Delete/5
 
		public ActionResult Delete(int id)
		{
			var state = State.Find(id);
			return View(state);
		}

		//
		// POST: /States/Delete/5

		[HttpPost, ActionName("Delete")]
		public ActionResult DeleteConfirmed(int id)
		{
			State.Destroy(id);
			return RedirectToAction("Index");
		}

		protected override void Dispose(bool disposing)
		{
			base.Dispose(disposing);
		}
	}
}