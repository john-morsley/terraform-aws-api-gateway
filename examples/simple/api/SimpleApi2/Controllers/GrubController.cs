using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;

namespace SimpleApi2.Controllers
{
    [ApiController]
    [Route("api/v1/grub")]
    public class GrubController : ControllerBase
    {
        [HttpGet]
        public string Get()
        {
            return "Hallo, aus Test 2";
        }
    }
}
