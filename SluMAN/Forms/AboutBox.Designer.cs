﻿namespace RacMAN.Forms;

partial class AboutBox
{
    /// <summary>
    /// Required designer variable.
    /// </summary>
    private System.ComponentModel.IContainer components = null;

    /// <summary>
    /// Clean up any resources being used.
    /// </summary>
    protected override void Dispose(bool disposing)
    {
        if (disposing && (components != null))
        {
            components.Dispose();
        }
        base.Dispose(disposing);
    }

    #region Windows Form Designer generated code

    /// <summary>
    /// Required method for Designer support - do not modify
    /// the contents of this method with the code editor.
    /// </summary>
    private void InitializeComponent()
    {
        System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(AboutBox));
        tableLayoutPanel = new TableLayoutPanel();
        logoPictureBox = new PictureBox();
        labelProductName = new Label();
        labelVersion = new Label();
        labelCopyright = new Label();
        labelCompanyName = new Label();
        okButton = new Button();
        tableLayoutPanel.SuspendLayout();
        ((System.ComponentModel.ISupportInitialize)logoPictureBox).BeginInit();
        SuspendLayout();
        // 
        // tableLayoutPanel
        // 
        tableLayoutPanel.ColumnCount = 2;
        tableLayoutPanel.ColumnStyles.Add(new ColumnStyle(SizeType.Percent, 33F));
        tableLayoutPanel.ColumnStyles.Add(new ColumnStyle(SizeType.Percent, 67F));
        tableLayoutPanel.Controls.Add(logoPictureBox, 0, 0);
        tableLayoutPanel.Controls.Add(labelProductName, 1, 0);
        tableLayoutPanel.Controls.Add(labelVersion, 1, 1);
        tableLayoutPanel.Controls.Add(labelCopyright, 1, 2);
        tableLayoutPanel.Controls.Add(labelCompanyName, 1, 3);
        tableLayoutPanel.Controls.Add(okButton, 1, 5);
        tableLayoutPanel.Dock = DockStyle.Fill;
        tableLayoutPanel.Location = new Point(10, 10);
        tableLayoutPanel.Margin = new Padding(4, 3, 4, 3);
        tableLayoutPanel.Name = "tableLayoutPanel";
        tableLayoutPanel.RowCount = 6;
        tableLayoutPanel.RowStyles.Add(new RowStyle(SizeType.Percent, 10F));
        tableLayoutPanel.RowStyles.Add(new RowStyle(SizeType.Percent, 10F));
        tableLayoutPanel.RowStyles.Add(new RowStyle(SizeType.Percent, 10F));
        tableLayoutPanel.RowStyles.Add(new RowStyle(SizeType.Percent, 57.0032578F));
        tableLayoutPanel.RowStyles.Add(new RowStyle(SizeType.Percent, 2.605863F));
        tableLayoutPanel.RowStyles.Add(new RowStyle(SizeType.Percent, 10F));
        tableLayoutPanel.RowStyles.Add(new RowStyle(SizeType.Absolute, 20F));
        tableLayoutPanel.RowStyles.Add(new RowStyle(SizeType.Absolute, 20F));
        tableLayoutPanel.Size = new Size(487, 307);
        tableLayoutPanel.TabIndex = 0;
        // 
        // logoPictureBox
        // 
        logoPictureBox.Dock = DockStyle.Fill;
        logoPictureBox.Image = (Image)resources.GetObject("logoPictureBox.Image");
        logoPictureBox.Location = new Point(4, 3);
        logoPictureBox.Margin = new Padding(4, 3, 4, 3);
        logoPictureBox.Name = "logoPictureBox";
        tableLayoutPanel.SetRowSpan(logoPictureBox, 6);
        logoPictureBox.Size = new Size(152, 301);
        logoPictureBox.SizeMode = PictureBoxSizeMode.Zoom;
        logoPictureBox.TabIndex = 12;
        logoPictureBox.TabStop = false;
        // 
        // labelProductName
        // 
        labelProductName.Dock = DockStyle.Fill;
        labelProductName.Location = new Point(167, 0);
        labelProductName.Margin = new Padding(7, 0, 4, 0);
        labelProductName.MaximumSize = new Size(0, 20);
        labelProductName.Name = "labelProductName";
        labelProductName.Size = new Size(316, 20);
        labelProductName.TabIndex = 19;
        labelProductName.Text = "SluMAN - Sly Cooper Practice Tool";
        labelProductName.TextAlign = ContentAlignment.MiddleLeft;
        labelProductName.Click += labelProductName_Click;
        // 
        // labelVersion
        // 
        labelVersion.Dock = DockStyle.Fill;
        labelVersion.Location = new Point(167, 30);
        labelVersion.Margin = new Padding(7, 0, 4, 0);
        labelVersion.MaximumSize = new Size(0, 20);
        labelVersion.Name = "labelVersion";
        labelVersion.Size = new Size(316, 20);
        labelVersion.TabIndex = 0;
        labelVersion.Text = "Version";
        labelVersion.TextAlign = ContentAlignment.MiddleLeft;
        // 
        // labelCopyright
        // 
        labelCopyright.Dock = DockStyle.Fill;
        labelCopyright.Location = new Point(167, 60);
        labelCopyright.Margin = new Padding(7, 0, 4, 0);
        labelCopyright.MaximumSize = new Size(0, 20);
        labelCopyright.Name = "labelCopyright";
        labelCopyright.Size = new Size(316, 20);
        labelCopyright.TabIndex = 21;
        labelCopyright.Text = "Developed by Knuutti";
        labelCopyright.TextAlign = ContentAlignment.MiddleLeft;
        // 
        // labelCompanyName
        // 
        labelCompanyName.AccessibleRole = AccessibleRole.Client;
        labelCompanyName.Location = new Point(167, 90);
        labelCompanyName.Margin = new Padding(7, 0, 4, 0);
        labelCompanyName.MaximumSize = new Size(0, 300);
        labelCompanyName.Name = "labelCompanyName";
        labelCompanyName.Size = new Size(316, 175);
        labelCompanyName.TabIndex = 22;
        labelCompanyName.Text = resources.GetString("labelCompanyName.Text");
        labelCompanyName.TextAlign = ContentAlignment.MiddleLeft;
        labelCompanyName.Click += labelCompanyName_Click;
        // 
        // okButton
        // 
        okButton.Anchor = AnchorStyles.Bottom | AnchorStyles.Right;
        okButton.DialogResult = DialogResult.Cancel;
        okButton.Location = new Point(395, 277);
        okButton.Margin = new Padding(4, 3, 4, 3);
        okButton.Name = "okButton";
        okButton.Size = new Size(88, 27);
        okButton.TabIndex = 24;
        okButton.Text = "&OK";
        okButton.Click += labelProductName_Click;
        // 
        // AboutBox
        // 
        AcceptButton = okButton;
        AutoScaleDimensions = new SizeF(7F, 15F);
        AutoScaleMode = AutoScaleMode.Font;
        ClientSize = new Size(507, 327);
        Controls.Add(tableLayoutPanel);
        FormBorderStyle = FormBorderStyle.FixedDialog;
        Margin = new Padding(4, 3, 4, 3);
        MaximizeBox = false;
        MinimizeBox = false;
        Name = "AboutBox";
        Padding = new Padding(10);
        ShowIcon = false;
        ShowInTaskbar = false;
        StartPosition = FormStartPosition.CenterParent;
        Text = "AboutBox";
        tableLayoutPanel.ResumeLayout(false);
        ((System.ComponentModel.ISupportInitialize)logoPictureBox).EndInit();
        ResumeLayout(false);
    }

    #endregion

    private System.Windows.Forms.TableLayoutPanel tableLayoutPanel;
    private System.Windows.Forms.PictureBox logoPictureBox;
    private System.Windows.Forms.Label labelProductName;
    private System.Windows.Forms.Label labelVersion;
    private System.Windows.Forms.Label labelCopyright;
    private System.Windows.Forms.Label labelCompanyName;
    private System.Windows.Forms.Button okButton;
}
