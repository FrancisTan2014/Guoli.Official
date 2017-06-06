using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Guoli.Official.Models
{
    /// <summary>
    /// 招聘信息
    /// </summary>
    public class Job
    {
        public int Id { get; set; }

        [Required]
        public int JobTypeId { get; set; }

        [Required]
        public int DepartmentId { get; set; }

        /// <summary>
        /// 工作地点
        /// </summary>
        [Required]
        [MaxLength(50)]
        public string WorkingPlace { get; set; }

        /// <summary>
        /// 招聘人数
        /// </summary>
        [Required]
        [Range(1, int.MaxValue)]
        public int HiringNumber { get; set; }

        /// <summary>
        /// 岗位职责
        /// </summary>
        [Required]
        [MaxLength(8000)]
        public string Responsibilities { get; set; }

        /// <summary>
        /// 任职要求
        /// </summary>
        [Required]
        [MaxLength(8000)]
        public string Requirements { get; set; }
        
        /// <summary>
        /// 优先考虑
        /// </summary>
        public string Preference { get; set; }

        /// <summary>
        /// 简历投递方式
        /// </summary>
        public string AsumePosts { get; set; }

        private DateTime _addTime = DateTime.Now;

        public DateTime AddTime
        {
            get { return _addTime; }
            set { _addTime = value; }
        }

        public bool IsDeleted { get; set; }

        public virtual JobType JobType { get; set; }
        public virtual Department Department { get; set; }
    }
}
