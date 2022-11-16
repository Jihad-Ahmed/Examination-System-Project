﻿using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace WinFormsApp1
{
    public partial class R6 : Form
    {
        public R6()
        {
            InitializeComponent();
        }

        private void R6_Load(object sender, EventArgs e)
        {
            WebBrowser webBrowser = new WebBrowser();
            webBrowser.Dock = DockStyle.Fill;
            webBrowser.Width = this.Width;
            webBrowser.Height = this.Height;
            //webBrowser.Navigate(new Uri("https://www.google.com"));
            webBrowser.Url = new Uri("http://localhost/ReportServer/Pages/ReportViewer.aspx?%2fReport+Project1%2fStudent_AnswersR61&rs:Command=Render");
            webBrowser.ScrollBarsEnabled = true;
            webBrowser.Visible = true;
            webBrowser.ScriptErrorsSuppressed = true;
            this.Controls.Add(webBrowser);
        }
    }
}
