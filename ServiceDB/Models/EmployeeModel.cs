using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;

namespace ServiceDB.Models
{
	public partial class Employee
	{
		private static EntityDataModelContainer db = new EntityDataModelContainer();

		public static List<Employee> All()
		{
			return db.Employees.ToList();
		}

		public static Employee Find(int id)
		{
			return db.Employees.Single(e => e.Id == id);
		}

		public static bool Create(Employee employee)
		{
			bool result = true;
			try
			{
				db.Employees.AddObject(employee);
				db.SaveChanges();
			}
			catch (Exception)
			{
				result = false;
			}

			return result;
		}

		public static bool Update(Employee employee)
		{
			bool result = true;
			try
			{
				EntityDataModelContainer mc = new EntityDataModelContainer();
				mc.Employees.Attach(employee);
				mc.ObjectStateManager.ChangeObjectState(employee, EntityState.Modified);
				mc.SaveChanges();
				db.Refresh(System.Data.Objects.RefreshMode.StoreWins, employee);
			}
			catch (Exception)
			{
				result = false;
			}

			return result;
		}

		public static bool Destroy(int id)
		{
			bool result = true;
			try
			{
				var employee = Find(id);
				db.Employees.DeleteObject(employee);
				db.SaveChanges();
			}
			catch (Exception)
			{
				result = false;
			}

			return result;
		}
	}
}