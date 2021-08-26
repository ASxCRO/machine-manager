using System.Collections.Generic;

namespace Manager.Shared.Models.DTOs
{
    public class MachineDTO
    {
        public MachineDTO()
        {
            Failures = new();
        }
        public int Id { get; set; }
        public virtual string Name { get; set; }
        public List<FailureDTO> Failures { get; set; }
    }
}
