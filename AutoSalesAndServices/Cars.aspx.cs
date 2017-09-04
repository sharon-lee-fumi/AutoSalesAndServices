/*
 * author: Xiaowen Li
 * Car's presentation layer, show all cars
 */

using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AutoSalesAndServices
{
    public partial class Cars : System.Web.UI.Page
    {
        // declare a business object
        private CarsBLL bll;

        // constructor
        public Cars()
        {
            bll = new CarsBLL();
        }

        /// <summary>
        /// when page load, shows a list of cars and prompts search options
        /// </summary>
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["msg"] != null)
                {
                    lblMessage.Text = Session["msg"].ToString();
                    lblMessage.ForeColor = System.Drawing.Color.Green;
                    Session.Clear();
                }
                else
                {
                    lblMessage.Text = "Please enter Serial Number, Make, Model, Year OR Color to search a car";
                    lblMessage.ForeColor = System.Drawing.Color.Green;
                    grdCars.Visible = true;
                    grdCarOptions.Visible = false;
                }               
            }
        }

        /// <summary>
        /// click search a car based on input option, proform validation check and get a list of cars
        /// </summary>
        protected void btnSearchCar_Click(object sender, EventArgs e)
        {
            if (txtSerialNum.Text.Length == 0 && txtMake.Text.Length == 0 && txtModel.Text.Length == 0 && txtYear.Text.Length == 0 && txtColor.Text.Length == 0)
            {
                lblMessage.Text = "Please enter Sales Invoice Id, Customer Name OR Serial Number to search a sales invoice";
                lblMessage.ForeColor = System.Drawing.Color.Red;
                grdCars.Visible = true;
                grdCarOptions.Visible = false;
            }
            else
            {
                int serial;
                if (txtSerialNum.Text.Length == 0)
                {
                    serial = 0;
                }
                else
                {
                    serial = int.Parse(txtSerialNum.Text);
                }
                string make = txtMake.Text;
                string model = txtModel.Text;
                string year = txtYear.Text;
                string color = txtColor.Text;

                List<CarsBLL> car = bll.GetCarByOptions(serial, make, model, year, color);

                if (car != null)
                {
                    grdCars.Visible = false;
                    grdCarOptions.Visible = true;

                    lblMessage.Text = "Car found";
                    lblMessage.ForeColor = System.Drawing.Color.Green;
                }
                else
                {
                    grdCars.Visible = true;
                    grdCarOptions.Visible = false;

                    lblMessage.Text = "Car not found";
                    lblMessage.ForeColor = System.Drawing.Color.Red;
                }
            }
        }
        
    }
}