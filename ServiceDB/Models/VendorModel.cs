using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;

namespace ServiceDB.Models
{
	public partial class Vendor
	{
		private static EntityDataModelContainer db = new EntityDataModelContainer();

		protected override void OnPropertyChanged(string property)
		{
			if (property != "Updated_at")
				Updated_at = DateTime.Now;
			base.OnPropertyChanged(property);
		}

		public static List<Vendor> All()
		{
			return db.Vendors.ToList();
		}

		public static Vendor Find(int id)
		{
			return db.Vendors.Single(e => e.Id == id);
		}

		public static bool Create(Vendor vendor)
		{
			bool result = true;
			try
			{
				db.Vendors.AddObject(vendor);
				db.SaveChanges();
			}
			catch (Exception)
			{
				result = false;
			}

			return result;
		}

		public static bool Update(Vendor vendor)
		{
			bool result = true;
			try
			{
				EntityDataModelContainer mc = new EntityDataModelContainer();
				mc.Vendors.Attach(vendor);
				mc.ObjectStateManager.ChangeObjectState(vendor, EntityState.Modified);
				mc.SaveChanges();
				db.Refresh(System.Data.Objects.RefreshMode.StoreWins, vendor);
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
				var vendor = Find(id);
				db.Vendors.DeleteObject(vendor);
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