using System;

namespace Guoli.Utilities
{
    /// <summary>
    /// 对DateTime类型的扩展
    /// </summary>
    public static class DateTimeExtension
    {
        /// <summary>
        /// 将1900-01-01这一天做为时间的默认值，表示未知的时间
        /// </summary>
        public static readonly DateTime UnknownDateTime = new DateTime(1900, 1, 1);

        public static readonly DateTime TimestampStarTime = new DateTime(1970, 1, 1);

        public static long GetTimestamp(DateTime datetime)
        {
            return Convert.ToInt64((datetime - TimestampStarTime).TotalSeconds);
        }

        public static long Timestamp(this DateTime datetime)
        {
            return GetTimestamp(datetime);
        }
    }
}
