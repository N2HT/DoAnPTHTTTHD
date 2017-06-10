using Mm.DomainModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Mm.BusinessLayer
{
    public interface IAgentBusinessLayer
    {
        IList<Agent> GetAllAgent();
        Agent GetAgentById(int id);
        void AddAgent(params Agent[] agents);
        void UpdateAgent(params Agent[] agents);
        void RemoveAgent(params Agent[] agents);

    }
}
