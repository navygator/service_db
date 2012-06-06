using System;
using System.Collections.Generic;
using System.Linq;
using System.Data.Entity;
using System.Web;
using System.ComponentModel.DataAnnotations;

namespace ServiceDB.Models
{
	[MetadataType(typeof(RequestItemMetaData))]
	public partial class RequestItem
	{
		protected override void OnPropertyChanged(string property)
		{
			if (property != "Updated_at")
				Updated_at = DateTime.Now;
			base.OnPropertyChanged(property);
		}

		public class RequestItemMetaData
		{
			[Required]
			[Display(Name = "Номер заявки")]
			public int Request_id { get; set; }

			[Required]
			[Display(Name = "Товар")]
			public int Good_id { get; set; }

			[Required]
			[Display(Name = "Серийный номер")]
			public string Serial_num { get; set; }

			[Required]
			[Display(Name = "Гарантия")]
			public int Warranty_id { get; set; }

			[Required(ErrorMessage="Поле Мастер обязательно")]
			[Display(Name = "Мастер")]
			public int Employee_id { get; set; }

			[Required]
			[Display(Name = "Описание")]
			public string Description { get; set; }

			[Required]
			[Display(Name = "Комплектация")]
			public string Packing { get; set; }

			[Required]
			[Display(Name = "Неисправность")]
			public string Defect { get; set; }

			[Display(Name = "Доп. инфо")]
			public string More_info { get; set; }

			[Display(Name = "Результаты диагностики")]
			public string Diagnostic_result { get; set; }

			[Required]
			[Display(Name = "Статус")]
			public int State_id { get; set; }
		}
	}
}