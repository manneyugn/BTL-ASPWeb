using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using PagedList;
using BTL_ASP.Models;

namespace BTL_ASP.Controllers
{
    public class ListsController : Controller
    {
        //GET: Lists
        public ActionResult Lists(int page = 1, int pageSize = 9)
        {
            var sp = new FSanPham();
            var model = sp.GetSanPhams(page, pageSize);
            return View(model);
        }
        public ActionResult Lists(string product, int page = 1, int pageSize = 6)
        {
            FLoaiSanPham fLoai = new FLoaiSanPham();
            Loai loai = fLoai.FindLoai(product);
            var sp = new FSanPham();
            var model = sp.GetDanhSachSP(loai.ID, page, pageSize);
            return View(model);
        }
    }
}