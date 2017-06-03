using System.Collections.Generic;
using Mm.DomainModel;
using Mm.DataAccessLayer;
namespace Mm.BusinessLayer
{
	public class BusinessLayer : IBusinessLayer
	{
		private readonly IMasterRepository _masterRepository;
		private readonly IAgentRepository _agentRepository;
		private readonly UserRepository _userRepository;
		private readonly IMerchantRepository _merchantRepository;

		public BusinessLayer()
		{
			_masterRepository = new MasterRepository();
			_agentRepository = new AgentRepository();
			_userRepository = new UserRepository();
			_merchantRepository = new MerchantRepository();
		}

		// Agent
		public IList<Agent> GetAllAgent()
		{
			return _agentRepository.GetAll();
		}

		public Agent GetAgentById(int id)
		{
			return _agentRepository.GetSingle(d => d.AgentId == id);
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

		#region Merchant

		public Merchant GetMerchantById(int id)
		{
			return _merchantRepository.GetSingle(m => m.MerchantId == id);
		}
		public void AddMerchant(params Merchant[] merchants)
		{
			_merchantRepository.Add(merchants);
		}
		public void UpdateMerchant(params Merchant[] merchants)
		{
			_merchantRepository.Update(merchants);
		}

		public void RemoveMerchant(params Merchant[] merchants)
		{
			_merchantRepository.Remove(merchants);
		}

		public void InactivateMerchant(int merchantId)
		{
			var mc = _merchantRepository.GetSingle(m => m.MerchantId == merchantId);
			mc.Activate = false;
			_merchantRepository.Update(mc);
		}

		public void ActivateMerchant(int merchantId)
		{
			var mc = _merchantRepository.GetSingle(m => m.MerchantId == merchantId);
			mc.Activate = true;
			_merchantRepository.Update(mc);
		}
		#endregion

		public User Login(string username, string password)
		{
			// If the username or password not fill
			if (username == null || password == null)
			{
				return null;
			}
			// Encode the password for check on db
			return _userRepository.Login(username, MD5Helper.GetMd5Hash(password));
		}
	}
}
