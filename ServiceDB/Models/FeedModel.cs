using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ServiceDB.Models
{
	public class Feed
	{
		public static List<Feed> All()
		{
			List<Feed> feed = new List<Feed>();
			
			var em = Employee.All().Where(m => m.Updated_at > DateTime.Now.AddDays(-1)).ToList();
			foreach (var item in em)
			{
				feed.Add(new Feed { Name = item.FIO, Url = "/Employees/Details/" + item.Id });
			}

			var ca = Contragent.All().Where(m => m.Updated_at > DateTime.Now.AddDays(-1)).ToList();
			foreach (var item in ca)
			{
				feed.Add(new Feed { Name = item.FIO, Url = "/Contragents/Details/" + item.Id });
			}

			var sp = Supplier.All().Where(m => m.Updated_at > DateTime.Now.AddDays(-1)).ToList();
			foreach (var item in sp)
			{
				feed.Add(new Feed { Name = item.Name, Url = "/Suppliers/Details/" + item.Id });
			}
			
			var vd = Vendor.All().Where(m => m.Updated_at > DateTime.Now.AddDays(-1)).ToList();
			foreach (var item in vd)
			{
				feed.Add(new Feed { Name = item.Name, Url = "/Vendors/Details/" + item.Id });
			}

			var rq = Request.All().Where(m => m.Updated_at > DateTime.Now.AddDays(-1)).ToList();
			foreach (var item in rq)
			{
				feed.Add(new Feed { Name = "Заявка №" + item.Id.ToString(), Url = "/Requests/Details/" + item.Id });
			}

			return feed;
		}

		public string Name
		{
			get;
			set;
		}

		public string Url
		{
			get;
			set;
		}
	}
}