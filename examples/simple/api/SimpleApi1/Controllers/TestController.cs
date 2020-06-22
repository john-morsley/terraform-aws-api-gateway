using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;

namespace SimpleApi1.Controllers
{
    [ApiController]
    [Route("api/v1/greeting")]
    public class GreetingController : ControllerBase
    {
        [HttpGet]
        public string Get()
        {
            return "Hello, from Test 1";
        }
    }
}
