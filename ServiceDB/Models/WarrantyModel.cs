using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;

namespace ServiceDB.Models
{
	public partial class Warranty
	{
		private static EntityDataModelContainer db = new EntityDataModelContainer();

		protected override void OnPropertyChanged(string property)
		{
			if (property != "Updated_at")
			    Updated_at = DateTime.Now;
			base.OnPropertyChanged(property);
		}

		public static List<Warranty> All()
		{
			return db.Warranties.ToList();
		}

		public static Warranty Find(int id)
		{
			return db.Warranties.Single(e => e.Id == id);
		}

		public static bool Create(Warranty warranty)
		{
			bool result = true;
			try
			{
				db.Warranties.AddObject(warranty);
				db.SaveChanges();
			}
			catch (Exception)
			{
				result = false;
			}

			return result;
		}

		public static bool Update(Warranty warranty)
		{
			bool result = true;
			try
			{
				EntityDataModelContainer mc = new EntityDataModelContainer();
				mc.Warranties.Attach(warranty);
				mc.ObjectStateManager.ChangeObjectState(warranty, EntityState.Modified);
				mc.SaveChanges();
				db.Refresh(System.Data.Objects.RefreshMode.StoreWins, warranty);
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
				var warranty = Find(id);
				db.Warranties.DeleteObject(warranty);
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