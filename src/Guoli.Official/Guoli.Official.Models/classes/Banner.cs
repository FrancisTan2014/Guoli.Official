using System;
using System.ComponentModel.DataAnnotations;

namespace Guoli.Official.Models
{
    /// <summary>
    /// 轮播图
    /// </summary>
    public sealed class Banner
    {
        public int Id { get; set; }

        [Required]
        public string ImgUrl { get; set; }

        [Required]
        public string Link { get; set; }

        private bool _isEffective = true;
        [Required]
        public bool IsEffective
        {
            get { return _isEffective; }
            set { _isEffective = value; }
        }
        
        public bool IsDeleted { get; set; }
    }
}
