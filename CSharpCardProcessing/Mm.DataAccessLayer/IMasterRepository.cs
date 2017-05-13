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
    public class MasterRepository : GenericDataRepository<Master>, IMasterRepository { }
    public class AgentRepository : GenericDataRepository<Agent>, IAgentRepository { }

}
