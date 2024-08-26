using Microsoft.EntityFrameworkCore;
using Almacen.Models;

namespace Almacen.Data
{
    public class AppDBcontext : DbContext
    {
        public AppDBcontext(DbContextOptions<AppDBcontext> options) : base(options)
        {
        }

        public DbSet<Articulo> Articulos { get; set; }
        public DbSet<Movimiento> Movimientos { get; set; }
        public DbSet<Ubicacion> Ubicaciones { get; set; }
        public DbSet<Categoria> Categorias { get; set; }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            // Configuración de Articulo
            modelBuilder.Entity<Articulo>(tb =>
            {
                tb.HasKey(col => col.ClaveArticulo);
                tb.Property(col => col.ClaveArticulo)
                    .UseIdentityColumn()
                    .ValueGeneratedOnAdd();

                tb.Property(col => col.Nombre).HasMaxLength(50);

                // Configuración de la relación con Ubicacion
                tb.HasOne(a => a.Ubicacion)
                  .WithMany(u => u.Articulos)
                  .HasForeignKey(a => a.UbicacionId)
                  .OnDelete(DeleteBehavior.Restrict); 

                tb.HasOne(a => a.Categoria)
                  .WithMany(u => u.Articulos)
                  .HasForeignKey(a => a.CategoriaId)
                  .OnDelete(DeleteBehavior.Restrict);
            });

            // Configuración de Movimiento
            modelBuilder.Entity<Movimiento>(tb =>
            {
                tb.HasKey(col => col.Id);
                tb.Property(col => col.Fecha).IsRequired();

                // Configuración de la relación con Articulo
                tb.HasOne(m => m.Articulo)
                  .WithMany(a => a.Movimientos)
                  .HasForeignKey(m => m.ArticuloId)
                  .OnDelete(DeleteBehavior.Cascade); 
            });

            // Configuración de Ubicacion
            modelBuilder.Entity<Ubicacion>(tb =>
            {
                tb.HasKey(col => col.Id);
                tb.Property(col => col.Nombre).HasMaxLength(100);
            });

            modelBuilder.Entity<Categoria>(tb =>
            {
                tb.HasKey(c => c.Id);
                tb.Property(c => c.Nombre).HasMaxLength(50);
            });


            // Nombres de tablas
            modelBuilder.Entity<Articulo>().ToTable("Articulo");
            modelBuilder.Entity<Movimiento>().ToTable("Movimiento");
            modelBuilder.Entity<Ubicacion>().ToTable("Ubicacion");
            modelBuilder.Entity<Categoria>().ToTable("Categoria");
        }
    }
}
