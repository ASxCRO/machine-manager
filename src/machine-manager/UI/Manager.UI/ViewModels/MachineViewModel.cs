using Manager.Shared.Models.DTOs;
using System.ComponentModel.DataAnnotations;

namespace Manager.UI.ViewModels
{
    public class MachineViewModel : MachineDTO
    {
        [Required]
        [StringLength(10, ErrorMessage = "Ime je predugacko.")]
        public override string Name { get; set; }
        public bool ShowDetails { get; set; }

    }
}
