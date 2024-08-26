namespace Almacen.Models
{
    public class Movimiento
    {
        public int Id { get; set; }
        public int ArticuloId { get; set; }
        public Articulo Articulo { get; set; } 

        public DateTime Fecha { get; set; }
        public int Cantidad { get; set; }
        public string Tipo { get; set; } // Entrada o Salida
    }
}
