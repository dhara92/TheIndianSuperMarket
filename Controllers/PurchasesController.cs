﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using TheIndianSuperMarket.Models;

namespace TheIndianSuperMarket.Controllers
{
    public class PurchasesController : Controller
    {
        private readonly TheIndianMarketContext _context;

        public PurchasesController(TheIndianMarketContext context)
        {
            _context = context;
        }

        // GET: Purchases
        public async Task<IActionResult> Index()
        {
            var theIndianMarketContext = _context.Purchases.Include(p => p.Customer).Include(p => p.Product);
            return View(await theIndianMarketContext.ToListAsync());
        }

        // GET: Purchases/Details/5
        public async Task<IActionResult> Details(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var purchases = await _context.Purchases
                .Include(p => p.Customer)
                .Include(p => p.Product)
                .FirstOrDefaultAsync(m => m.TransactionId == id);
            if (purchases == null)
            {
                return NotFound();
            }

            return View(purchases);
        }

        // GET: Purchases/Create
        public IActionResult Create()
        {
            ViewData["CustomerId"] = new SelectList(_context.Customers, "CustomerId", "Password");
            ViewData["ProductId"] = new SelectList(_context.Products, "ProductId", "CostUnit");
            return View();
        }

        // POST: Purchases/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("TransactionId,ProductId,Quantity,CustomerId,PurchaseDate,Total")] Purchases purchases)
        {
            if (ModelState.IsValid)
            {
                _context.Add(purchases);
                await _context.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }
            ViewData["CustomerId"] = new SelectList(_context.Customers, "CustomerId", "Password", purchases.CustomerId);
            ViewData["ProductId"] = new SelectList(_context.Products, "ProductId", "CostUnit", purchases.ProductId);
            return View(purchases);
        }

        // GET: Purchases/Edit/5
        public async Task<IActionResult> Edit(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var purchases = await _context.Purchases.FindAsync(id);
            if (purchases == null)
            {
                return NotFound();
            }
            ViewData["CustomerId"] = new SelectList(_context.Customers, "CustomerId", "Password", purchases.CustomerId);
            ViewData["ProductId"] = new SelectList(_context.Products, "ProductId", "CostUnit", purchases.ProductId);
            return View(purchases);
        }

        // POST: Purchases/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id, [Bind("TransactionId,ProductId,Quantity,CustomerId,PurchaseDate,Total")] Purchases purchases)
        {
            if (id != purchases.TransactionId)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    _context.Update(purchases);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!PurchasesExists(purchases.TransactionId))
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
            ViewData["CustomerId"] = new SelectList(_context.Customers, "CustomerId", "Password", purchases.CustomerId);
            ViewData["ProductId"] = new SelectList(_context.Products, "ProductId", "CostUnit", purchases.ProductId);
            return View(purchases);
        }

        // GET: Purchases/Delete/5
        public async Task<IActionResult> Delete(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var purchases = await _context.Purchases
                .Include(p => p.Customer)
                .Include(p => p.Product)
                .FirstOrDefaultAsync(m => m.TransactionId == id);
            if (purchases == null)
            {
                return NotFound();
            }

            return View(purchases);
        }

        // POST: Purchases/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            var purchases = await _context.Purchases.FindAsync(id);
            _context.Purchases.Remove(purchases);
            await _context.SaveChangesAsync();
            return RedirectToAction(nameof(Index));
        }

        private bool PurchasesExists(int id)
        {
            return _context.Purchases.Any(e => e.TransactionId == id);
        }
    }
}
