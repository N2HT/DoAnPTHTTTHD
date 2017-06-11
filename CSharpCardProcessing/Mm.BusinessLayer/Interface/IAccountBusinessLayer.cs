using Mm.DomainModel;
using System.Collections.Generic;

namespace Mm.BusinessLayer.Interface
{
	public interface IAccountBusinessLayer
	{
		Account Login(string username, string password);
        IList<Account> Get();
	}
}
