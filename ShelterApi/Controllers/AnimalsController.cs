using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using ShelterApi.Models;
using ShelterApi.Models.DTOs;

namespace ShelterApi.Controllers
{
    [Route("animals")]
    [ApiController]
    public class AnimalsController : ControllerBase
    {
        private readonly AnimalshelterContext _context;

        public AnimalsController(AnimalshelterContext context)
        {
            _context = context;
        }

        [HttpPost("newAnimal")]
        public async Task<IActionResult> NewAnimal(NewAnimalDto newAnimalDto)
        {
            try
            {
                if (string.IsNullOrWhiteSpace(newAnimalDto.Name) || string.IsNullOrWhiteSpace(newAnimalDto.Species) || newAnimalDto.Age < 0 || newAnimalDto.Weight <= 0)
                {
                    return StatusCode(404, new { message = "Hiba " });
                }

                var shelter = await _context.Shelters.FirstOrDefaultAsync(s => s.Id == newAnimalDto.ShelterId);

                if (shelter == null)
                {
                    return StatusCode(404, new { message = "Nincs ilyen menhely" });
                }

                var sameAnimal = await _context.Animals.FirstOrDefaultAsync(a =>
                    a.ShelterId == newAnimalDto.ShelterId && a.Name == newAnimalDto.Name && a.Species == newAnimalDto.Species);

                if (sameAnimal != null)
                {
                    return StatusCode(409, new { message = "Ebben a menhelyben már van ilyen névvel és fajjal rendelkező kis szőrös élőlény" });
                }

                var animal = new Animal
                {
                    Id = Guid.NewGuid(),
                    Name = newAnimalDto.Name,
                    Species = newAnimalDto.Species,
                    Age = newAnimalDto.Age,
                    Weight = newAnimalDto.Weight,
                    RegTime = DateTime.Now,
                    ShelterId = newAnimalDto.ShelterId
                };

                await _context.Animals.AddAsync(animal);
                await _context.SaveChangesAsync();

                return StatusCode(200, animal);
            }
            catch (Exception e)
            {
                return StatusCode(404, new { message = "Hiba " + e.Message });
            }
        }

        [HttpGet("allAnimal")]
        public async Task<IActionResult> GetAllAnimal()
        {
            try
            {
                var animals = await _context.Animals.ToListAsync();

                if (animals.Count > 0)
                {
                    return StatusCode(200, animals);
                }

                return StatusCode(404, animals);
            }
            catch (Exception e)
            {
                return StatusCode(404, new { message = "Hiba " + e.Message });
            }
        }

        [HttpGet("byId")]
        public async Task<IActionResult> GetById([FromQuery] Guid id)
        {
            try
            {
                var animal = await _context.Animals.FirstOrDefaultAsync(a => a.Id == id);

                if (animal != null)
                {
                    return StatusCode(200, animal);
                }

                return StatusCode(404, animal);
            }
            catch (Exception e)
            {
                return StatusCode(404, new { message = "Hiba " + e.Message });
            }
        }

        [HttpPut("update")]
        public async Task<IActionResult> UpdateAnimal([FromQuery] Guid id, UpdateAnimalDto updateAnimalDto)
        {
            try
            {
                var animal = await _context.Animals.FirstOrDefaultAsync(a => a.Id == id);

                if (animal == null)
                {
                    return StatusCode(404, animal);
                }

                if (string.IsNullOrWhiteSpace(updateAnimalDto.Name) || string.IsNullOrWhiteSpace(updateAnimalDto.Species) || updateAnimalDto.Age < 0 || updateAnimalDto.Weight <= 0)
                {
                    return StatusCode(404, new { message = "Hiba " });
                }

                var shelter = await _context.Shelters.FirstOrDefaultAsync(s => s.Id == updateAnimalDto.ShelterId);

                if (shelter == null)
                {
                    return StatusCode(404, new { message = "Nincs ilyen menhely" });
                }

                var sameAnimal = await _context.Animals.FirstOrDefaultAsync(a =>
                    a.Id != id && a.ShelterId == updateAnimalDto.ShelterId && a.Name == updateAnimalDto.Name && a.Species == updateAnimalDto.Species);

                if (sameAnimal != null)
                {
                    return StatusCode(404, new { message = "Ebben a menhelyben már van ilyen névvel és fajjal rendelkező kis szőrös élőlény" });
                }

                animal.Name = updateAnimalDto.Name;
                animal.Species = updateAnimalDto.Species;
                animal.Age = updateAnimalDto.Age;
                animal.Weight = updateAnimalDto.Weight;
                animal.ShelterId = updateAnimalDto.ShelterId;

                _context.Animals.Update(animal);
                await _context.SaveChangesAsync();

                return StatusCode(200, animal);
            }
            catch (Exception e)
            {
                return StatusCode(404, new { message = "Hiba " + e.Message });
            }
        }

        [HttpDelete("deleteAnimal")]
        public async Task<IActionResult> DeleteAnimal([FromQuery] Guid id)
        {
            try
            {
                var animal = await _context.Animals.FirstOrDefaultAsync(a => a.Id == id);

                if (animal != null)
                {
                    _context.Animals.Remove(animal);
                    await _context.SaveChangesAsync();

                    return StatusCode(200, animal);
                }

                return StatusCode(404, animal);
            }
            catch (Exception e)
            {
                return StatusCode(404, new { message = "Hiba " + e.Message });
            }
        }
    }
}