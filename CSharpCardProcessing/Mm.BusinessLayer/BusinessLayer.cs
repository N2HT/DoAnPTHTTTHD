using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Mm.DomainModel;
using Mm.DataAccessLayer;
namespace Mm.BusinessLayer
{
    public class BusinessLayer:IBusinessLayer
    {
        private readonly IMasterRepository _masterRepository;
        private readonly IAgentRepository _agentRepository;
        private readonly UserRepository _userRepository;

        public BusinessLayer()
        {
            _masterRepository = new MasterRepository();
            _agentRepository = new AgentRepository();
            _userRepository = new UserRepository();
        }

        // Agent
        public IList<Agent> GetAllAgent()
        {
            return _agentRepository.GetAll();
        }

        public Agent GetAgentById(int id)
        {
            return _agentRepository.GetSingle(d => d.AgentId==id);
        }

        public void AddAgent(params Agent[] agents)
        {
            _agentRepository.Add(agents);
        }

        public void UpdateAgent(params Agent[] agents)
        {
            _agentRepository.Update(agents);
        }

        public void RemoveAgent(params Agent[] agents)
        {
            _agentRepository.Remove(agents);
        }
        // Master
        public Master GetMasterById(int id)
        {
            return _masterRepository.GetSingle(d => d.MasterId == id);
        }

        public void AddMaster(params Master[] masters)
        {
            _masterRepository.Add(masters);
        }

        public void UpdateMaster(params Master[] masters)
        {
            _masterRepository.Update(masters);
        }

        public void RemoveMaster(params Master[] masters)
        {
            _masterRepository.Remove(masters);
        }

        public User Login(string username, string password) {
            // If the username or password not fill
            if (username == null || password == null) {
                return null;
            }
            // Encode the password for check on db
            return _userRepository.Login(username, MD5Helper.GetMd5Hash(password));
        }
    }
}
