﻿using System;
using System.Collections.Specialized;
using System.Security.Permissions;
using Microsoft.SharePoint;
using Microsoft.SharePoint.Utilities;
using System.Text;
using Microsoft.SharePoint.Workflow;


namespace LTI.CabsManagement.VehicleDispatchList.MailEvent
{
    /// <summary>
    /// List Item Events
    /// </summary>
    public class MailEvent : SPItemEventReceiver
    {
        /// <summary>
        /// An item was updated.
        /// </summary>
        public override void ItemUpdated(SPItemEventProperties properties)
        {
            base.ItemUpdated(properties);
            if (properties.ListTitle == "VehicleDispatchList")
            {
              
                SPList list = properties.Web.Lists["VehicleDispatchList"];
                SPListItem item = list.GetItemById(properties.ListItemId);
               
                

                if (item["DespatchStatus"].ToString() == "Cab Allocated")
                {
                    try
                    {

                        using (SPSite Site = new SPSite("http://cabreq.trg11.int")) //Site collection URL
                        {
                            using (SPWeb web = Site.RootWeb) //Subsite URL
                            {
                                if (!SPUtility.IsEmailServerSet(web))
                                {
                                    return;
                                }

                                StringDictionary headers = new StringDictionary();


                                headers.Add("from", "Vehicle Dispatcher");
                                headers.Add("to", item["Requestedby"].ToString());
                                
                                headers.Add("subject", "Cab Allocated.");
                                headers.Add("fAppendHtmlTag", "True"); //To enable HTML format

                                StringBuilder strMessage = new StringBuilder();
                                strMessage.Append("Message from Dispatcher:");

                                strMessage.Append(
                                    "<span style='color:red;'> Your ride has been booked. </span>");
                                SPUtility.SendEmail(web, headers, strMessage.ToString());



                            }
                        }
                    }
                    catch (Exception ex)
                    {
                    }
                }
                else if (item["DespatchStatus"].ToString() == "CabNotAvailable")
                    {
                        try
                        {

                            using (SPSite Site = new SPSite("http://cabreq.trg11.int")) //Site collection URL
                            {
                                using (SPWeb web = Site.RootWeb) //Subsite URL
                                {
                                    if (!SPUtility.IsEmailServerSet(web))
                                    {
                                        return;
                                    }

                                    StringDictionary headers = new StringDictionary();


                                    headers.Add("from", "Vehicle Dispatcher");
                                    headers.Add("to", item["Requestedby"].ToString());
                                    headers.Add("cc", item["Managername"].ToString());
                                    headers.Add("subject", "Cab not available.");
                                    headers.Add("fAppendHtmlTag", "True"); //To enable HTML format

                                    StringBuilder strMessage = new StringBuilder();
                                    strMessage.Append("Message from Dispatcher:");

                                    strMessage.Append(
                                        "<span style='color:red;'> Your quota for this month has reached.No cab is allocated. </span>");
                                    SPUtility.SendEmail(web, headers, strMessage.ToString());



                                }
                            }
                        }
                        catch (Exception ex)
                        {
                        }
                    }

                }
            }

        }


    }
