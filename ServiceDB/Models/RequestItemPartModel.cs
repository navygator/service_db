using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Web;
using System.ComponentModel.DataAnnotations;
using System.Data;

namespace ServiceDB.Models
{
	[MetadataType(typeof(RequestItemPartMetaData))]
	public partial class RequestItemPart
	{
		protected override void OnPropertyChanged(string property)
		{
			if (property != "Updated_at")
				Updated_at = DateTime.Now;
			base.OnPropertyChanged(property);
		}
		
		private static EntityDataModelContainer db = new EntityDataModelContainer();

		public static List<RequestItemPart> All()
		{
			return db.RequestItemParts.ToList();
		}

		public static RequestItemPart Find(int id)
		{
			return db.RequestItemParts.Single(e => e.Id == id);
		}

		public static bool Create(RequestItemPart requestItemPart)
		{
			bool result = true;
			try
			{
				db.RequestItemParts.AddObject(requestItemPart);
				db.SaveChanges();
			}
			catch (Exception)
			{
				result = false;
			}

			return result;
		}

		public static bool Update(RequestItemPart requestItemPart)
		{
			bool result = true;
			try
			{
				EntityDataModelContainer mc = new EntityDataModelContainer();
				mc.RequestItemParts.Attach(requestItemPart);
				mc.ObjectStateManager.ChangeObjectState(requestItemPart, EntityState.Modified);
				mc.SaveChanges();
				db.Refresh(System.Data.Objects.RefreshMode.StoreWins, requestItemPart);
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
				var requestItemPart = Find(id);
				db.RequestItemParts.DeleteObject(requestItemPart);
				db.SaveChanges();
			}
			catch (Exception)
			{
				result = false;
			}

			return result;
		}

		public class RequestItemPartMetaData
		{
			[Required]
			[Display(Name = "Товар")]
			public int RequestItem_id { get; set; }

			[Required]
			[Display(Name = "Запчасть")]
			public int PartItem_id { get; set; }
		}
	}
}