using BTL_ASP.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace BTL_ASP.Controllers
{
    public class HomeController : Controller
    {
        // GET: Home
        public ActionResult Home()
        {
<<<<<<< Updated upstream
=======
            FAnhSanPham fAnhSanPham = new FAnhSanPham();
            ViewBag.Silde = fAnhSanPham.GetSilde();
            ViewBag.RandKb = fAnhSanPham.GetRanKeyBoard();
            ViewBag.RandO = fAnhSanPham.GetRanOther();
>>>>>>> Stashed changes
            return View();
        }

        // GET: Login
        public ActionResult Login()
        {
            return View();
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
    }
}