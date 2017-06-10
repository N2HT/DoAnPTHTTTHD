using Mm.DomainModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Mm.BusinessLayer
{
    public interface IAccountBusinessLayer
    {
        Account Login(string username, string password);
    }
}
