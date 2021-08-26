using Manager.Shared.Models.Enums;
using System;
using System.Collections.Generic;

namespace Manager.API.Data.Models
{
    public class Failure : BaseEntity
    {
        public Failure()
        {
            Attachments = new();
        }
        public string Name { get; set; }
        public int Id { get; set; }
        public Priority Priority { get; set; }
        public string Description { get; set; }
        public FailureStatus Status { get; set; }
        public List<byte[]> Attachments{get;set; }
        public int MachineId { get; set; }
        public DateTime CheckInTime { get; set; }
    }
}
