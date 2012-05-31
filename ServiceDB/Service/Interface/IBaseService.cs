using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using ServiceDB.Models.Interface;

namespace ServiceDB.Service.Interface
{
	public interface IBaseService<T> where T : class,IBase,new()
	{
		// Получение всех записей из таблицы БД
		IQueryable<T> All();

		// Получение одной записи с заданным ID
		T Get(int id);

		// Получение нескольких записей.
		// Параметр skip - сколько первых записей пропустить, параметр take - сколько записей получить
		IQueryable<T> Get(int skip, int take);

		// Добавление записи в таблицу
		void Create(T dataObject);

		// Редактирование записи таблицы
		void Update(T dataObject);

		// Удаление записи из таблицы
		void Delete(T dataObject);
	}
}