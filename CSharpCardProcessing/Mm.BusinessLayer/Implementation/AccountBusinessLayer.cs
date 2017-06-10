using Mm.BusinessLayer.Interface;
using Mm.DataAccessLayer;
using Mm.DomainModel;

namespace Mm.BusinessLayer.Implementation
{
	public class AccountBusinessLayer : IAccountBusinessLayer
	{
		private readonly AccountRepository _userRepository;
		public AccountBusinessLayer()
		{
			_userRepository = new AccountRepository();
		}
		public Account Login(string username, string password)
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
