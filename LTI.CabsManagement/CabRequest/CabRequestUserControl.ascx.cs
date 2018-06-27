using System;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Collections.Generic;
using Microsoft.SharePoint;

namespace LTI.CabsManagement.CabRequest
{
    public partial class CabRequestUserControl : UserControl
    {
        List<string> OfficeList = new List<string>();
        List<string> HomeList = new List<string>();
        protected void Page_Load(object sender, EventArgs e)
        {
            HomeList.Add("aavadi");
            HomeList.Add("adayar");
            HomeList.Add("ambattur");
            HomeList.Add("chengalpattu");
            HomeList.Add("kelambakkam");
            HomeList.Add("nungambakkam");
            HomeList.Add("perungulathur");
            HomeList.Add("porur");
            HomeList.Add("thambaram");
            HomeList.Add("vandaloor");

            OfficeList.Add("Block4");
            OfficeList.Add("Block9");
            OfficeList.Add("Block10");
            OfficeList.Add("DLFLTI");
            OfficeList.Add("DLFMainBlock");
            ddlPickUpLoc.Items.Clear();
            ddlDropLoc.Items.Clear();
            for (int i = 0; i < OfficeList.Count; i++)
                ddlPickUpLoc.Items.Add(OfficeList[i]);
            for (int i = 0; i < HomeList.Count; i++)
                ddlDropLoc.Items.Add(HomeList[i]);



        }
        protected void ddlTripType_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlTripType.SelectedItem.ToString() == "Office to Home")
            {
                ddlPickUpLoc.Items.Clear();
                ddlDropLoc.Items.Clear();
                for (int i = 0; i < OfficeList.Count; i++)
                    ddlPickUpLoc.Items.Add(OfficeList[i]);
                for (int i = 0; i < HomeList.Count; i++)
                    ddlDropLoc.Items.Add(HomeList[i]);
            }

            if (ddlTripType.SelectedItem.ToString() == "Home to Office")
            {
                ddlPickUpLoc.Items.Clear();
                ddlDropLoc.Items.Clear();
                for (int i = 0; i < HomeList.Count; i++)
                    ddlPickUpLoc.Items.Add(HomeList[i]);
                for (int i = 0; i < OfficeList.Count; i++)
                    ddlDropLoc.Items.Add(OfficeList[i]);
            }
        }
        protected void btnRequest_Click(object sender, EventArgs e)
        {

            lbError.Text = "";
            SPSite site = new SPSite("http://cabreq.trg11.int/");
            SPWeb web = site.RootWeb;
            SPUserCollection uc = web.AllUsers;
            int ch = 0;

            foreach (SPUser user in uc)
            {

                if (txtManName.Text == user.Name)
                {
                    ch = 1;
                    break;
                }
            }

            if (ch == 0)
                lbman.Text = "Please enter a valid manager name";
            else
            {
                DateTime minTime = DateTime.Now.AddHours(2);
                DateTime maxTime = DateTime.Now.AddHours(24);
                if (PickUpTime.SelectedDate < DateTime.Now)
                    lbError.Text = "Selected date or time is not valid as it before Current date or time";

                else if (PickUpTime.SelectedDate < minTime)
                    lbError.Text = "Pick up Time should be not less than 2 hours from Current Time";
                else if (PickUpTime.SelectedDate > maxTime)
                    lbError.Text = "Pick up Time should not be more than 24 hours from Current Time";
                else
                {

                    SPList list = web.Lists["CabRequestList"];
                    SPListItem item = list.Items.Add();
                    item["Requestedby"] = txtName.Text;
                    item["TripType"] = ddlTripType.SelectedItem;
                    item["PickupLocation"] = ddlPickUpLoc.SelectedItem;
                    item["DropLocation"] = ddlDropLoc.SelectedItem;
                    item["HomeAddress"] = txtHomeAdd.Text;
                    item["PickupTime"] = PickUpTime.SelectedDate;
                  item["Managername"] = txtManName.Text;
                    item["ContactPhone"] = txtConNNum.Text;
                    item["Notes"] = txtNotes.Text;

                  

                    this.Message();
                    item.Update();



                    //Response.Redirect(Request.Url.AbsoluteUri);
                }
            }
        }
        protected void PickUpTime_DataBinding(object sender, EventArgs e)
        {

        }

        protected void Message()
        {
            string message = "Your cab request has been sent for approval.";
            string script = "window.onload = function(){ alert('";
            script += message;
            script += "');";
            script += "window.location = '";
            script += Request.Url.AbsoluteUri;
            script += "'; }";
            Page.ClientScript.RegisterStartupScript(this.GetType(), "SuccessMessage", script, true);

        }
    }
}
