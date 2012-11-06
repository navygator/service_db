using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;

namespace ServiceDB.Models
{
	public partial class Contragent
	{
		protected override void OnPropertyChanged(string property)
		{
			if (property != "Updated_at")
				Updated_at = DateTime.Now;
			base.OnPropertyChanged(property);
		}

		private static EntityDataModelContainer db = new EntityDataModelContainer();


		public static List<Contragent> All()
		{
			return db.Contragents.ToList();
		}
		
		public static Contragent Find(int id)
		{
			return db.Contragents.Single(e => e.Id == id);
		}

		public static bool Create(Contragent contragent)
		{
			bool result = true;
			try
			{
				db.Contragents.AddObject(contragent);
				db.SaveChanges();
			}
			catch (Exception)
			{
				result = false;
			}

			return result;
		}

		public static bool Update(Contragent contragent)
		{
			bool result = true;
			try
			{
				EntityDataModelContainer mc = new EntityDataModelContainer();
				mc.Contragents.Attach(contragent);
				mc.ObjectStateManager.ChangeObjectState(contragent, EntityState.Modified);
				mc.SaveChanges();
				db.Refresh(System.Data.Objects.RefreshMode.StoreWins, contragent);
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
				var contragent = Find(id);
				db.Contragents.DeleteObject(contragent);
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