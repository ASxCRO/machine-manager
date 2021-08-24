using Manager.API.Data.Models;
using Manager.API.Repositories;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Manager.API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class MachinesController : ControllerBase
    {
        private readonly MachinesRepository machinesRepository;
        private readonly FailuresRepository failuresRepository;

        public MachinesController(MachinesRepository machinesRepository,FailuresRepository failuresRepository)
        {
            this.machinesRepository = machinesRepository;
            this.failuresRepository = failuresRepository;
        }

        [HttpGet]
        [Route("GetAllMachines")]
        public IActionResult GetAllMachines()
        {
            return Ok(machinesRepository.FindAll());
        }


        [HttpGet]
        [Route("GetAllFailures")]
        public IActionResult GetAllFailures()
        {
            return Ok(failuresRepository.FindAll());
        }

        [HttpPost]
        [Route("InsertMachine")]
        public IActionResult Insert(Machine item)
        {
            machinesRepository.Add(item);
            return Ok();
        }


        [HttpPost]
        [Route("InsertFailure")]
        public IActionResult InsertPutnika(Failure item)
        {
            failuresRepository.Add(item);
            return Ok();
        }
    }
}
