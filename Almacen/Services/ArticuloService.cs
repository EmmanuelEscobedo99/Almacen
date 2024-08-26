using Almacen.Data;
using Almacen.Models;
using Microsoft.EntityFrameworkCore;

public class ArticuloService
{
    private readonly AppDBcontext _context;

    public ArticuloService(AppDBcontext context)
    {
        _context = context;
    }

    public List<Articulo> GetAll()
    {
        return _context.Articulos.Include(a => a.Ubicacion).ToList();
    }

    public Articulo GetById(int id)
    {
        return _context.Articulos.Include(a => a.Ubicacion).FirstOrDefault(a => a.UbicacionId == id);
    }

    public void Create(Articulo articulo)
    {
        _context.Articulos.Add(articulo);
        _context.SaveChanges();
    }

    public void Update(Articulo articulo)
    {
        _context.Articulos.Update(articulo);
        _context.SaveChanges();
    }

    public void Delete(int id)
    {
        var articulo = _context.Articulos.Find(id);
        if (articulo != null)
        {
            _context.Articulos.Remove(articulo);
            _context.SaveChanges();
        }
    }
}
