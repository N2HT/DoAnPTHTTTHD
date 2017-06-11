using System.Linq;
using Mm.DataAccessLayer.Interface;
using Mm.DomainModel;

namespace Mm.DataAccessLayer.Implementation
{
	public class AccountRepository: GenericDataRepository<Account>, IAccountRepository
	{
	}
}