using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Mm.DomainModel;
namespace Mm.DataAccessLayer
{
    public interface IMasterRepository:IGenericDataRepository<Master>{ }
    public interface IAgentRepository : IGenericDataRepository<Agent> { }
    public interface IUserRepository : IGenericDataRepository<User> { }
    public class MasterRepository : GenericDataRepository<Master>, IMasterRepository { }
    public class AgentRepository : GenericDataRepository<Agent>, IAgentRepository { }
    public class UserRepository : GenericDataRepository<User>, IUserRepository {
        public User Login(string username, string password) {
            using (CardProcessingEntities ctx = new CardProcessingEntities()) {
                if (ctx.Users.Any(item => item.UserName == username && item.Password == password)) {
                    var user = ctx.Users
                        .Where(item => item.UserName == username && item.Password == password)
                        .First<User>();
                    return user;
                }
                return null;
            }
        }
    }

}
