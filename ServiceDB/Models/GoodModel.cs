using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;
using System.Data;

namespace ServiceDB.Models
{
	[MetadataType(typeof(GoodMetaData))]
	public partial class Good
	{
		private static EntityDataModelContainer db = new EntityDataModelContainer();

		protected override void OnPropertyChanged(string property)
		{
			if (property != "Updated_at")
				Updated_at = DateTime.Now;
			base.OnPropertyChanged(property);
		}

		public static List<Good> All()
		{
			return db.Goods.ToList();
		}

		public static Good Find(int id)
		{
			return db.Goods.Single(e => e.Id == id);
		}

		public static bool Create(Good good)
		{
			bool result = true;
			try
			{
				db.Goods.AddObject(good);
				db.SaveChanges();
			}
			catch (Exception)
			{
				result = false;
			}

			return result;
		}

		public static bool Update(Good good)
		{
			bool result = true;
			try
			{
				EntityDataModelContainer mc = new EntityDataModelContainer();
				mc.Goods.Attach(good);
				mc.ObjectStateManager.ChangeObjectState(good, EntityState.Modified);
				mc.SaveChanges();
				db.Refresh(System.Data.Objects.RefreshMode.StoreWins, good);
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
				var good = Find(id);
				db.Goods.DeleteObject(good);
				db.SaveChanges();
			}
			catch (Exception)
			{
				result = false;
			}

			return result;
		}

		public class GoodMetaData
		{
			[Required]
			[Display(Name="Наименование")]
			public string Name { get; set; }
		}
	}
}