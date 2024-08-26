using Almacen.Data;
using Almacen.Models;
using Microsoft.AspNetCore.Mvc;

namespace Almacen.Controllers
{
    [Route("Ubicaciones")]
    public class UbicacionesController : Controller
    {
        private readonly AppDBcontext _appDbContext;

        public UbicacionesController(AppDBcontext context)
        {
            _appDbContext = context;
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
