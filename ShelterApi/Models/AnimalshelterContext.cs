using Microsoft.EntityFrameworkCore;

namespace ShelterApi.Models
{
    public class AnimalshelterContext : DbContext
    {
        public AnimalshelterContext()
        {
        }

        public AnimalshelterContext(DbContextOptions<AnimalshelterContext> options)
            : base(options)
        {
        }

        public virtual DbSet<Animal> Animals { get; set; }

        public virtual DbSet<Shelter> Shelters { get; set; }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
        }
    }
}
