using Microsoft.AspNetCore.Mvc;
using Almacen.Data;
using Almacen.Models;
using Microsoft.EntityFrameworkCore;
public class KardexController : Controller
{
    private readonly AppDBcontext _appDbContext;

    public KardexController(AppDBcontext context)
    {
        _appDbContext = context;
    }

    public async Task<IActionResult> Index()
    {
        var movimientos = await _appDbContext.Movimientos
                                        .Include(m => m.Articulo)
                                        .OrderBy(m => m.Fecha)
                                        .ToListAsync();

        return View(movimientos);
    }
}
