/*
 * author: Xiaowen Li
 * Car's database access layer model, return object to business logic layer
 */


using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

using AutoSalesAndServices.dsAutoSalesAndServicesTableAdapters;

namespace AutoSalesAndServices
{    
    public class CarsDAL
    {
        // private fields
        private CarsTableAdapter adpCars;
        private dsAutoSalesAndServices.CarsDataTable tblCars;
        private List<CarsBLL> listCars;

        // constructor
        public CarsDAL()
        {
            adpCars = new CarsTableAdapter();
            tblCars = new dsAutoSalesAndServices.CarsDataTable();
        }

        // public methods

        /// <summary>
        /// Get all cars and return a car list to BLL from database
        /// </summary>
        public List<CarsBLL> GetAllCars()
        {
            adpCars.Fill(tblCars);
            listCars = null;

            // if table has rows
            if (tblCars.Count > 0)
            {
                // instantiate the List<>
                listCars = new List<CarsBLL>();

                // loop through the table
                foreach (var row in tblCars)
                {
                    CarsBLL car = new CarsBLL();

                    // assign the values from row to Car Business object
                    car.Serial = row.Serial;
                    car.CustomerName = row.CustomerName;
                    car.Make = row.Make;
                    car.Model = row.Model;
                    car.Year = row.Year;
                    car.Color = row.Color;
                    car.PurchaseDate = row.PurchaseDate;
                    car.PurchaseFrom = row.PurchaseFrom;
                    car.PurchaseCost = row.PurchaseCost;
                    car.ListPrice = row.ListPrice;

                    listCars.Add(car);
                }
            }

            return listCars;
        }

        /// <summary>
        /// Get a car by serial number, return a car object
        /// </summary>
        public CarsBLL GetCarBySerial(int serial)
        {
            // fetch a row from the database
            int rowsFetched = adpCars.FillBySerial(tblCars, serial);
            CarsBLL car = null;

            if (rowsFetched == 1)
            {
                car = new CarsBLL();
                var row = tblCars[0];

                car.Serial = row.Serial;
                car.CustomerName = row.CustomerName;
                car.Make = row.Make;
                car.Model = row.Model;
                car.Year = row.Year;
                car.Color = row.Color;
                car.PurchaseDate = row.PurchaseDate;
                car.PurchaseFrom = row.PurchaseFrom;
                car.PurchaseCost = row.PurchaseCost;
                car.ListPrice = row.ListPrice;
            }

            return car;
        }

        /// <summary>
        /// Get cars bases on options and return a car list
        /// </summary>
        public List<CarsBLL> GetCarByOptions(int serial, string make, string model, string year, string color)
        {
            adpCars.FillByOptions(tblCars, serial, make, model, year, color);
            listCars = null;

            // if table has rows
            if (tblCars.Count > 0)
            {
                // instantiate the List<>
                listCars = new List<CarsBLL>();

                // loop through the table
                foreach (var row in tblCars)
                {
                    CarsBLL car = new CarsBLL();

                    // assign the values from row to Car Business object
                    car.Serial = row.Serial;
                    car.CustomerName = row.CustomerName;
                    car.Make = row.Make;
                    car.Model = row.Model;
                    car.Year = row.Year;
                    car.Color = row.Color;
                    car.PurchaseDate = row.PurchaseDate;
                    car.PurchaseFrom = row.PurchaseFrom;
                    car.PurchaseCost = row.PurchaseCost;
                    car.ListPrice = row.ListPrice;

                    listCars.Add(car);
                }
            }

            return listCars;
        }

        /// <summary>
        /// Update a car in the database
        /// </summary>
        public bool UpdateCar(CarsBLL car)
        {
            int result = adpCars.Update(car.CustomerName, car.Make, car.Model, car.Year, car.Color, car.PurchaseDate, car.PurchaseFrom, car.PurchaseCost, car.ListPrice, car.Serial);

            return result == 1;
        }

        /// <summary>
        /// Delete a car from the database
        /// </summary>
        public bool DeleteCar(int Serial)
        {
            int result = adpCars.Delete(Serial);

            return result == 1;
        }

        /// <summary>
        /// Insert a  car into the database
        /// </summary>
        public bool InsertCar(CarsBLL car)
        {
            int result = adpCars.Insert(car.Serial, car.CustomerName, car.Make, car.Model, car.Year, car.Color, car.PurchaseDate, car.PurchaseFrom, car.PurchaseCost, car.ListPrice);

            return result == 1;
        }
    }
}