/*
 * author: Xiaowen Li
 * presentation layer Add a car into database 
 */

using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AutoSalesAndServices
{
    public partial class AddCar : System.Web.UI.Page
    {
        // declare a business object
        private CarsBLL bll;

        // constructor
        public AddCar()
        {
            bll = new CarsBLL();
        }

        /// <summary>
        /// when page load, get auto generated serial number and date
        /// </summary>
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // get car's serial number based on existing car list
                List<CarsBLL> listCars = bll.GetAllCars();
                if (listCars != null)
                {
                    lblSerial.Text = (listCars.Last().Serial + 1).ToString(); 
                    lblPurchaseDate.Text =  DateTime.Today.ToString("d");
                }
                else
                {
                    lblSerial.Text = "1";
                    lblPurchaseDate.Text = DateTime.Today.ToString("d");
                }
            }
        }

        /// <summary>
        /// Save a car based on inputs, proform validation check, then go back to cars page and get a list of cars 
        /// </summary>
        protected void lbtnSaveCar_Click(object sender, EventArgs e)
        {
            if (Page.IsValid) // if any validation control failed, this will be false
            {
                // inserts data into database table
                CarsBLL car = new CarsBLL();

                car.Serial = int.Parse(lblSerial.Text);
                car.CustomerName = "(Instock)";
                car.Make = txtMake.Text;
                car.Model = txtModel.Text;
                car.Year = txtYear.Text;
                car.Color = txtColor.Text;
                car.PurchaseDate = lblPurchaseDate.Text;
                car.PurchaseFrom = txtPurchasesName.Text;
                car.PurchaseCost = decimal.Parse(txtPurchaseCost.Text);
                car.ListPrice = decimal.Parse(txtPrice.Text);

                if (bll.InsertCar(car))
                {
                    Session["msg"] = "Car " + car.Serial + " added";
                    Response.Redirect("~/Cars.aspx");
                }
            }
            else
            {
                lblMessage.Text = "Validation failed. Please try again";
                lblMessage.ForeColor = System.Drawing.Color.Red;
            }
        }
        
    }
}