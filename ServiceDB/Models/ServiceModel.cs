using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;

namespace ServiceDB.Models
{
	[MetadataType(typeof(ServiceMetaData))]
	public partial class Service
	{
		protected override void OnPropertyChanged(string property)
		{
			if (property != "Updated_at")
				Updated_at = DateTime.Now;
			base.OnPropertyChanged(property);
		}

		public class ServiceMetaData
		{
			[Required]
			[Display(Name = "Наименование")]
			public string Name { get; set; }
		}
	}
}