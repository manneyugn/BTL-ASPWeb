﻿using BTL_ASP.Models;
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
            else if (Session["KhachHang"] != null)
            {
                KhachHang kh = (KhachHang)Session["KhachHang"];
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
        public ActionResult Login(string id, string password, bool hold = false)
        {
            FKhachHang fKhachHang = new FKhachHang();
            KhachHang x = fKhachHang.TimKhachHang(id, password);
            if (x != null)
            {
                if (hold == true)
                {
                    Response.Cookies["ID"].Value = x.ID.ToString();
                    Response.Cookies["ID"].Expires = DateTime.Now.AddDays(1);
                    return RedirectToAction("Home");
                }
                else
                {
                    Session["KhachHang"] = x;
                    return RedirectToAction("Home");
                }
            }
            else
            {
                return RedirectToAction("Login");
            }
        }

        public ActionResult ListsAll(string searchInfo = null,int page = 1, int pageSize = 9)
        {
            if (searchInfo == null)
            {
                var sp = new FSanPham();
                var model = sp.GetSanPhams(page, pageSize);
                ViewBag.Action = "ListsAll";
                return View("Lists", model);
            }
            else
            {
                var sp = new FSanPham();
                var model = sp.GetSanPhams(searchInfo,page, pageSize);
                ViewBag.Action = "ListsAll";
                return View("Lists", model);
            }    
        }
        public ActionResult Lists(string product, int page = 1, int pageSize = 6)
        {
            FLoaiSanPham fLoai = new FLoaiSanPham();
            Loai loai = fLoai.FindLoai(product);
            var sp = new FSanPham();
            var model = sp.GetDanhSachSP(loai.ID, page, pageSize);
            ViewBag.Action = "Lists";
            ViewBag.Name = product;
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
                    gioHang = new GioHang();
                    Session["GioHang"] = gioHang;
                    return View(gioHang);
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
                else if (Request.Cookies["IDCart"] != null)
                {
                    string x = Request.Cookies["IDCart"].Value;
                    FGioHang fGioHang = new FGioHang();
                    gioHang = fGioHang.GetGH_MaGH(Convert.ToInt32(x));
                    Session["GioHang"] = gioHang;
                    return View(gioHang);
                }
                else
                {
                    gioHang = new GioHang();
                    Session["GioHang"] = gioHang;
                    return View(gioHang);
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
            if (sp.TenSP.Length > 40)
            {
                sp.TenSP = sp.TenSP.Substring(0, 35) + "...";
            }
            var gioHang = (GioHang)Session["GioHang"];
            SanPhamGioHang sanPhamGioHang = new SanPhamGioHang();
            if (Session["KhachHang"] != null)
            {
                KhachHang x = (KhachHang)Session["KhachHang"];
                if (gioHang == null)
                {
                    gioHang = fGioHang.NewGH(x);
                }
                gioHang = fSanPhamGioHang.AddItem(masp, gioHang.ID, soLuong);
                Session["GioHang"] = gioHang;
                return RedirectToAction("Shopcart");
            }
            else
            {
                if (Request.Cookies["IDCart"] != null)
                {
                    string x = Request.Cookies["IDCart"].Value;
                    var giohangtam = fGioHang.GetGH_MaGH(Convert.ToInt32(x));
                    giohangtam = fSanPhamGioHang.AddItem(masp, Convert.ToInt32(x), soLuong);
                    Session["GioHang"] = giohangtam;
                    return RedirectToAction("Shopcart");
                }
                else
                {
                    gioHang = fGioHang.NewGH();
                    Response.Cookies["IDCart"].Value = gioHang.ID.ToString();
                    Response.Cookies["IDCart"].Expires = DateTime.Now.AddDays(1);
                    gioHang = fSanPhamGioHang.AddItem(masp, gioHang.ID, soLuong);
                    Session["GioHang"] = gioHang;
                    return RedirectToAction("Shopcart");
                }
            }
        }

        [HttpPost]
        public string UpdateGioHang(int idSanPham, int soLuong)
        {
            GioHang gioHang = (GioHang)Session["GioHang"];
            FSanPhamGioHang fSanPhamGioHang = new FSanPhamGioHang();
            string json = fSanPhamGioHang.ChangeItem(idSanPham, gioHang.ID, soLuong);
            FGioHang fGioHang = new FGioHang();
            Session["GioHang"] = fGioHang.GetGH_MaGH(gioHang.ID);
            return json;
                
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
            KhachHang khach = new KhachHang() { Email = email, TenKH = name, SDT = contact, DiaChi = address, Password = password };
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
            KhachHang khachHang = (KhachHang)Session["KhachHang"];
            ViewBag.KhachHang = khachHang;
            return View();
        }
        [HttpPost]
        public ActionResult CustomerInfo(string tenKH, string email, string sdt, string ngaySinh, string gioiTinh)
        {
            KhachHang khachHang = (KhachHang)Session["KhachHang"];
            FKhachHang fKhachHang = new FKhachHang();
            KhachHang khach = fKhachHang.SuaKhachHang(khachHang.ID, tenKH, email, sdt, ngaySinh, gioiTinh);
            ViewBag.KhachHang = khach;
            KhachHang kh = fKhachHang.GetKH(khachHang.ID);
            Session["KhachHang"] = kh;
            return View();
            
        }
        public ActionResult History(int page = 1, int pageSize = 4)
        {
            FLichSuMuaHang fLichSuMuaHang = new FLichSuMuaHang();
            var model = fLichSuMuaHang.LichSuKhachHang(((KhachHang)Session["KhachHang"]).ID, page, pageSize);
            return PartialView(model);
        }

        [HttpPost]
        public string ChangePassword(string oldpassword, string password)
        {
            if (((KhachHang)Session["KhachHang"]).Password == oldpassword)
            {
                FKhachHang fKhachHang = new FKhachHang();
                if (fKhachHang.ThayDoiMatKhau(((KhachHang)Session["KhachHang"]).ID, password))
                {
                    return "ok";
                }
                else
                {
                    return "not";
                }

            }
            else
            {
                return "not";
            }
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

        public ActionResult Shipping()
        {
            if (Session["GioHang"] != null)
            {
                KhachHang khachHang = (KhachHang)Session["KhachHang"];
                if (khachHang != null)
                {
                    GioHang gioHang = (GioHang)Session["GioHang"];
                    FGioHang fGioHang = new FGioHang();
                    GioHang ngiohang = fGioHang.Update(gioHang.ID, khachHang.TenKH, khachHang.SDT, khachHang.Email, khachHang.DiaChi);
                    Session["GioHang"] = ngiohang;
                    return View(ngiohang);
                }
                else
                {
                    if(((GioHang)Session["GioHang"]).TenKH == null)
                    {
                        return View();
                    }    
                    else
                    {
                        GioHang gioHang = (GioHang)Session["GioHang"];
                        return View(gioHang);
                    }    
                }    
            }
            else
            {
                return RedirectToAction("Home");
            }
        }
        [HttpGet]
        public ActionResult Payment()
        {
            if (Session["GioHang"] == null )
            {
                return RedirectToAction("Home");
            }
            else
            {
                GioHang gioHang = (GioHang)Session["GioHang"];
                ViewBag.GioHang = gioHang;
                return View();
            }
        }
        [HttpPost]
        public ActionResult Checkout()
        {
            if (Request.Cookies["IDCart"] != null)
            {
                Response.Cookies["IDCart"].Expires = DateTime.Now.AddDays(-1);
            }
            GioHang gioHang = (GioHang)Session["GioHang"];
            int IDCart = gioHang.ID;
            Session["GioHang"] = null;
            FGioHang fGioHang = new FGioHang();
            fGioHang.EndGioHang(IDCart);
            return RedirectToAction("Home");
        }
        [HttpPost]
        public ActionResult Payment(string name, string phone, string mail, string address)
        {
            FGioHang fGioHang = new FGioHang();
            Session["GioHang"] = fGioHang.Update(((GioHang)Session["GioHang"]).ID, name, phone, mail, address);
            ViewBag.GioHang = (GioHang)Session["GioHang"];
            return View();
        }
    }
}