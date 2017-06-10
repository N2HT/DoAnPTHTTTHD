using Mm.DomainModel;

namespace Mm.DataAccessLayer.Interface
{
	public interface IAccountRepository: IGenericDataRepository<Account>
	{
		Account Login(string username, string password);
	}
}