using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BTL_ASP.Models
{
    public class ClassConvert
    {
        public List<GioHangHienThi> GetList(GioHang gioHang)
        {
            List<GioHangHienThi> lgh = new List<GioHangHienThi>();
            int count = 1;
            FSanPham fSanPham = new FSanPham();
            foreach (SanPhamGioHang spgh in gioHang.SanPhamGioHangs)
            {
                SanPham sp = fSanPham.FindSanPham(spgh.IDSP);
                lgh.Add(new GioHangHienThi(count, sp.TenSP, spgh.SoLuong, spgh.ThanhTien, sp.ID, gioHang.ID));
            }
            return lgh;
        }
    }
}