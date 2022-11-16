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
    public partial class Courses : Form
    {
        ProjectContext db = new ProjectContext();
        public Courses()
        {
            InitializeComponent();
        }

        

        private void button1_Click(object sender, EventArgs e)
        {
            this.Close();

        }

        private void Courses_Load(object sender, EventArgs e)
        {
            List<Course> c1= db.Course.ToList();
            dataGridView1.DataSource = c1;
        }

        private void dataGridView1_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

        }
    }
}
