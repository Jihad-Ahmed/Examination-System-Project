using System;
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
    public partial class Reports : Form
    {
        public Reports()
        {
            InitializeComponent();
        }

        private void button7_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void Reports_Load(object sender, EventArgs e)
        {

        }

        private void button1_Click(object sender, EventArgs e)
        {
            R1 r1= new R1();
            r1.Show();
           
        }

        private void button2_Click(object sender, EventArgs e)
        {
            R2 r2= new R2();
            r2.Show();
        }

        private void button3_Click(object sender, EventArgs e)
        {
            R3 r3= new R3();
            r3.Show();
        }

        private void button4_Click(object sender, EventArgs e)
        {
            R4 r4= new R4();
            r4.Show();
        }

        private void button5_Click(object sender, EventArgs e)
        {
            R5 r5= new R5();
            r5.Show();
        }

        private void button6_Click(object sender, EventArgs e)
        {
            R6 r6= new R6();
            r6.Show();
        }
    }
}
