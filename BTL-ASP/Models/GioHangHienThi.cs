using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BTL_ASP.Models
{
    public class GioHangHienThi
    {
        private int sTT;
        private string tenSp;
        private int? soLuong;
        private decimal? thanhTien;
        private int idsp;
        private int idgh;

        public GioHangHienThi(int sTT, string tenSp, int? soLuong, decimal? thanhTien, int idsp, int idgh)
        {
            this.sTT = sTT;
            this.tenSp = tenSp;
            this.soLuong = soLuong;
            this.thanhTien = thanhTien;
            this.idsp = idsp;
            this.idgh = idgh;
        }

        public int STT { get => sTT; set => sTT = value; }
        public string TenSp { get => tenSp; set => tenSp = value; }
        public int? SoLuong { get => soLuong; set => soLuong = value; }
        public decimal? ThanhTien { get => thanhTien; set => thanhTien = value; }
        public int Idsp { get => idsp; set => idsp = value; }
        public int Idgh { get => idgh; set => idgh = value; }
    }
}