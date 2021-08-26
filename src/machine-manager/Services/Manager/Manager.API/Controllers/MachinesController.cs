using AutoMapper;
using Manager.API.Data.Models;
using Manager.API.Repositories;
using Manager.Shared.Models.DTOs;
using Microsoft.AspNetCore.Mvc;
using System.Collections.Generic;

namespace Manager.API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class MachinesController : ControllerBase
    {
        private readonly MachinesRepository machinesRepository;
        private readonly FailuresRepository failuresRepository;
        private readonly IMapper mapper;

        public MachinesController(MachinesRepository machinesRepository,FailuresRepository failuresRepository, IMapper mapper)
        {
            this.machinesRepository = machinesRepository;
            this.failuresRepository = failuresRepository;
            this.mapper = mapper;
        }

        [HttpGet]
        [Route("GetAllMachines")]
        public IActionResult GetAllMachines()
        {
            return Ok(mapper.Map<List<MachineDTO>>(machinesRepository.FindAll()));
        }


        [HttpGet]
        [Route("GetAllFailures")]
        public IActionResult GetAllFailures()
        {
            return Ok(mapper.Map<List<FailureDTO>>(failuresRepository.FindAll()));
        }

        [HttpPost]
        [Route("InsertMachine")]
        public IActionResult Insert(MachineCreateDTO item)
        {
            machinesRepository.Add(mapper.Map<Machine>(item));
            return Ok();
        }


        [HttpPost]
        [Route("InsertFailure")]
        public IActionResult InsertFailure(FailureCreateDTO item)
        {
            failuresRepository.Add(mapper.Map<Failure>(item));
            return Ok();
        }

        [HttpGet]
        [Route("GetMachineById")]
        public IActionResult GetMachineById(int id)
        {
            return Ok(mapper.Map<MachineDTO>(machinesRepository.FindByID(id)));
        }

        [HttpGet]
        [Route("GetFailureById")]
        public IActionResult GetFailureById(int id)
        {
            return Ok(mapper.Map<FailureDTO>(failuresRepository.FindByID(id)));
        }


        [HttpDelete]
        [Route("RemoveMachine")]
        public IActionResult RemoveMachine(int id)
        {
            machinesRepository.Remove(id);
            return Ok();
        }

        [HttpDelete]
        [Route("RemoveFailure")]
        public IActionResult RemoveFailure(int id)
        {
            failuresRepository.Remove(id);
            return Ok();
        }

        [HttpPut]
        [Route("UpdateMachine")]
        public IActionResult UpdateMachine(MachineUpdateDTO item)
        {
            machinesRepository.Update(mapper.Map<Machine>(item));
            return Ok();
        }

        [HttpPut]
        [Route("UpdateFailure")]
        public IActionResult UpdateFailure(FailureUpdateDTO item)
        {
            failuresRepository.Update(mapper.Map<Failure>(item));
            return Ok();
        }
    }
}
