using Mm.DomainModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Mm.BusinessLayer.Interface
{
    public interface IAreaBusinessLayer
    {
        IList<Area> Get();
    }
}
