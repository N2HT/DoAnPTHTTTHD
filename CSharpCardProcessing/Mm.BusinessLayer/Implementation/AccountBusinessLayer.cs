using Mm.BusinessLayer.Interface;
using Mm.DataAccessLayer.Implementation;
using Mm.DataAccessLayer.Interface;
using Mm.DomainModel;
using System.Collections;
using System.Collections.Generic;
using System.Linq;

namespace Mm.BusinessLayer.Implementation
{
	public class AccountBusinessLayer : IAccountBusinessLayer
	{
		private IAccountRepository _repository;
        public IAccountRepository Repository {
            get {
                if (_repository == null)
                    _repository = new AccountRepository();
                return _repository;
            }
        }
		public Account Login(string username, string password)
		{
			// If the username or password not fill
			if (username == null || password == null)
			{
				return null;
			}
			// Encode the password for check on db
            var user = Repository.GetSingle(item => item.UserName == username.Trim() && item.Password == MD5Helper.GetMd5Hash(password), a => a.Privilege);
            return user;
		}
        public Account GetAccountById(int id) {
            return Repository.GetSingle(item => item.AccountId == id, a => a.Privilege);
        }
        public Account GetAccountByUsername(string username) {
            return Repository.GetSingle(item => item.UserName == username.Trim(), a => a.Privilege);
        }
        public IList<Account> Get()
        {
            return Repository.GetAll();
        }

		public bool IsExists(string username)
		{
			var list = Repository.GetList(a => a.UserName == username.Trim());
			return list != null && list.Count > 0;
		}
	}
}
