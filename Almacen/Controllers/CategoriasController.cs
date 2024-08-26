using Microsoft.AspNetCore.Mvc;
using Almacen.Data;
using Almacen.Models;
using Microsoft.EntityFrameworkCore;

namespace Almacen.Controllers
{
    public class CategoriasController : Controller
    {
        private readonly AppDBcontext _appDbContext;

        public CategoriasController(AppDBcontext appDbContext)
        {
            _appDbContext = appDbContext;
        }

        [HttpGet]
        public async Task<IActionResult> Index()
        {
            var categorias = await _appDbContext.Categorias.ToListAsync();
            return View(categorias);
        }

        [HttpGet]
        public IActionResult Crear()
        {
            return View();
        }


    }
}
