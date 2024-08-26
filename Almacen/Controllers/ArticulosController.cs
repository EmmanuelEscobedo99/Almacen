using Microsoft.AspNetCore.Mvc;
using Almacen.Data;
using Almacen.Models;
using Microsoft.EntityFrameworkCore;

namespace Almacen.Controllers
{
    public class ArticulosController : Controller
    {
        private readonly AppDBcontext _appDbContext;
        private const int PageSize = 5; 

        public ArticulosController(AppDBcontext appDBcontext)
        {
            _appDbContext = appDBcontext;
        }

        [HttpGet]
        public async Task<IActionResult> Lista(int? categoriaId, int? ubicacionId, int page = 1)
        {
            var query = _appDbContext.Articulos.Include(a => a.Categoria).Include(a => a.Ubicacion).AsQueryable();

            if (categoriaId.HasValue)
            {
                query = query.Where(a => a.CategoriaId == categoriaId.Value);
            }

            if (ubicacionId.HasValue)
            {
                query = query.Where(a => a.UbicacionId == ubicacionId.Value);
            }

            var articulos = await query.Skip((page - 1) * PageSize).Take(PageSize).ToListAsync();
            var totalItems = await query.CountAsync();

            var model = new ArticulosListaViewModel
            {
                Articulos = articulos,
                Categorias = await _appDbContext.Categorias.ToListAsync(),
                Ubicaciones = await _appDbContext.Ubicaciones.ToListAsync(),
                CurrentPage = page,
                TotalPages = (int)Math.Ceiling((double)totalItems / PageSize)
            };

            return View(model);
        }

        [HttpGet]
        public async Task<IActionResult> Nuevo()
        {
            var ubicaciones = await _appDbContext.Ubicaciones.ToListAsync();
            ViewBag.Ubicaciones = ubicaciones;

            var categorias = await _appDbContext.Categorias.ToListAsync();
            ViewBag.Categorias = categorias;

            return View();
        }

        [HttpGet]
        public async Task<IActionResult> Kardex()
        {
            var movimientos = await _appDbContext.Movimientos
                                            .OrderBy(m => m.Fecha)
                                            .ToListAsync();

            return View(movimientos);
        }

        [HttpPost]
        public async Task<IActionResult> Nuevo(Articulo articulo)
        {
            await _appDbContext.Articulos.AddAsync(articulo);
            await _appDbContext.SaveChangesAsync();
            return RedirectToAction("Lista");
        }

        [HttpPost]
        public async Task<IActionResult> RegistrarMovimiento([FromBody] Movimiento movimiento)
        {
            var articulo = await _appDbContext.Articulos.FindAsync(movimiento.ArticuloId);

            if (articulo == null)
            {
                return NotFound();
            }

            if (movimiento.Tipo == "Salida")
            {
                if (articulo.Cantidad < movimiento.Cantidad)
                {
                    return BadRequest(new { message = "No hay suficiente cantidad en inventario para realizar la salida." });
                }
                articulo.Cantidad -= movimiento.Cantidad;
            }
            else if (movimiento.Tipo == "Entrada")
            {
                articulo.Cantidad += movimiento.Cantidad;
            }
            _appDbContext.Movimientos.Add(movimiento);
            await _appDbContext.SaveChangesAsync();

            return Ok();
        }

        [HttpPost]
        public async Task<IActionResult> AgregarCategoria([FromBody] Categoria categoria)
        {
            if (ModelState.IsValid)
            {
                await _appDbContext.Categorias.AddAsync(categoria);
                await _appDbContext.SaveChangesAsync();
                return Ok();
            }

            return BadRequest(new { message = "Datos inválidos para la categoría." });
        }

        [HttpPost]
        public async Task<IActionResult> AgregarUbicacion([FromBody] Ubicacion ubicacion)
        {
            if (ModelState.IsValid)
            {
                await _appDbContext.Ubicaciones.AddAsync(ubicacion);
                await _appDbContext.SaveChangesAsync();
                return Ok();
            }

            return BadRequest(new { message = "Datos inválidos para la ubicación." });
        }
    }
}
