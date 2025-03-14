using System.Net;
using System.Reflection;
using RacMAN.API;

namespace RacMAN.Forms;
public partial class AttachGameForm : Form
{
    Racman state;
    public APIType apiType = APIType.None;
    public string BoxText => textBox1.Text;

    public AttachGameForm(Racman state)
    {
        InitializeComponent();
        versionLabel.Text = $"v{Assembly.GetEntryAssembly()!.GetName().Version}";
        this.state = state;
    }


    private void attachButton_ClickRPCS3(object sender, EventArgs e)
    {
        ConnectRPCS3();
    }

    private void attachButton_ClickPS3(object sender, EventArgs e)
    {
        ConnectPS3();
    }


    private void ConnectPS3()
    {
        this.apiType = APIType.PS3;
        this.Hide();
    }

    private void ConnectRPCS3()
    {
        this.apiType = APIType.RPCS3;
        this.Hide();
    }

    private void textBox1_KeyDown(object sender, KeyEventArgs e)
    {
        if (e.KeyCode == Keys.Enter)
        {
            ConnectPS3();
        }
    }

    private void AttachGameForm_Shown(object sender, EventArgs e)
    {
        if ((bool)state.Settings.AutoConnect!) ConnectPS3();
    }

    private void AttachGameForm_Load(object sender, EventArgs e)
    {

    }
}
