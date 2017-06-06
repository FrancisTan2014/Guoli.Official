using System;
using FluentAssertions;
using Guoli.Offical.DataAccess;
using Guoli.Official.Models;
using Guoli.Utilities;
using Microsoft.VisualStudio.TestTools.UnitTesting;

namespace Guoli.Offical.WebapiTest
{
    [TestClass]
    public class LoginControllerTest
    {
        [TestMethod]
        public void AddSuperAdminUser()
        {
            var username = "admin";
            var pwd = "123456".GetMd5();
            var repos = new Repository<SystemUser>();
            var user = new SystemUser {Username = username, Password = pwd};

            var success = repos.Add(user);

            //var ef = new OfficialEntities();
            //var db = ef.Set<SystemUser>();
            //db.Add(user);

            //var success = ef.SaveChanges() > 0;

            success.Should().BeTrue();
            user.Id.Should().BeGreaterThan(0);
        }
    }
}
