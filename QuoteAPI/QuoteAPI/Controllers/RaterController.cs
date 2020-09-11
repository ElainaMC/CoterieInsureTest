using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using QuoteAPI.Models.Requests;
using QuoteAPI.Models.Responses;

namespace QuoteAPI.Controllers
{
    [Route("api/rater")]
    [ApiController]
    public class RaterController : Controller
    {
        private IRaterService _service = null;
        private IAuthenticationService<int> _authService = null;

        public RaterController(IRaterService service
            , ILogger<RaterController> logger
            , IAuthenticationService<int> authService): base(logger)
        {
            _service = service;
            _authService = authService;
        }
        // GET: RaterController
        public ActionResult Index()
        {
            return View();
        }

        // GET: RaterController/Details/5
        public ActionResult Details(int id)
        {
            return View();
        }

        // GET: RaterController/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: RaterController/Create
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult <ItemResponse<int>>Create(RaterAddRequest model)
        {
            int userId = _authService.GetCurrentUserId();

            ObjectResult result;
            try
            {
                int id = _service.Add(model, currentUserId);
                ItemResponse<int> response = new ItemResponse<int> { Item = id };
                result = Created201(response);
            }
            catch (Exception ex)
            {
                base.Logger.LogError(ex.ToString());
                ErrorResponse response = new ErrorResponse(ex.Message);
                result = StatusCode(500, response);
            }
            return result;
            
        }

        // GET: RaterController/Edit/5
        public ActionResult Edit(int id)
        {
            return View();
        }

        // POST: RaterController/Edit/5
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(int id, IFormCollection collection)
        {
            try
            {
                return RedirectToAction(nameof(Index));
            }
            catch
            {
                return View();
            }
        }

        // GET: RaterController/Delete/5
        public ActionResult Delete(int id)
        {
            return View();
        }

        // POST: RaterController/Delete/5
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Delete(int id, IFormCollection collection)
        {
            try
            {
                return RedirectToAction(nameof(Index));
            }
            catch
            {
                return View();
            }
        }
    }
}
