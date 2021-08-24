using System.Collections.Generic;

namespace Manager.API.Data.Models
{
    public class Machine : BaseEntity
    {
        public Machine()
        {
            Failures = new();
        }
        public int Id { get; set; }
        public string Name { get; set; }
        public List<Failure> Failures { get; set; }
    }
}
