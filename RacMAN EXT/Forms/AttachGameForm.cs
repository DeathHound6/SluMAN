﻿using System.Net;
using RacMAN.API;

namespace RacMAN.Forms;
public partial class AttachGameForm : Form
{
    public APIType apiType = APIType.None;
    public string BoxText => textBox1.Text;

    public AttachGameForm()
    {
        InitializeComponent();

        comboBox1.SelectedIndex = 0;
    }

    private void continueButton_Click(object sender, EventArgs e)
    {
        this.apiType = APIType.None;

        this.Hide();
    }

    private void attachButton_Click(object sender, EventArgs e)
    {
        Connect();
    }

    private void Connect()
    {
        switch (this.comboBox1.SelectedIndex)
        {
            case 0:
                this.apiType = APIType.PS3;
                break;
            case 1:
                this.apiType = APIType.RPCS3;
                break;
            case 2:
                this.apiType = APIType.PCSX2;
                break;
        }

        this.Hide();
    }

    private void comboBox1_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (comboBox1.SelectedIndex != 1)
        {
            textBox1.Enabled = true;
        }
        else
        {
            textBox1.Enabled = false;
        }

        if (comboBox1.SelectedIndex == 2)
        {
            label3.Text = "Slot:";
            textBox1.Text = "28011";
        }
        else
        {
            label3.Text = "IP Address:";
            textBox1.Text = "";
        }
    }

    private void textBox1_KeyDown(object sender, KeyEventArgs e)
    {
        if (e.KeyCode == Keys.Enter)
        {
            Connect();
        }
    }
}
