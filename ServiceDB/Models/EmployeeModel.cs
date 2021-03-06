﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.ComponentModel.DataAnnotations;

namespace ServiceDB.Models
{
	[MetadataType(typeof(EmployeeMetaData))]
	public partial class Employee
	{
		private static EntityDataModelContainer db = new EntityDataModelContainer();

		protected override void OnPropertyChanged(string property)
		{
			if (property != "Updated_at")
				Updated_at = DateTime.Now;
			base.OnPropertyChanged(property);
		}

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

		public class EmployeeMetaData
		{
			[Required]
			[Display(Name = "ФИО")]
			public string FIO { get; set; }

			[Required]
			[Display(Name = "Телефон")]
			public string Phone { get; set; }
	
			[Required]
			[Display(Name = "Адрес")]
			public string Address { get; set; }

			[Required]
			public string Email { get; set; }
		}
	}
}