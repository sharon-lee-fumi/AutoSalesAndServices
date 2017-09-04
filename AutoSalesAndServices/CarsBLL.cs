/*
 * author: Xiaowen Li
 * Car's business logic layer model, return object to user interface
 */


using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace AutoSalesAndServices
{
    public class CarsBLL
    {
        // private fields
        private CarsDAL carDAL;

        //constructor
        public CarsBLL()
        {
            carDAL = new CarsDAL();
        }

        // properties that correspond to the table columns
        public int Serial { get; set; }
        public string CustomerName { get; set; }
        public string Make { get; set; }
        public string Model { get; set; }
        public string Year { get; set; }
        public string Color { get; set; }
        public string PurchaseDate { get; set; }
        public string PurchaseFrom { get; set; }
        public decimal PurchaseCost { get; set; }
        public decimal ListPrice { get; set; }

        // methods

        /// <summary>
        /// Get a list of cars from car's DAL
        /// </summary>
        public List<CarsBLL> GetAllCars()
        {
            return carDAL.GetAllCars();
        }

        /// <summary>
        /// Get a car by serial number from car's DAL
        /// </summary>
        public CarsBLL GetCarBySerial(int serial)
        {
            return carDAL.GetCarBySerial(serial);
        }

        /// <summary>
        /// Get a list of cars bases on options from car's DAL
        /// </summary>
        public List<CarsBLL> GetCarByOptions(int serial, string make, string model, string year, string color)
        {
            return carDAL.GetCarByOptions(serial, make, model, year, color);
        }

        /// <summary>
        /// Update a car
        /// </summary>
        public bool UpdateCar(CarsBLL car)
        {
            return carDAL.UpdateCar(car);
        }

        /// <summary>
        /// Delete a car
        /// </summary>
        public bool DeleteCar(int serial)
        {
            return carDAL.DeleteCar(serial);
        }

        /// <summary>
        /// Insert a car
        /// </summary>
        public bool InsertCar(CarsBLL car)
        {
            return carDAL.InsertCar(car);
        }
    }
}