﻿using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using TheIndianSuperMarket.Models;

namespace TheIndianSuperMarket.Controllers
{
   
    public class HomeController : Controller
    {
        private readonly TheIndianMarketContext _context;

        public HomeController(TheIndianMarketContext context)
        {
            _context = context;
        }
        public IActionResult HomePage(String Cust_ID)
        {
            Debug.Print("CustomerId : " + Cust_ID.ToString());
            var CustomerContext = _context.Customers.Where(p => p.CustomerId == Convert.ToInt32(Cust_ID)).FirstOrDefault();
            HttpContext.Session.SetString("CustomerEmail", CustomerContext.CustomerEmail);
            ViewData["CustomerEmail"] = CustomerContext.CustomerEmail;
            return View();
        }
        public IActionResult Index()
        {
            return View();
        }

        [HttpPost]
        public IActionResult Index([Bind("CustomerEmail,Password")] Customers customers)
        {
            
            var CustomerContext = _context.Customers.Where(p =>p.CustomerEmail ==customers.CustomerEmail && p.Password ==customers.Password).FirstOrDefault(); ;
            //Debug.Print("CustomerContext.CustomerId"+CustomerContext.CustomerId.ToString());
           
            if (CustomerContext != null ) 
            {
                if (CustomerContext.CustomerEmail == customers.CustomerEmail && CustomerContext.Password == customers.Password)
                {
                    return RedirectToAction(nameof(HomePage), new { Cust_id = CustomerContext.CustomerId });
                }
                   
            }
            else if(customers.CustomerEmail == "vivek@gmail.com" && customers.Password == "vivek")
            {
                return RedirectToAction(nameof(Index),"Admins");
            }
          
            return View();
        }
        public IActionResult Contact()
        {
            return View();
        }

        [HttpPost]
        public async Task<IActionResult> Contact(IFormCollection form)
        {
            string name = form["name"].ToString();
            string email = form["mail"].ToString();
            string subject = form["subject"].ToString();
            string message = form["message"].ToString();

            MailMessage mail = new MailMessage();
            mail.To.Add("dharanarola2012@gmail.com");
            mail.From = new MailAddress(email);
            mail.Subject = subject;
            string Body = "You Got Message From: "+name+ "This is the Message:" + message;
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
                return RedirectToAction("Index");
            }

            Debug.Print(name);
            Debug.Print(email);
            Debug.Print(subject);
            Debug.Print(message);

            if(name != "")
            {
                RedirectToAction(nameof(Index));

            }

            return View();
        }
        public IActionResult About()
        {
            return View();
        }
        public IActionResult Shop()
        {
            return View();
        }
        public IActionResult Wishlist()
        {
            return View();
        }
        public IActionResult Cart()
        {
            return View();
        }
        public IActionResult Checkout()
        {
            return View();
        }
        public IActionResult Privacy()
        {
            return View();
        }

        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
        private bool AdminExists(int id)
        {
             return _context.Admin.Any(e => e.AdminId == id);
        }
    }
}
