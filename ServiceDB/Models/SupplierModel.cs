using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

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
	}
}