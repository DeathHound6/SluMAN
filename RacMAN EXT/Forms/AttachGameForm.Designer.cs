namespace RacMAN.Forms;

partial class AttachGameForm
{
    /// <summary>
    /// Required designer variable.
    /// </summary>
    private System.ComponentModel.IContainer components = null;

    /// <summary>
    /// Clean up any resources being used.
    /// </summary>
    /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
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
        System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(AttachGameForm));
        textBox1 = new TextBox();
        label3 = new Label();
        attachButton = new Button();
        versionLabel = new Label();
        rpcs3Button = new Button();
        SuspendLayout();
        // 
        // textBox1
        // 
        textBox1.Location = new Point(24, 46);
        textBox1.Margin = new Padding(4, 3, 4, 3);
        textBox1.Name = "textBox1";
        textBox1.Size = new Size(111, 23);
        textBox1.TabIndex = 3;
        textBox1.KeyDown += textBox1_KeyDown;
        // 
        // label3
        // 
        label3.AutoSize = true;
        label3.Location = new Point(24, 28);
        label3.Margin = new Padding(4, 0, 4, 0);
        label3.Name = "label3";
        label3.Size = new Size(65, 15);
        label3.TabIndex = 4;
        label3.Text = "IP Address:";
        // 
        // attachButton
        // 
        attachButton.Location = new Point(143, 46);
        attachButton.Margin = new Padding(4, 3, 4, 3);
        attachButton.Name = "attachButton";
        attachButton.Size = new Size(63, 23);
        attachButton.TabIndex = 5;
        attachButton.Text = "Attach";
        attachButton.UseVisualStyleBackColor = true;
        attachButton.Click += attachButton_ClickPS3;
        // 
        // versionLabel
        // 
        versionLabel.AutoSize = true;
        versionLabel.Location = new Point(13, 95);
        versionLabel.Margin = new Padding(4, 0, 4, 0);
        versionLabel.Name = "versionLabel";
        versionLabel.Size = new Size(53, 15);
        versionLabel.TabIndex = 7;
        versionLabel.Text = "{version}";
        // 
        // rpcs3Button
        // 
        rpcs3Button.Location = new Point(155, 87);
        rpcs3Button.Name = "rpcs3Button";
        rpcs3Button.Size = new Size(75, 23);
        rpcs3Button.TabIndex = 8;
        rpcs3Button.Text = "RPCS3";
        rpcs3Button.UseVisualStyleBackColor = true;
        rpcs3Button.Click += attachButton_ClickRPCS3;
        // 
        // AttachGameForm
        // 
        AutoScaleDimensions = new SizeF(7F, 15F);
        AutoScaleMode = AutoScaleMode.Font;
        ClientSize = new Size(241, 122);
        Controls.Add(rpcs3Button);
        Controls.Add(versionLabel);
        Controls.Add(attachButton);
        Controls.Add(label3);
        Controls.Add(textBox1);
        FormBorderStyle = FormBorderStyle.FixedSingle;
        Icon = (Icon)resources.GetObject("$this.Icon");
        Margin = new Padding(4, 3, 4, 3);
        MaximizeBox = false;
        Name = "AttachGameForm";
        Text = "SluMAN";
        Load += AttachGameForm_Load;
        Shown += AttachGameForm_Shown;
        ResumeLayout(false);
        PerformLayout();
    }

    #endregion
    private System.Windows.Forms.TextBox textBox1;
    private System.Windows.Forms.Label label3;
    private System.Windows.Forms.Button attachButton;
    private Label versionLabel;
    private Button rpcs3Button;
}