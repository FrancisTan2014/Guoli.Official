using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Guoli.Official.Models
{
    /// <summary>
    /// 职位类别
    /// </summary>
    public class JobType
    {
        public int Id { get; set; }

        [Required]
        [MaxLength(50)]
        public string JobName { get; set; }
    }
}
