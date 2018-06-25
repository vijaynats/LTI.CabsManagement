using System;
using System.Security.Permissions;
using Microsoft.SharePoint;
using Microsoft.SharePoint.Utilities;
using Microsoft.SharePoint.Workflow;

namespace CabReqInfo.List_instances.VehicleDispatchList.EventEmail
{
    /// <summary>
    /// List Item Events
    /// </summary>
    public class EventEmail : SPItemEventReceiver
    {
        /// <summary>
        /// An item is being updated.
        /// </summary>
        public override void ItemUpdating(SPItemEventProperties properties)
        {
            base.ItemUpdating(properties);
            
        }


    }
}