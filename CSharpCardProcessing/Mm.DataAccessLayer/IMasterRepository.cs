using System.Linq;
using Mm.DomainModel;
namespace Mm.DataAccessLayer
{
    public interface IMasterRepository:IGenericDataRepository<Master>{ }
    public interface IAgentRepository : IGenericDataRepository<Agent> { }
	public interface IMerchantRepository: IGenericDataRepository<Merchant> { }
    public interface IAccountRepository : IGenericDataRepository<Account> { }
    public class MasterRepository : GenericDataRepository<Master>, IMasterRepository { }
    public class AgentRepository : GenericDataRepository<Agent>, IAgentRepository { }
	public class MerchantRepository : GenericDataRepository<Merchant>, IMerchantRepository { }
    public class AccountRepository : GenericDataRepository<Account>, IAccountRepository {
        public Account Login(string username, string password) {
            using (CardProcessingEntities ctx = new CardProcessingEntities()) {
                if (ctx.Accounts.Any(item => item.UserName == username && item.Password == password)) {
                    var user = ctx.Accounts
                        .Where(item => item.UserName == username && item.Password == password)
                        .First<Account>();
                    return user;
                }
                return null;
            }
        }
    }

}
