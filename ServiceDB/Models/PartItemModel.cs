using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;

namespace ServiceDB.Models
{
	[MetadataType(typeof(PartItemMetaData))]
	public partial class PartItem
	{
		protected override void OnPropertyChanged(string property)
		{
			if (property != "Updated_at")
				Updated_at = DateTime.Now;
			base.OnPropertyChanged(property);
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