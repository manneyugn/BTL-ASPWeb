using BTL_ASP.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Mvc;
using static BTL_ASP.Models.ModelData;

namespace BTL_ASP.Controllers
{
    public class HomeController : Controller
    {
        ModelData db = new ModelData();
        public string GetKhachHang()
        {
            if (Request.Cookies["ID"] != null) {
                string x = Request.Cookies["ID"].Value;
                FKhachHang fKhachHang = new FKhachHang();
                KhachHang kh = fKhachHang.GetKH(Convert.ToInt32(x));
                Session["KhachHang"] = kh;
                FGioHang fGioHang = new FGioHang();
                GioHang gioHang = fGioHang.GetGH_MaND(kh.ID);
                Session["GioHang"] = gioHang;
                StringBuilder htmlStr = new StringBuilder("");
                htmlStr.Append(@"<li class=""header-item dropdown"">");
                htmlStr.Append(@"<a href = ""/Home/CustomerInfo"">Hello, ");
                htmlStr.Append(kh.TenKH);
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
            Response.Cookies["ID"].Expires = DateTime.Now.AddDays(-1);
            Session["KhachHang"] = null;
            Session["GioHang"] = null;
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

        // POST: Login
        [HttpPost]
        public ActionResult Login(string id, string password)
        {
            FKhachHang fKhachHang = new FKhachHang();
            KhachHang x = fKhachHang.TimKhachHang(id, password);
            if (x != null)
            {
                Response.Cookies["ID"].Value = x.ID.ToString();
                Response.Cookies["ID"].Expires = DateTime.Now.AddDays(1);
                return RedirectToAction("Home");
            }
            else
            {
                return RedirectToAction("Login");
            }
        }
        public ActionResult ListsAll(int page = 1, int pageSize = 9)
        {
            var sp = new FSanPham();
            var model = sp.GetSanPhams(page, pageSize);
            ViewBag.Action = "ListsAll";
            return View("Lists",model);
        }
        public ActionResult Lists(string product, int page = 1, int pageSize = 6)
        {
            FLoaiSanPham fLoai = new FLoaiSanPham();
            Loai loai = fLoai.FindLoai(product);
            var sp = new FSanPham();
            var model = sp.GetDanhSachSP(loai.ID, page, pageSize);
            ViewBag.Action = "Lists";
            return View(model);
        }
        // GET: Shopcart
        public ActionResult Shopcart()
        {
            var temp = Session["KhachHang"];
            var gioHang = (GioHang)Session["GioHang"];
            if (temp != null)
            {
                if (gioHang == null)
                {
                    return View();
                }
                else
                {
                    return View(gioHang);
                }
            }
            else
            {
                if (gioHang != null)
                {
                    return View(gioHang);
                }
                if (Request.Cookies["IDCart"] != null)
                {
                    string x = Request.Cookies["IDCart"].Value;
                    FGioHang fGioHang = new FGioHang();
                    gioHang = fGioHang.GetGH_MaGH(Convert.ToInt32(x));
                    Session["GioHang"] = gioHang;
                    return View(gioHang);
                }
                else
                {
                    return View();
                }
            }
        }

        [HttpPost]
        public ActionResult Product(int masp, int soLuong)
        {
            FSanPham fSanPham = new FSanPham();
            FSanPhamGioHang fSanPhamGioHang = new FSanPhamGioHang();
            FGioHang fGioHang = new FGioHang();
            var sp = fSanPham.FindSanPham(masp);
            if(sp.TenSP.Length > 40)
            {
                sp.TenSP = sp.TenSP.Substring(0, 35) + "...";
            }
            var gioHang = (GioHang)Session["GioHang"];
            SanPhamGioHang sanPhamGioHang = new SanPhamGioHang();
            if (Session["KhachHang"] != null)
            {
                if (gioHang == null)
                { 
                    KhachHang x = (KhachHang)Session["KhachHang"];
                    gioHang = fGioHang.NewGH(x);
                }
                sanPhamGioHang = fSanPhamGioHang.AddItem(masp, gioHang.ID, soLuong);
                Session["GioHang"] = gioHang;
                return RedirectToAction("Shopcart");
            }
            else
            {
                if (Request.Cookies["IDCart"] != null)
                {
                    string x = Request.Cookies["IDCart"].Value;
                    var giohangtam = fGioHang.GetGH_MaGH(Convert.ToInt32(x));
                    sanPhamGioHang = fSanPhamGioHang.AddItem(masp, giohangtam.ID, soLuong);
                    Session["GioHang"] = giohangtam;
                    return RedirectToAction("Shopcart");
                }
                else
                {
                    gioHang = fGioHang.NewGH();
                    Response.Cookies["IDCart"].Value = gioHang.ID.ToString();
                    Response.Cookies["IDCart"].Expires = DateTime.Now.AddDays(1);
                    sanPhamGioHang = fSanPhamGioHang.AddItem(masp, gioHang.ID, soLuong);
                    Session["GioHang"] = gioHang;
                    return RedirectToAction("Shopcart");
                }
            }
        }

        // GET: Product
        [HttpGet]
        public ActionResult Product(int id)
        {
            FSanPham fSanPham = new FSanPham();
            ViewBag.SanPham = fSanPham.FindSanPham(id);
            return View();
        }

        // GET: Signup
        [HttpPost]
        public ActionResult Signup(string email, string name, string contact, string address, string password)
        {
            FKhachHang fKhachHang = new FKhachHang();
            KhachHang khach = new KhachHang() {Email = email, TenKH = name, SDT = contact, DiaChi = address, Password = password };
            fKhachHang.ThemKhachHang(khach);
            return View("Login");
        }
        public ActionResult Signup()
        {
            return View();
        }

        // GET: CustomerInfo
        public ActionResult CustomerInfo()
        {
            KhachHang khachHang = (KhachHang) Session["KhachHang"];
            khachHang.NgaySinh = khachHang.NgaySinh;
            ViewBag.KhachHang = khachHang;
            return View();
        }

        // GET: ForgotPassword
        public ActionResult ForgotPassword()
        {
            return View();
        }

        [HttpPost]
        // GET: ForgotPassword
        public ActionResult ForgotPassword(string email)
        {
            FKhachHang fKhachHang = new FKhachHang();
            fKhachHang.LayLaiMatKhau(email);
            return RedirectToAction("Login");
        }

        public ActionResult Payment()
        {
            return View();
        }
    }
}