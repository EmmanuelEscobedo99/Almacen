namespace Almacen.Models
{
    public class Ubicacion
    {
        public int Id { get; set; }
        public string Nombre { get; set; }

        public ICollection<Articulo> Articulos { get; set; } 
    }
}
