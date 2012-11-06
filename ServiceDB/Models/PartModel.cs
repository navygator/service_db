using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;

namespace ServiceDB.Models
{
	public partial class Part
	{
		private static EntityDataModelContainer db = new EntityDataModelContainer();

		public static List<Part> All()
		{
			return db.Parts.ToList();
		}

		public static Part Find(int id)
		{
			return db.Parts.Single(e => e.Id == id);
		}

		public static bool Create(Part part)
		{
			bool result = true;
			try
			{
				db.Parts.AddObject(part);
				db.SaveChanges();
			}
			catch (Exception)
			{
				result = false;
			}

			return result;
		}

		public static bool Update(Part part)
		{
			bool result = true;
			try
			{
				EntityDataModelContainer mc = new EntityDataModelContainer();
				mc.Parts.Attach(part);
				mc.ObjectStateManager.ChangeObjectState(part, EntityState.Modified);
				mc.SaveChanges();
				db.Refresh(System.Data.Objects.RefreshMode.StoreWins, part);
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
				var part = Find(id);
				db.Parts.DeleteObject(part);
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