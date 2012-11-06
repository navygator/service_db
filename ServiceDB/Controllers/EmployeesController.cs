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
	public class EmployeesController : Controller
	{
		//
		// GET: /Employees/

		public ViewResult Index()
		{
			return View(Employee.All());
		}

		//
		// GET: /Employees/Details/5
		public ViewResult Details(int id)
		{
			var employee = Employee.Find(id);
			return View(employee);
		}

		//
		// GET: /Employees/Create

		public ActionResult Create()
		{
			return View();
		} 

		//
		// POST: /Employees/Create

		[HttpPost]
		public ActionResult Create(Employee employee)
		{
			if (ModelState.IsValid && Employee.Create(employee))
			{
				return RedirectToAction("Index");  
			}

			return View(employee);
		}
		
		//
		// GET: /Employees/Edit/5
 
		public ActionResult Edit(int id)
		{
			var employee = Employee.Find(id);
			return View(employee);
		}

		//
		// POST: /Employees/Edit/5

		[HttpPost]
		public ActionResult Edit(Employee employee)
		{
			if (ModelState.IsValid && Employee.Update(employee))
			{
				return RedirectToAction("Details", new { @id = employee.Id });
			}
			return View(employee);
		}

		//
		// GET: /Employees/Delete/5
 
		public ActionResult Delete(int id)
		{
			Employee employee = Employee.Find(id);
			return View(employee);
		}

		//
		// POST: /Employees/Delete/5

		[HttpPost, ActionName("Delete")]
		public ActionResult DeleteConfirmed(int id)
		{
			Employee.Destroy(id);
			return RedirectToAction("Index");
		}

		protected override void Dispose(bool disposing)
		{
			base.Dispose(disposing);
		}
	}
}