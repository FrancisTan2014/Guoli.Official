using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace Guoli.Official.Models
{
    /// <summary>
    /// 产品信息
    /// </summary>
    public class Product
    {
        public int Id { get; set; }

        [Required]
        [MaxLength(50)]
        public string Name { get; set; }

        /// <summary>
        /// 产品描述
        /// </summary>
        [Required]
        [MaxLength(100)]
        public string Description { get; set; }

        /// <summary>
        /// 产品型号
        /// </summary>
        [Required]
        [MaxLength(50)]
        public string Model { get; set; }

        /// <summary>
        /// 产品详情
        /// </summary>
        [Required]
        [MaxLength(8000)]
        public string Details { get; set; }

        /// <summary>
        /// 产品规格（技术参数）
        /// </summary>
        [Required]
        [MaxLength(8000)]
        public string Specification { get; set; }

        /// <summary>
        /// 是否在首页展示
        /// </summary>
        [Required]
        public bool ShowInHomePage { get; set; }

        private DateTime _addTime = DateTime.Now;
        public DateTime AddTime
        {
            get { return _addTime; }
            set { _addTime = value; }
        }

        private DateTime _updateTime = DateTime.Now;
        public DateTime UpdateTime
        {
            get { return _updateTime; }
            set { _updateTime = value; }
        }
        
        public bool IsDeleted { get; set; }

        public virtual ICollection<ProductImage> ProductImages { get; set; } 
    }
}
