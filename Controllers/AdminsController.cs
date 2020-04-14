using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using TheIndianSuperMarket.Models;

namespace TheIndianSuperMarket.Controllers
{
    public class AdminsController : Controller
    {
        private readonly TheIndianMarketContext _context;

        public AdminsController(TheIndianMarketContext context)
        {
            _context = context;
        }

        // GET: Admins
        public async Task<IActionResult> Index()
        {
            return View(await _context.Admin.ToListAsync());
        }
        public IActionResult Administrator()
        {
            var AdminContext = _context.Admin.OrderBy(p=>p.Name);
            return View(AdminContext);
        }
        public IActionResult Customers()
        {
            var CustomerContext = _context.Customers.OrderBy(p => p.CustomerFirstName);
            return View(CustomerContext);
        }
        public IActionResult Products()
        {
            var ProductContext = _context.Products.OrderBy(p => p.DepartmentName);
            return View(ProductContext);
        }
        public IActionResult CustomerOrders()
        {
            var OrderContext = _context.CustomerOrder;
       
            return View(OrderContext);
        }
        public IActionResult StoreOrders()
        {
            return View();
        }
        public IActionResult Supplier()
        {
            var SupplierContext = _context.Suppliers.OrderBy(p => p.SupplierName);
            return View(SupplierContext);
        }
        public IActionResult SupplierProduct(int id)
        {
            var supplierContext = _context.Suppliers.Where(p => p.SupplierId == id).FirstOrDefault();
            var productContext = _context.Products.Where(p=>p.SupplierId == id);
            ViewData["SupplierName"] = supplierContext.SupplierName;
            return View(productContext);
        }
        public IActionResult ProductCategories()
        {
            var DepartmentContext = _context.Departments.OrderBy(p => p.DepartmentName);
            return View(DepartmentContext);
        }
        public IActionResult Confirm()
        {
            MailMessage mail = new MailMessage();
            mail.To.Add("dharanarola2012@gmail.com");
            mail.From = new MailAddress("abc@gmail.com");
            mail.Subject = "Regarding To Order";
            string Body = "You Got Message From Vivek Shah " + "This is the Message: Please Kindly Check order detail for next order!";
            mail.Body = Body;

            using (var smtp = new SmtpClient())
            {
                var credential = new NetworkCredential
                {
                    UserName = "dharanarola2012@gmail.com",  // replace with valid value
                    Password = "K@09neeSUR"  // replace with valid value
                };
                smtp.Credentials = credential;
                smtp.Host = "smtp.gmail.com";
                smtp.Port = 587;
                smtp.EnableSsl = true;
                smtp.Send(mail);
                TempData["Message"] = "Order Placed Succesfully!";
                return RedirectToAction("Supplier");
            }
        }
            // GET: Admins/Details/5
       public async Task<IActionResult> Details(int? id)
       {
            if (id == null)
            {
                return NotFound();
            }

            var admin = await _context.Admin
                .FirstOrDefaultAsync(m => m.AdminId == id);
            if (admin == null)
            {
                return NotFound();
            }

            return View(admin);
        }

        // GET: Admins/Create
        public IActionResult Create()
        {
            return View();
        }

        // POST: Admins/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("AdminId,Name,Password")] Admin admin)
        {
            if (ModelState.IsValid)
            {
                _context.Add(admin);
                await _context.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }
            return View(admin);
        }

        // GET: Admins/Edit/5
        public async Task<IActionResult> Edit(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var admin = await _context.Admin.FindAsync(id);
            if (admin == null)
            {
                return NotFound();
            }
            return View(admin);
        }

        // POST: Admins/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id, [Bind("AdminId,Name,Password")] Admin admin)
        {
            if (id != admin.AdminId)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    _context.Update(admin);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!AdminExists(admin.AdminId))
                    {
                        return NotFound();
                    }
                    else
                    {
                        throw;
                    }
                }
                return RedirectToAction(nameof(Index));
            }
            return View(admin);
        }

        /* GET: Admins/Delete/5
        public async Task<IActionResult> Delete(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var admin = await _context.Admin
                .FirstOrDefaultAsync(m => m.AdminId == id);
            if (admin == null)
            {
                return NotFound();
            }

            return View(admin);
        }*/

        // POST: /Delete/5
        
        public async Task<IActionResult> Delete(int id)
        {

            var products = await _context.Products.FindAsync(id);
            _context.Products.Remove(products);
            await _context.SaveChangesAsync();
            TempData["Message"] = products.ProductName + " has been deleted Successfully!";
            return RedirectToAction(nameof(Products));
        }

        private bool AdminExists(int id)
        {
            return _context.Admin.Any(e => e.AdminId == id);
        }
    }
}
