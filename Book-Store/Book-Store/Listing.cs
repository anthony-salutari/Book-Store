using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Web;

namespace Book_Store
{
    public class Listing
    {
        public string title { get; set; }
        public string bookName { get; set; }
        public string author { get; set; }
        public Image coverImage { get; set; }
        public string condition { get; set; }
        public string price { get; set; }
        public string description { get; set; }
        public DateTime date { get; set; }
    }
}