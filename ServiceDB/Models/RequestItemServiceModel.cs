using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;

namespace ServiceDB.Models
{
	[MetadataType(typeof(RequestItemServiceMetaData))]
	public partial class RequestItemService
	{
		public class RequestItemServiceMetaData
		{
			[Required]
			[Display(Name = "Товар")]
			public int RequestItem_id { get; set; }

			[Required]
			[Display(Name = "Услуга")]
			public int Service_id { get; set; }

			[Required]
			[Display(Name = "Цена")]
			public Decimal Price { get; set; }
		}
	}
}