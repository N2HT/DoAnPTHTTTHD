using System;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using Mm.BusinessLayer;
using Mm.DomainModel;
using System.Collections.Generic;
namespace MyTest
{
    [TestClass]
    public class UnitTest1
    {
        [TestMethod]
        public void testDepartment()
        {
            BusinessLayer bus = new BusinessLayer();
            IList<Agent> list= bus.GetAllAgent();
            Assert.IsNotNull(list);
            Assert.AreNotEqual(0, list.Count);
        }
    }
}
