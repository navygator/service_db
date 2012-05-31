using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;

namespace ServiceDB.Models
{
	public partial class State
	{
		private static EntityDataModelContainer db = new EntityDataModelContainer();

		public static List<State> All()
		{
			return db.States.ToList();
		}

		public static State Find(int id)
		{
			return db.States.Single(e => e.Id == id);
		}

		public static bool Create(State state)
		{
			bool result = true;
			try
			{
				db.States.AddObject(state);
				db.SaveChanges();
			}
			catch (Exception)
			{
				result = false;
			}

			return result;
		}

		public static bool Update(State state)
		{
			bool result = true;
			try
			{
				EntityDataModelContainer mc = new EntityDataModelContainer();
				mc.States.Attach(state);
				mc.ObjectStateManager.ChangeObjectState(state, EntityState.Modified);
				mc.SaveChanges();
				db.Refresh(System.Data.Objects.RefreshMode.StoreWins, state);
			}
			catch (Exception)
			{
				result = false;
			}

			return result;
		}

		public static bool Destroy(int id)
		{
			bool result = true;
			try
			{
				var state = Find(id);
				db.States.DeleteObject(state);
				db.SaveChanges();
			}
			catch (Exception)
			{
				result = false;
			}

			return result;
		}
	}
}