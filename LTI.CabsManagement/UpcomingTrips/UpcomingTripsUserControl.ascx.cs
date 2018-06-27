using System;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using Microsoft.SharePoint;
namespace LTI.CabsManagement.UpcomingTrips
{
    public partial class UpcomingTripsUserControl : UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
                try
                {
                    SPSite site = new SPSite("http://cabreq.trg12.int/");
                    SPWeb web = site.RootWeb;
                    SPList list = web.Lists["VehicleDispatchList"];
                    SPQuery q = new SPQuery();
                    q.Query = string.Format(@"<Where>
      <Eq>
         <FieldRef Name='DespatchStatus' />
         <Value Type='Choice'>Cab Allocated</Value>
      </Eq>
   </Where>
   <OrderBy>
      <FieldRef Name='StartDateandTime' Ascending='True' />
   </OrderBy>");
                    string[] pickuparr = { "Block4", "Block9", "Block10", "DLFLTI", "DLFMainBlock" };
                    SPListItemCollection items = list.GetItems(q);
                    foreach (SPListItem item in items)
                    {
                        foreach (string x in pickuparr)
                        {
                            if (item["PickupLocation"].ToString() == x)
                            {
                                if ((DateTime)item["StartDateandTime"] > DateTime.Now)
                                {
                                    var date = (DateTime)item["StartDateandTime"];
                                    if (date.Date == DateTime.Now.Date)
                                    {
                                        this.Label4.Text = date.ToLongDateString();
                                        this.Label1.Text += string.Format("{0:hh:mm:ss tt}", date) + "<br/>" + item["PickupLocation"] + "\tto\t" + item["DropLocation"] + "\t" + item["CabRegNo"] + "<br/><br/>";
                                    }
                                    if (date.Date == DateTime.Now.Date.Add(TimeSpan.FromDays(1)))
                                    {
                                        this.Label5.Text = date.Date.ToLongDateString();
                                        this.Label2.Text += string.Format("{0:hh:mm:ss tt}", date) + "<br/>" + item["PickupLocation"] + "\tto\t" + item["DropLocation"] + "\t" + item["CabRegNo"] + "<br/><br/>";

                                    }
                                }
                                break;
                            }
                        }
                    }

                }
                catch (Exception ex)
                {
                    Label1.Text = ex.Message;
                }
        }
    }
    
}
