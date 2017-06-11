using Mm.DomainModel;
using System.Collections.Generic;

namespace Mm.BusinessLayer.Interface
{
	public interface IAccountBusinessLayer
	{
		Account Login(string username, string password);
        Account GetAccountById(int id);
        Account GetAccountByUsername(string id);
        IList<Account> Get();
		bool IsExists(string username);
	}
}
