using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Mm.DomainModel;
using Mm.DataAccessLayer;

namespace Mm.BusinessLayer
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
