using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using WinFormsApp1.Models;
namespace WinFormsApp1
{
    public partial class Questions2 : Form
    {
        ProjectContext db = new ProjectContext();
        public Questions2()
        {
            InitializeComponent();
        }

        private void button3_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            textBox1.Clear();
            
            textBox3.Clear();
            textBox4.Clear();
            
            textBox7.Clear();
            textBox8.Clear();
            textBox9.Clear();
            textBox3.Focus();
        }

        private void textBox1_TextChanged(object sender, EventArgs e)
        {

        }
        Questions q1 = new Questions();
        Q_Choises ch = new Q_Choises();

        private void button1_Click(object sender, EventArgs e)
        {

            q1.Q_Id = int.Parse(textBox2.Text);
            ch.Q_Id = int.Parse(textBox2.Text);
            q1.Q_Type = comboBox3.Text;
            q1.Q_Header = textBox3.Text;
            q1.Q_Model_Answer= textBox4.Text;
            q1.P_Id = int.Parse(comboBox2.Text);
            q1.Crs_id = int.Parse(comboBox1.Text);
            ch.CH_1 =textBox1.Text;
            ch.CH_2 = textBox7.Text;
            ch.CH_3 = textBox8.Text;
            ch.CH_4 = textBox9.Text;
            db.Questions.Add(q1);
            db.Q_Choises.Add(ch);
            db.SaveChanges();

        }

        private void textBox1_TextChanged_1(object sender, EventArgs e)
        {

        }

        private void comboBox1_SelectedIndexChanged(object sender, EventArgs e)
        {
            
        }
    }
}
