using Almacen.Data;
using Almacen.Models;

public class KardexService
{
    private readonly AppDBcontext _context;

    public KardexService(AppDBcontext context)
    {
        _context = context;
    }

    public List<Movimiento> GetMovimientosPorArticulo(int articuloId)
    {
        return _context.Movimientos.Where(m => m.ArticuloId == articuloId).OrderBy(m => m.Fecha).ToList();
    }

    public void RegistrarMovimiento(int articuloId, int cantidad, string tipo)
    {
        var articulo = _context.Articulos.Find(articuloId);
        if (articulo == null)
        {
            throw new Exception("Artículo no encontrado.");
        }

        var movimiento = new Movimiento
        {
            ArticuloId = articuloId,
            Cantidad = cantidad,
            Fecha = DateTime.Now,
            Tipo = tipo
        };

        _context.Movimientos.Add(movimiento);

        if (tipo == "Entrada")
        {
            articulo.Cantidad += cantidad;
        }
        else if (tipo == "Salida")
        {
            if (articulo.Cantidad >= cantidad)
            {
                articulo.Cantidad -= cantidad;
            }
            else
            {
                throw new Exception("No hay suficiente inventario para la salida.");
            }
        }

        _context.SaveChanges();
    }
}
