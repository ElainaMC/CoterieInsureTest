using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace QuoteAPI.Models
{
    public class RaterContext: DbContext
    {
        public RaterContext(DbContextOptions<RaterContext> options)
            :base(options)
        {

        }
        public DbSet<Rater>Rater { get; set; }
    }
}
