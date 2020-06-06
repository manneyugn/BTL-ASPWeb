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
        [Key]
        [Column(Order = 0)]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int IDSP { get; set; }

        [Key]
        [Column(Order = 1)]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int IDGH { get; set; }

        public int? SoLuong { get; set; }

        public decimal? DonGia { get; set; }

        public decimal? ThanhTien { get; set; }

        [StringLength(100)]
        public string GhiChu { get; set; }

        public virtual GioHang GioHang { get; set; }

        public virtual SanPham SanPham { get; set; }
    }
}
