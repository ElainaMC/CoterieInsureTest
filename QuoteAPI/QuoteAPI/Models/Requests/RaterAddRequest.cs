using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace QuoteAPI.Models.Requests
{
    public class RaterAddRequest
    {
        [Required]
        [Range (1, Int32.MaxValue)]
        public int Revenue { get; set; }

        [Required]
        [StringLength(20, MinimumLength =2)]
        public string State { get; set; }

        [Required]
        [StringLength(50, MinimumLength =10)]
        public string Business { get; set; }
    }
}
