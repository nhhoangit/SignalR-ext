using IHubProvider;
using Microsoft.AspNet.SignalR;
using Microsoft.AspNet.SignalR.Hubs;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Notification

{
    [HubName("NotificationHub")]
    public class NotificationHub:BaseHub
    {
        public NotificationHub():base()
        {

        }
     public void SendNotification(string name, string message)
        {

            Clients.Caller.broadcastNotification(name, message);

        }
     
    }
   
}
