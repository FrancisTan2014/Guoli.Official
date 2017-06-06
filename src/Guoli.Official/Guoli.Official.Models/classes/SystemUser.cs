using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Guoli.Official.Models
{
    public class SystemUser
    {
        public int Id { get; set; }

        [Required]
        [MaxLength(16)]
        public string Username { get; set; }

        [Required]
        [MaxLength(32)]
        public string Password { get; set; }
    }
}
