using BTL_ASP.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Mvc;


namespace BTL_ASP.Controllers
{
    public class HomeController : Controller
    {
        public string GetKhachHang()
        {
            if (Session["KhachHang"] != null)
            {
                StringBuilder htmlStr = new StringBuilder("");
                htmlStr.Append(@"<li class=""header-item dropdown"">");
                htmlStr.Append(@"<a href = ""/Home/CustomerInfo"">Hello, ");
                htmlStr.Append(((KhachHang)Session["KhachHang"]).TenKH);
                htmlStr.Append("</a>");
                htmlStr.Append(@"<div class=""dropdown-content"">");
                htmlStr.Append(@"<a href = ""/Home/Logout"">Log out</a>");
                htmlStr.Append(@"</div>");
                htmlStr.Append(@"</li>");
                return htmlStr.ToString();
               
            }
            else
            {                
                return @"<li class=""header-item""><a href =""/Home/Login"">Login</a></li>";                
            }
        }

        public ActionResult Logout()
        {
            Session["KhachHang"] = null;
            return RedirectToAction("Home");
        }
        // GET: Home
        public ActionResult Home()
        {
            FAnhSanPham fAnhSanPham = new FAnhSanPham();
            ViewBag.Silde = fAnhSanPham.GetSilde();
            ViewBag.RandKb = fAnhSanPham.GetRanKeyBoard();
            ViewBag.RandO = fAnhSanPham.GetRanOther();
            ViewBag.RandSell = fAnhSanPham.GetRanKeyBoard();
            return View();
        }

        // GET: Login
        public ActionResult Login()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Login(string id, string password)
        {
            FKhachHang fKhachHang = new FKhachHang();
            KhachHang x = fKhachHang.TimKhachHang(id, password);
            if (x != null)
            {
                Session["KhachHang"] = x;
                return RedirectToAction("Home");
            }
            else
            {
                return RedirectToAction("Login");
            }
        }

        // GET: Shopcart
        public ActionResult Shopcart()
        {
            return View();
        }

        // GET: Product
        public ActionResult Product(int id)
        {
            FSanPham fSanPham = new FSanPham();
            ViewBag.SanPham = fSanPham.FindSanPham(id);
            return View();
        }

        // GET: Lists
        public ActionResult Lists(string product)
        {
            FSanPham fSanPham = new FSanPham();
            FLoaiSanPham fLoai = new FLoaiSanPham();
            Loai loai = fLoai.FindLoai(product);
            ViewBag.SanPham = fSanPham.GetDanhSachSP(loai.ID);
            return View();
        }

        // GET: Signup
        public ActionResult Signup()
        {
            return View();
        }

        // GET: CustomerInfo
        public ActionResult CustomerInfo()
        {
            return View();
        }

        // GET: ForgotPassword
        public ActionResult ForgotPassword()
        {
            return View();
        }
    }
}