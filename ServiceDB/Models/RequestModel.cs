using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;

namespace ServiceDB.Models
{
	[MetadataType(typeof(RequestMetaData))]
	public partial class Request
	{
		private static EntityDataModelContainer db = new EntityDataModelContainer();

		protected override void OnPropertyChanged(string property)
		{
			if (property != "Updated_at")
				Updated_at = DateTime.Now;
			base.OnPropertyChanged(property);
		}

		public static List<Request> All()
		{
			return db.Requests.ToList();
		}

		public class RequestMetaData
		{
			[Display(Name = "Номер заявки")]
			public int Id { get; set; }
			
			[Required()]
			[Display(Name = "Дата приемки")]
			public DateTime Date { get; set; }

			[Required()]
			[Display(Name = "Клиент")]
			public int Contragent_id { get; set; }

			[Required()]
			[Display(Name = "Статус")]
			public int State_id { get; set; }
		}
	}
}