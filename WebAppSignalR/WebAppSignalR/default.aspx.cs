using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.AspNet.SignalR.Client;
using System.Net.Http;

namespace WebAppSignalR
{
    public partial class _default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            InitalProxies("PdfHub");
        }

        private String ClientId { get; set; }
        private IHubProxy HubProxy { get; set; }
        private string ServerURI
        {
            get
            {
                // return ConfigurationManager.AppSettings["ServerURI"];
                return Request.Url.Authority + "/SignalR/Hubs";
            }
        }

        private HubConnection Connection { get; set; }

        public void InitalProxies(string hubName)
        {
            //// Response.Redirect(ServerURI);
            //Connection = new HubConnection(ServerURI);
            //// Connection.Closed += Connection_Closed;
            //// Connection.Error += Connection_Error;
            //HubProxy = Connection.CreateHubProxy(hubName);
            //Connection.Start();
            //try
            //{
            //   // .Wait();


            //}
            //catch (HttpRequestException)
            //{
            //    return;
            //}
        }
    }
}