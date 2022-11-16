namespace WinFormsApp1
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void button3_Click(object sender, EventArgs e)
        {
            Reports r1=new Reports();
            r1.Show();
            this.Hide();

        }

        private void button2_Click(object sender, EventArgs e)
        {
            PLogin p1=new PLogin();
            p1.Show();
            this.Hide();

        }

        private void button1_Click(object sender, EventArgs e)
        {
            StLogin s1=new StLogin();
            s1.Show();
            this.Hide();

        }

        private void button2_Click_1(object sender, EventArgs e)
        {
            PLogin p1 = new PLogin();
            p1.Show();
            this.Hide();
        }

        private void button1_Click_1(object sender, EventArgs e)
        {
            StLogin s1 = new StLogin();
            s1.Show();
            this.Hide();
        }

        private void button3_Click_1(object sender, EventArgs e)
        {
            Reports r1 = new Reports();
            r1.Show();
            this.Hide();
        }
    }
}