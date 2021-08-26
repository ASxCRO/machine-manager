using AutoMapper;
using Manager.API.Data.Models;
using Manager.Shared.Models.DTOs;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Manager.API.Profiles
{
    public class DTOProfile : Profile
    {
        public DTOProfile()
        {
            CreateMap<Failure, FailureDTO>();
            CreateMap<Machine, MachineDTO>();
            CreateMap<FailureDTO,Failure>();
            CreateMap<MachineDTO, Machine>();
            CreateMap<MachineCreateDTO, Machine>();
            CreateMap<FailureCreateDTO, Failure>();
            CreateMap<MachineUpdateDTO, Machine>();
            CreateMap<FailureUpdateDTO, Failure>();
        }
    }
}
