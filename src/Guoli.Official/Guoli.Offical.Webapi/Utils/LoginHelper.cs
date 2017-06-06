using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Guoli.Utilities;

namespace Guoli.Offical.Webapi.Utils
{
    public static class LoginHelper
    {
        private static readonly string _encryptString = "69ff19d1773d60475a84f44c298139fd";
        private static readonly int _tokenExpire = 7*24*3600*1000;

        public static string GenerateToken(int id, string pwd)
        {
            var e = EncryptPassword(pwd);
            var ts = DateTime.Now.Timestamp();
            return string.Join(":", id, ts, e);
        }

        public static bool IsTokenLeagal(string token, Func<int, string> pwdPredicate)
        {
            var temp = token.Split(':');
            if (temp.Length != 3)
            {
                return false;
            }

            // 时间戳过期
            if (DateTime.Now.Timestamp() - temp[1].ToInt64() > _tokenExpire)
            {
                return false;
            }

            var pwd = pwdPredicate(temp[0].ToInt32());
            var e = EncryptPassword(pwd);
            return e == temp[2];
        }

        private static string EncryptPassword(string password)
        {
            return (password + _encryptString).GetMd5();
        }
    }
}