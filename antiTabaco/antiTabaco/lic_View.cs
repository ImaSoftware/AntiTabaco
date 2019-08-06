using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Sys_LicGen
{
    public partial class lic_View : Form
    {
        string htmlBody;
        public lic_View( )
        {
            InitializeComponent();
        }
        public lic_View(string _htmlBody, string htmStr)
        {
            InitializeComponent();
            DisplayHtml(htmStr);
            htmlBody = _htmlBody;
        }
        private void DisplayHtml(string html)
        {
            wBLic.Navigate("about:blank");
            try
            {
                if (wBLic.Document != null)
                {
                    wBLic.Document.Write(string.Empty);
                }
            }
            catch (Exception e)
            { } // do nothing with this
            wBLic.DocumentText = html;
        }

        private void btnSend_Click(object sender, EventArgs e)
        {
            string[] mails = txtMails.Text.Split(';');
            foreach (string e_mail in mails)
            {
                if (!mailSender.IsValidEmail(e_mail.Trim()))
                {
                    MessageBox.Show(String.Format("El correo {0} no es un correo con formato válido. Revise por favor", e_mail));
                    return;
                }
            }
            int cont = 0;
            this.Cursor = Cursors.WaitCursor;
            foreach (string e_mail in mails)
            {
                string tr_mail = e_mail.Trim();
                Properties.Settings AppConf = Properties.Settings.Default;
                mailSender eSend = new mailSender(AppConf.mail_Usr,
                    AppConf.mail_Pwd, AppConf.smtpServer, AppConf.Puerto, AppConf.SSL);

                System.Net.Mail.Attachment adj = null;
                
                string pPDF = Environment.CurrentDirectory + "\\licencia.pdf";
                if (LicGen.createPDF(wBLic.DocumentText, ref pPDF))
                {
                    adj = new System.Net.Mail.Attachment(pPDF);
                }

                bool sent =  eSend.EnviarMensaje(tr_mail, htmlBody, "Licencia Producto Syscompsa S.A.",adj);
                if (sent)
                {
                    cont += 1;
                }
            }
            this.Cursor = Cursors.Default;
            if (cont > 0) {
                MessageBox.Show(String.Format("{0} enviado(s), {1} errore(s) durante el envío", Convert.ToString(cont), Convert.ToString(mails.Length - cont)));
            }
        }
    }
}
