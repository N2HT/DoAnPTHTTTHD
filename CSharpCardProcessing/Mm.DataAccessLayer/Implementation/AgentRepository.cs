using Mm.DataAccessLayer.Interface;
using Mm.DomainModel;

namespace Mm.DataAccessLayer.Implementation
{
	public class AgentRepository: GenericDataRepository<Agent>, IAgentRepository
	{
        public Agent Add(params Agent[] items) {
            using (var context = new CardProcessingEntities()) {
                Agent rs = null;
                foreach (Agent item in items) {
                    context.Entry(item).State = System.Data.EntityState.Added;
                    context.Entry(item.Account.Privilege).State = System.Data.EntityState.Unchanged;
                    rs = item;
                }
                context.SaveChanges();

                return rs;
            }
        }
	}
}