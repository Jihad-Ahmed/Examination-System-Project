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
    public partial class StLogin : Form
    {
        public StLogin()
        {
            InitializeComponent();
        }
        SqlConnection conn = new SqlConnection(@"Data Source=.;Initial Catalog=Project;Integrated Security=True");

        private void button2_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void StLogin_Load(object sender, EventArgs e)
        {

        }

        private void button1_Click(object sender, EventArgs e)
        {
            string St_Email, St_Password;
            St_Email = textBox2.Text;
            St_Password = textBox1.Text;
            try
            {
                string querry = "SELECT * FROM Students WHERE St_Email='"+ textBox2.Text + "'AND St_Password='"+ textBox1.Text + "'";
                SqlDataAdapter sda = new SqlDataAdapter(querry, conn);
                DataTable dtable = new DataTable();
                sda.Fill(dtable);
                if (dtable.Rows.Count > 0)
                {
                    St_Email = textBox2.Text;
                    St_Password = textBox1.Text;
                    Courses e1=new Courses();
                    e1.Show();
                }
                else
                {
                    MessageBox.Show("Invalid login","Error",MessageBoxButtons.OK,MessageBoxIcon.Error);
                    textBox1.Clear();
                    textBox2.Clear();
                    textBox2.Focus();

                }
            }
            catch
            {
                MessageBox.Show("Error");
            }
            finally
            {
                conn.Close();
            }
        }

        private void textBox2_TextChanged(object sender, EventArgs e)
        {

        }

        private void textBox1_TextChanged(object sender, EventArgs e)
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
