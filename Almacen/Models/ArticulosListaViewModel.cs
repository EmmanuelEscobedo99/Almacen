// Archivo: Models/ArticulosListaViewModel.cs
namespace Almacen.Models
{
    public class ArticulosListaViewModel
    {
        public List<Articulo> Articulos { get; set; }
        public List<Categoria> Categorias { get; set; }

        public List<Ubicacion> Ubicaciones { get; set; }
        public List<Movimiento> Movimientos { get; set; }
        public int CurrentPage { get; set; }
        public int TotalPages { get; set; }
    }
}
