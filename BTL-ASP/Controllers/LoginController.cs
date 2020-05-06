using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using BTL_ASP.Models;

namespace BTL_ASP.Controllers
{
    public class LoginController : Controller
    {
        public ActionResult Login()
        {
            return View();
        }
        [HttpPost]
        public string Login(User user)
        {
            return user.Id + " " + user.Password;
        }
    }
}