﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;

namespace ServiceDB.Models
{
	public partial class Supplier
	{
		private static EntityDataModelContainer db = new EntityDataModelContainer();

		protected override void OnPropertyChanged(string property)
		{
			if (property != "Updated_at")
				Updated_at = DateTime.Now;
			base.OnPropertyChanged(property);
		}

		public static List<Supplier> All()
		{
			return db.Suppliers.ToList();
		}
		
		public static Supplier Find(int id)
		{
			return db.Suppliers.Single(e => e.Id == id);
		}

		public static bool Create(Supplier supplier)
		{
			bool result = true;
			try
			{
				db.Suppliers.AddObject(supplier);
				db.SaveChanges();
			}
			catch (Exception)
			{
				result = false;
			}

			return result;
		}

		public static bool Update(Supplier supplier)
		{
			bool result = true;
			try
			{
				EntityDataModelContainer mc = new EntityDataModelContainer();
				mc.Suppliers.Attach(supplier);
				mc.ObjectStateManager.ChangeObjectState(supplier, EntityState.Modified);
				mc.SaveChanges();
				db.Refresh(System.Data.Objects.RefreshMode.StoreWins, supplier);
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
				var supplier = Find(id);
				db.Suppliers.DeleteObject(supplier);
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