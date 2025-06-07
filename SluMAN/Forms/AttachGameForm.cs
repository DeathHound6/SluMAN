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
    public int FTPPort => int.Parse(textBox2.Text ?? "21"); // Default FTP port is 21 if not set

    private DarkModeCS dm = null;

    public AttachGameForm(Racman state)
    {
        InitializeComponent(state);
        dm = new DarkModeCS(this)
        {
            //[Optional] Choose your preferred color mode here:
            ColorMode = DarkModeCS.DisplayMode.SystemDefault
        };
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

    private void textbox2_KeyDown(object sender, KeyEventArgs e)
    {
        // Allow only number keys, control keys (e.g., backspace), and navigation keys
        bool isNumber = ((e.KeyCode >= Keys.D0 && e.KeyCode <= Keys.D9) ||
                        (e.KeyCode >= Keys.NumPad0 && e.KeyCode <= Keys.NumPad9)) && !e.Shift;
        bool isControl = e.KeyCode == Keys.Back || e.KeyCode == Keys.Delete ||
                         e.KeyCode == Keys.Left || e.KeyCode == Keys.Right ||
                         e.KeyCode == Keys.Enter;

        if (!isNumber && !isControl)
        {
            e.SuppressKeyPress = true; // Prevents non-numeric input
            return;
        }

        if (e.KeyCode == Keys.Enter)
        {
            if (!int.TryParse(textBox2.Text, out int port) || port < 1 || port > 65535)
            {
                e.SuppressKeyPress = true;
                MessageBox.Show("Please enter a valid port number (1-65535).", "Invalid Port", MessageBoxButtons.OK, MessageBoxIcon.Error);
                return;
            }
            textBox1_KeyDown(sender, e);
        }
    }
}
