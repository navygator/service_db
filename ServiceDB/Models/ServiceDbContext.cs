using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;

namespace ServiceDB.Models
{
	public class ServiceDbContext : DbContext
	{
		public DbSet<RequestItem> RequestItems { get; set; }
		public DbSet<Request> Requests { get; set; }
	}
}