using System.ComponentModel.DataAnnotations;

namespace Guoli.Official.Models
{
    /// <summary>
    /// 产品图片表
    /// </summary>
    public class ProductImage
    {
        public int Id { get; set; }

        [Required]
        public int ProductId { get; set; }
        
        [Required]
        public string ImgUrl { get; set; }
        
        public bool IsDeleted { get; set; }
    }
}
