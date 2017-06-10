using System.Linq;
using Mm.DataAccessLayer.Interface;
using Mm.DomainModel;

namespace Mm.DataAccessLayer.Implementation
{
	public class AccountRepository: GenericDataRepository<Account>, IAccountRepository
	{
		public Account Login(string username, string password)
		{
			using (CardProcessingEntities ctx = new CardProcessingEntities())
			{
				if (ctx.Accounts.Any(item => item.UserName == username && item.Password == password))
				{
					var user = ctx.Accounts
						.First(item => item.UserName == username && item.Password == password);
					return user;
				}
				return null;
			}
		}
	}
}