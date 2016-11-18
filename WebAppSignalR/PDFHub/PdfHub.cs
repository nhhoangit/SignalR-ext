using IHubProvider;
using Microsoft.AspNet.SignalR;
using Microsoft.AspNet.SignalR.Hubs;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PDFHub
{
    [HubName("PdfHub")]
    public class PdfHub:BaseHub
    {
        public PdfHub():base()
        {
           // var context = GlobalHost.ConnectionManager.GetHubContext<PdfHub>();

        }
        public void SendMessage(string name, string message)
        {

            Clients.All.broadcastMessage(name, message);

        }
    }
}
