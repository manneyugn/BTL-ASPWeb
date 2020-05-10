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
        public ActionResult Product()
        {
            return View();
        }

        // GET: Lists
        //public ActionResult Lists()
        //{
        //    FSanPham fSanPham = new FSanPham();
        //    ViewBag.SanPham = fSanPham.GetDanhSachSP(1);
        //    return View();
        //}

        public ActionResult Lists(string product)
        {
            FSanPham fSanPham = new FSanPham();
            FLoaiSanPham fLoai = new FLoaiSanPham();
            Loai loai = fLoai.FindLoai(product);
            ViewBag.SanPham = fSanPham.GetDanhSachSP(loai.ID);
            return View();
        }

        //public string Lists(string product)
        //{
        //    return product;
        //}

        // GET: Signup
        public ActionResult Signup()
        {
            return View();
        }
    }
}