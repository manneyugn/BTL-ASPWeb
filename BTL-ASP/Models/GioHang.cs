namespace BTL_ASP.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("GioHang")]
    public partial class GioHang
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public GioHang()
        {
            SanPhamGioHangs = new HashSet<SanPhamGioHang>();
        }

        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int ID { get; set; }

        public int? IDKH { get; set; }

        [StringLength(100)]
        public string TenKH { get; set; }

        [StringLength(100)]
        public string Email { get; set; }

        [StringLength(12)]
        public string SDT { get; set; }

        [StringLength(100)]
        public string DiaChi { get; set; }

        public decimal? TongTien { get; set; }

        [StringLength(100)]
        public string GhiChu { get; set; }

        [StringLength(100)]
        public string TinhTrang { get; set; }

        [Column(TypeName = "date")]
        public DateTime? NgayTao { get; set; }

        public virtual KhachHang KhachHang { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<SanPhamGioHang> SanPhamGioHangs { get; set; }
    }
}
