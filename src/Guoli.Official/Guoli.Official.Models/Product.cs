//------------------------------------------------------------------------------
// <auto-generated>
//     此代码已从模板生成。
//
//     手动更改此文件可能导致应用程序出现意外的行为。
//     如果重新生成代码，将覆盖对此文件的手动更改。
// </auto-generated>
//------------------------------------------------------------------------------

namespace Guoli.Official.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class Product
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public string Model { get; set; }
        public string Details { get; set; }
        public string Specification { get; set; }
        public bool ShowInHomePage { get; set; }
        public System.DateTime AddTime { get; set; }
        public System.DateTime UpdateTime { get; set; }
        public bool IsDeleted { get; set; }
    }
}