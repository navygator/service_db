using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

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

		private static EntityDataModelContainer db1 = new EntityDataModelContainer();


		public static List<Contragent> All()
		{
			return db1.Contragents.ToList();
		}
	}
}