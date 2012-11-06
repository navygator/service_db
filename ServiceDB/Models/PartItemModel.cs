using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;
using System.Data;

namespace ServiceDB.Models
{
	[MetadataType(typeof(PartItemMetaData))]
	public partial class PartItem
	{
		private static EntityDataModelContainer db = new EntityDataModelContainer();

		protected override void OnPropertyChanged(string property)
		{
			if (property != "Updated_at")
				Updated_at = DateTime.Now;
			base.OnPropertyChanged(property);
		}

		public static List<PartItem> All()
		{
			return db.PartItems.ToList();
		}

		public static PartItem Find(int id)
		{
			return db.PartItems.Single(e => e.Id == id);
		}

		public static bool Create(PartItem partItem)
		{
			bool result = true;
			try
			{
				db.PartItems.AddObject(partItem);
				db.SaveChanges();
			}
			catch (Exception)
			{
				result = false;
			}

			return result;
		}

		public static bool Update(PartItem partItem)
		{
			bool result = true;
			try
			{
				EntityDataModelContainer mc = new EntityDataModelContainer();
				mc.PartItems.Attach(partItem);
				mc.ObjectStateManager.ChangeObjectState(partItem, EntityState.Modified);
				mc.SaveChanges();
				db.Refresh(System.Data.Objects.RefreshMode.StoreWins, partItem);
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
				var partItem = Find(id);
				db.PartItems.DeleteObject(partItem);
				db.SaveChanges();
			}
			catch (Exception)
			{
				result = false;
			}

			return result;
		}

		public class PartItemMetaData
		{
			[Required]
			[Display(Name = "Запчасть")]
			public int Part_id { get; set; }

			[Required]
			[Display(Name = "Серийный номер")]
			public string Serial_num { get; set; }

			[Required]
			[Display(Name = "Поставщик")]
			public int Supplier_id { get; set; }

			[Required]
			[Display(Name = "Дата прихода")]
			public DateTime Date_in { get; set; }

			[Required]
			[Display(Name = "Цена")]
			public Decimal Price { get; set; }
		}
	}
}