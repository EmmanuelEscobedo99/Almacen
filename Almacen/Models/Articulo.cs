namespace Almacen.Models
{
    public class Articulo
    {
        public int ClaveArticulo { get; set; }
        public string Nombre { get; set; }
        public int Cantidad { get; set; }

        public int UbicacionId { get; set; }
        public Ubicacion Ubicacion { get; set; } 

        public DateTime FechaEntrada {get; set;}

        public int CategoriaId { get; set; }  
        public Categoria Categoria { get; set; }

        public ICollection<Movimiento> Movimientos { get; set; }
    }
}
