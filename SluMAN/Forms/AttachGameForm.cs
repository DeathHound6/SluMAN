using System.Net;
using System.Reflection;
using RacMAN.API;
using DarkModeForms;

namespace RacMAN.Forms;
public partial class AttachGameForm : Form
{
    Racman state;
    public APIType apiType = APIType.None;
    public string BoxText => textBox1.Text;

    private DarkModeCS dm = null;

    public AttachGameForm(Racman state)
    {
        InitializeComponent();
        dm = new DarkModeCS(this)
        {
            //[Optional] Choose your preferred color mode here:
            ColorMode = DarkModeCS.DisplayMode.SystemDefault
        };
        versionLabel.Text = $"v{Assembly.GetEntryAssembly()!.GetName().Version}";
        textBox1.Text = state.Settings.RatchetronIP;
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
        state.Settings.RatchetronIP = textBox1.Text;
        state.SaveSettings();
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
