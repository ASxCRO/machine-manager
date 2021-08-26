using Manager.Shared.Models.Enums;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Manager.Shared.Models.DTOs
{
    public class FailureCreateDTO
    {
        public FailureCreateDTO()
        {
            Name = "";
            Description = "";
            Attachments = new();
        }
        public string Name { get; set; }
        public Priority Priority { get; set; }
        public string Description { get; set; }
        public FailureStatus Status { get; set; }
        public List<byte[]> Attachments { get; set; }
        public int MachineId { get; set; }
    }
}
