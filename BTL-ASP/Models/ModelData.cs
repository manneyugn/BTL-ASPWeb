namespace BTL_ASP.Models
{
    using System;
    using System.Data.Entity;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Linq;

    public partial class ModelData : DbContext
    {
        public ModelData()
            : base("name=ModelData")
        {
        }

        public virtual DbSet<AnhSanPham> AnhSanPhams { get; set; }
        public virtual DbSet<GioHang> GioHangs { get; set; }
        public virtual DbSet<KhachHang> KhachHangs { get; set; }
        public virtual DbSet<Loai> Loais { get; set; }
        public virtual DbSet<SanPham> SanPhams { get; set; }
        public virtual DbSet<SanPhamGioHang> SanPhamGioHangs { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Entity<AnhSanPham>()
                .Property(e => e.LinkAnh)
                .IsUnicode(false);

            modelBuilder.Entity<GioHang>()
                .Property(e => e.Email)
                .IsUnicode(false);

            modelBuilder.Entity<GioHang>()
                .Property(e => e.SDT)
                .IsUnicode(false);

            modelBuilder.Entity<GioHang>()
                .Property(e => e.TongTien)
                .HasPrecision(18, 0);

            modelBuilder.Entity<GioHang>()
                .HasMany(e => e.SanPhamGioHangs)
                .WithOptional(e => e.GioHang)
                .HasForeignKey(e => e.IDGH);

            modelBuilder.Entity<KhachHang>()
                .Property(e => e.Email)
                .IsUnicode(false);

            modelBuilder.Entity<KhachHang>()
                .Property(e => e.Password)
                .IsUnicode(false);

            modelBuilder.Entity<KhachHang>()
                .Property(e => e.Anh)
                .IsUnicode(false);

            modelBuilder.Entity<KhachHang>()
                .Property(e => e.SDT)
                .IsUnicode(false);

            modelBuilder.Entity<KhachHang>()
                .HasMany(e => e.GioHangs)
                .WithOptional(e => e.KhachHang)
                .HasForeignKey(e => e.IDKH);

            modelBuilder.Entity<Loai>()
                .HasMany(e => e.SanPhams)
                .WithOptional(e => e.Loai)
                .HasForeignKey(e => e.MaLoai);

            modelBuilder.Entity<SanPham>()
                .Property(e => e.Gia)
                .HasPrecision(18, 0);

            modelBuilder.Entity<SanPham>()
                .HasMany(e => e.AnhSanPhams)
                .WithOptional(e => e.SanPham)
                .HasForeignKey(e => e.IDSP);

            modelBuilder.Entity<SanPham>()
                .HasMany(e => e.SanPhamGioHangs)
                .WithOptional(e => e.SanPham)
                .HasForeignKey(e => e.IDSP);

            modelBuilder.Entity<SanPhamGioHang>()
                .Property(e => e.ThanhTien)
                .HasPrecision(18, 0);
        }
    }
}
