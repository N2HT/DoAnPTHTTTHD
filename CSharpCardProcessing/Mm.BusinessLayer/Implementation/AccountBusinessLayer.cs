using Mm.BusinessLayer.Interface;
using Mm.DataAccessLayer.Implementation;
using Mm.DataAccessLayer.Interface;
using Mm.DomainModel;
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
            return Repository.GetSingle(item => item.UserName == username && item.Password == MD5Helper.GetMd5Hash(password), a => a.Privilege);
		}
	}
}
