using System.ComponentModel.DataAnnotations;
using Newtonsoft.Json.Linq;

namespace Guoli.Offical.Webapi.Models
{
    /// <summary>
    /// 分页获取数据的参数设置
    /// </summary>
    public class PagingParams
    {
        [Required]
        [Range(1, int.MaxValue)]
        public int page { get; set; }
        
        [Required]
        [Range(1, int.MaxValue)]
        public int size { get; set; }

        public JObject conditions { get; set; }
    }
}