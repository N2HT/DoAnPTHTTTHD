using Mm.DomainModel;

namespace Mm.BusinessLayer.Interface
{
	public interface IAccountBusinessLayer
	{
		Account Login(string username, string password);
	}
}
