using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.ComponentModel.DataAnnotations;

namespace ServiceDB.Models
{
	public partial class Category
	{
		private static EntityDataModelContainer db = new EntityDataModelContainer();

		public static List<Category> All()
		{
			return db.Categories.ToList();
		}

		public static Category Find(int id)
		{
			return db.Categories.Single(e => e.Id == id);
		}

		public static bool Create(Category category)
		{
			bool result = true;
			try
			{
				db.Categories.AddObject(category);
				db.SaveChanges();
			}
			catch (Exception)
			{
				result = false;
			}

			return result;
		}

		public static bool Update(Category сategory)
		{
			bool result = true;
			try
			{
				EntityDataModelContainer mc = new EntityDataModelContainer();
				mc.Categories.Attach(сategory);
				mc.ObjectStateManager.ChangeObjectState(сategory, EntityState.Modified);
				mc.SaveChanges();
				db.Refresh(System.Data.Objects.RefreshMode.StoreWins, сategory);
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
				var category = Find(id);
				db.Categories.DeleteObject(category);
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