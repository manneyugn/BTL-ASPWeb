namespace BTL_ASP.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("SanPhamGioHang")]
    public partial class SanPhamGioHang
    {
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int ID { get; set; }

        public int? IDSP { get; set; }

        public int? IDGH { get; set; }

        public int? SoLuong { get; set; }

        public decimal? ThanhTien { get; set; }

        [StringLength(100)]
        public string GhiChu { get; set; }

        public virtual GioHang GioHang { get; set; }

        public virtual SanPham SanPham { get; set; }
    }
}
