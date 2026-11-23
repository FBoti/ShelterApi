using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using ShelterApi.Models;

namespace ShelterApi.Controllers
{
    [Route("queries")]
    [ApiController]
    public class QueriesController : ControllerBase
    {
        private readonly AnimalshelterContext _context;

        public QueriesController(AnimalshelterContext context)
        {
            _context = context;
        }

        [HttpGet("allSheltersWithAnimals")]
        public async Task<IActionResult> GetAllSheltersWithAnimals()
        {
            try
            {
                var shelters = await _context.Shelters.Include(s => s.Animals).ToListAsync();

                return StatusCode(200, shelters);
            }
            catch (Exception e)
            {
                return StatusCode(404, new { message = "Hiba történt: " + e.Message });
            }
        }

        [HttpGet("allAnimalsWithShelter")]
        public async Task<IActionResult> GetAllAnimalsWithShelter()
        {
            try
            {
                var animals = await _context.Animals
                    .Join(_context.Shelters,
                        a => a.ShelterId,
                        s => s.Id,
                        (a, s) => new
                        {
                            a.Id,
                            a.Name,
                            a.Species,
                            a.Age,
                            a.Weight,
                            a.RegTime,
                            ShelterName = s.Name
                        })
                    .ToListAsync();

                return StatusCode(200, animals);
            }
            catch (Exception e)
            {
                return StatusCode(404, new { message = "Hiba történt: " + e.Message });
            }
        }

        [HttpGet("animalsOfShelter")]
        public async Task<IActionResult> GetAnimalsOfShelter([FromQuery] Guid shelterId)
        {
            try
            {
                var shelter = await _context.Shelters
                    .Include(s => s.Animals)
                    .Where(s => s.Id == shelterId)
                    .FirstOrDefaultAsync();

                if (shelter != null)
                {
                    return StatusCode(200, shelter);
                }

                return StatusCode(404, shelter);
            }
            catch (Exception e)
            {
                return StatusCode(404, new { message = "Hiba történt: " + e.Message });
            }
        }

        [HttpGet("animalCountByShelter")]
        public async Task<IActionResult> GetAnimalCountByShelter()
        {
            try
            {
                var counts = await _context.Shelters
                    .Select(s => new
                    {
                        s.Id,
                        s.Name,
                        AnimalCount = s.Animals.Count()
                    })
                    .OrderByDescending(x => x.AnimalCount)
                    .ToListAsync();

                return StatusCode(200, counts);
            }
            catch (Exception e)
            {
                return StatusCode(404, new { message = "Hiba történt: " + e.Message });
            }
        }
    }
}