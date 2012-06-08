using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;

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