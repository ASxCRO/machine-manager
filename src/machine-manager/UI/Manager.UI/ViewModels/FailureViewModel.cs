using Manager.Shared.Models.Enums;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Manager.UI.ViewModels
{
    public class FailureViewModel
    {
        public int FailureId { get; set; }
        public string FailureName { get; set; }
        public string FailureDescription { get; set; }
        public string MachineName { get; set; }
        public int FailureStatus { get; set; }
        public DateTime FailureCheckInTime { get; set; }
    }
}
