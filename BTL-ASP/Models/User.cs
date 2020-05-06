using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BTL_ASP.Models
{
    public class User
    {
        private string id;
        private string password;

        public User()
        {
            this.id = "";
            this.password = "";
        }

        public User(string id, string password)
        {
            this.id = id;
            this.password = password;
        }

        public string Id { get => id; set => id = value; }
        public string Password { get => password; set => password = value; }
    }
}