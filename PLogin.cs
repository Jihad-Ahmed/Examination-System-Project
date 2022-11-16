using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Data.SqlClient;


namespace WinFormsApp1
{
    public partial class PLogin : Form
    {
        public PLogin()
        {
            InitializeComponent();
        }
        SqlConnection conn1 = new SqlConnection(@"Data Source=.;Initial Catalog=Project;Integrated Security=True");
        private void button2_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            if (textBox2.Text == "admin" && textBox1.Text == "1234")
            {
                Questions2 q1 = new Questions2();
                q1.Show();
                this.Hide();
            }
            else
            {
                MessageBox.Show("the user name or the password you entered is inncorrect ");
                textBox1.Clear();
                textBox2.Clear();
                textBox2.Focus();
            }
        }

        private void textBox2_TextChanged(object sender, EventArgs e)
        {

        }

        private void textBox1_TextChanged(object sender, EventArgs e)
        {

        }

        private void PLogin_Load(object sender, EventArgs e)
        {

        }

        private void button3_Click(object sender, EventArgs e)
        {
            textBox1.Clear();
            textBox2.Clear();
            textBox2.Focus();
        }
    }
}
