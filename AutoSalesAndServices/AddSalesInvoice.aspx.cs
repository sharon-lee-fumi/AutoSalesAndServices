/*
 * author: Xiaowen Li
 * presentation layer Add a Sales Invoice into database, and update car's customer name in the database
 */

using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace AutoSalesAndServices
{
    public partial class AddSalesInvoice : System.Web.UI.Page
    {
        // declare business object
        private SalesInvoicesBLL blls;
        private CarsBLL bllc;

        // constructor
        public AddSalesInvoice()
        {
            blls = new SalesInvoicesBLL();
            bllc = new CarsBLL();
        }

        /// <summary>
        /// when page load, get auto generated invoice Id and date
        /// </summary>
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // get invoice number based on existing sales invoices' list
                List<SalesInvoicesBLL> listSalesInvoices = blls.GetAllSalesInvoices();
                if (listSalesInvoices != null)
                {
                    lblSalesInvoiceId.Text = (listSalesInvoices.Last().InvoiceId + 1).ToString();
                    lblSalesDate.Text = DateTime.Today.ToString("d");
                }
                else
                {
                    lblSalesInvoiceId.Text = "1";
                    lblSalesDate.Text = DateTime.Today.ToString("d");
                }
            }
        }

        /// <summary>
        /// when user input car's serial number, get list price from database as net price, calculate tax and total price
        /// </summary>
        protected void txtSerial_TextChanged(object sender, EventArgs e)
        {
            int result;
            int num;
            CarsBLL car;
            if (int.TryParse(txtSerial.Text, out result))
            {

                num = int.Parse(txtSerial.Text);

                car = bllc.GetCarBySerial(num);

                if (car != null)
                {
                    lblMessage.Text = "Car is Found: " + car.Make + " " + car.Model + " " + car.Year + " " + car.Color;
                    lblMessage.ForeColor = System.Drawing.Color.Green;
                    lblNetPrice.Text = car.ListPrice.ToString();
                    lblTax.Text = (double.Parse(lblNetPrice.Text) * 0.13).ToString();
                    lblTotalPrice.Text = (double.Parse(lblNetPrice.Text) + double.Parse(lblTax.Text)).ToString();
                    lbtnSaveSalesInvoice.Enabled = true;
                }
                else
                {
                    lblMessage.Text = "Car does not exist. Please try again";
                    lblMessage.ForeColor = System.Drawing.Color.Red;
                    lblNetPrice.Text = "";
                    lblTax.Text = "";
                    lblTotalPrice.Text = "";
                    lbtnSaveSalesInvoice.Enabled = false;
                }
            }
            else
            {
                lblMessage.Text = "Please enter a integer as a Car's serial number. Please try again";
                lblMessage.ForeColor = System.Drawing.Color.Red;
                lblNetPrice.Text = "";
                lblTax.Text = "";
                lblTotalPrice.Text = "";
                lbtnSaveSalesInvoice.Enabled = false;
            }
        }

        /// <summary>
        /// Save a sales invoice based on inputs and update car's customer name, proform validation check, then go back to sales invoices page and get a list of sales invoices
        /// </summary>
        protected void lbtnSaveSalesInvoice_Click(object sender, EventArgs e)
        {
            if (Page.IsValid) // if any validation control failed, this will be false
            {
                SalesInvoicesBLL salesInvoice = new SalesInvoicesBLL();

                salesInvoice.InvoiceId = int.Parse(lblSalesInvoiceId.Text);
                salesInvoice.CustomerName = txtCustomerName.Text;
                salesInvoice.Serial = int.Parse(txtSerial.Text);
                salesInvoice.SalesDate = lblSalesDate.Text;
                salesInvoice.Salesman = txtSalesman.Text;
                salesInvoice.NetPrice = decimal.Parse(lblNetPrice.Text);
                salesInvoice.Tax = decimal.Parse(lblTax.Text);
                salesInvoice.TotalPrice = decimal.Parse(lblTotalPrice.Text);

                int num = int.Parse(txtSerial.Text);

                // get a car object by serial number and update car's customer name, then insert sals invoice into database
                CarsBLL car = bllc.GetCarBySerial(num);
                if (car != null)
                {
                    car.CustomerName = txtCustomerName.Text;
                    try
                    {                        
                        if (blls.InsertSalesInvoice(salesInvoice))
                        {
                            car.UpdateCar(car);
                            Session["msg"] = "Sales Invoice " + salesInvoice.InvoiceId + " added";
                            Response.Redirect("~/SalesInvoices.aspx");
                        }
                        else
                        {
                            lblMessage.Text = "Validation failed. Please try again";
                            lblMessage.ForeColor = System.Drawing.Color.Red;
                        }
                    }
                    catch (Exception ex)
                    {
                        lblMessage.Text = ex.Message;
                        lblMessage.ForeColor = System.Drawing.Color.Red;
                    }
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