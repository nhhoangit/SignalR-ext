using Notification;
using PDFHub;

namespace WebAppSignalR
{
    public class GeneralHub
    {
        private PdfHub _pdfHub;
        private NotificationHub _notifyHub;

       public GeneralHub(PdfHub pHub, NotificationHub nHub)
        {
            _pdfHub = pHub;
            _notifyHub = nHub;
        }
    }
}