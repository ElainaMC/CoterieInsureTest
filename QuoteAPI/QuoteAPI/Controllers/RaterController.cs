using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using QuoteAPI.Models;
using QuoteAPI.Models.Requests;
using QuoteAPI.Models.Responses;

namespace QuoteAPI.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class RaterController : ControllerBase
    {
        private static readonly string[] Summaries = new[]
        {
            "Freezing", "Bracing", "Chilly", "Cool", "Mild", "Warm", "Balmy", "Hot", "Sweltering", "Scorching"
        };

        private readonly ILogger<RaterController> _logger;

        public RaterController(ILogger<RaterController> logger)
        {
            _logger = logger;
        }

        [HttpGet]
        public IEnumerable<Rater> Get()
        {
            var rng = new Random();
            return Enumerable.Range(1, 5).Select(index => new Rater
            {
                Revenue = rng.Next(100, 900),
                State  = 
                Business = Summaries[rng.Next(Summaries.Length)]
            })
            .ToArray();
        }
    }
}
