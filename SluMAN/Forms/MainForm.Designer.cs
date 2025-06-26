namespace RacMAN.Forms;

partial class MainForm
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
        System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(MainForm));
        menuStrip1 = new MenuStrip();
        settingsToolStripMenuItem1 = new ToolStripMenuItem();
        toolsToolStripMenuItem = new ToolStripMenuItem();
        combosHotkeysToolStripMenuItem = new ToolStripMenuItem();
        inputDisplayToolStripMenuItem = new ToolStripMenuItem();
        autosplittersToolStripMenuItem = new ToolStripMenuItem();
        luaConsoleToolStripMenuItem = new ToolStripMenuItem();
        aboutToolStripMenuItem = new ToolStripMenuItem();
        openFileDialog1 = new OpenFileDialog();
        menuStrip1.SuspendLayout();
        SuspendLayout();
        // 
        // menuStrip1
        // 
        menuStrip1.Items.AddRange(new ToolStripItem[] { settingsToolStripMenuItem1, toolsToolStripMenuItem, aboutToolStripMenuItem });
        menuStrip1.Location = new Point(0, 0);
        menuStrip1.Name = "menuStrip1";
        menuStrip1.Padding = new Padding(7, 2, 0, 2);
        menuStrip1.Size = new Size(624, 24);
        menuStrip1.TabIndex = 0;
        menuStrip1.Text = "menuStrip1";
        // 
        // settingsToolStripMenuItem1
        // 
        settingsToolStripMenuItem1.Name = "settingsToolStripMenuItem1";
        settingsToolStripMenuItem1.Size = new Size(61, 20);
        settingsToolStripMenuItem1.Text = "Settings";
        settingsToolStripMenuItem1.Click += settingsToolStripMenuItem_Click;
        // 
        // toolsToolStripMenuItem
        // 
        toolsToolStripMenuItem.DropDownItems.AddRange(new ToolStripItem[] { combosHotkeysToolStripMenuItem, inputDisplayToolStripMenuItem, autosplittersToolStripMenuItem, luaConsoleToolStripMenuItem });
        toolsToolStripMenuItem.Name = "toolsToolStripMenuItem";
        toolsToolStripMenuItem.Size = new Size(47, 20);
        toolsToolStripMenuItem.Text = "Tools";
        // 
        // combosHotkeysToolStripMenuItem
        // 
        combosHotkeysToolStripMenuItem.Name = "combosHotkeysToolStripMenuItem";
        combosHotkeysToolStripMenuItem.Size = new Size(167, 22);
        combosHotkeysToolStripMenuItem.Text = "Combos/Hotkeys";
        combosHotkeysToolStripMenuItem.Click += combosHotkeysToolStripMenuItem_Click;
        // 
        // inputDisplayToolStripMenuItem
        // 
        inputDisplayToolStripMenuItem.Name = "inputDisplayToolStripMenuItem";
        inputDisplayToolStripMenuItem.Size = new Size(167, 22);
        inputDisplayToolStripMenuItem.Text = "Input Display";
        inputDisplayToolStripMenuItem.Click += inputDisplayToolStripMenuItem_Click;
        // 
        // autosplittersToolStripMenuItem
        // 
        autosplittersToolStripMenuItem.Name = "autosplittersToolStripMenuItem";
        autosplittersToolStripMenuItem.Size = new Size(167, 22);
        autosplittersToolStripMenuItem.Text = "Autosplitters";
        autosplittersToolStripMenuItem.Click += autosplittersToolStripMenuItem_Click;
        // 
        // luaConsoleToolStripMenuItem
        // 
        luaConsoleToolStripMenuItem.Name = "luaConsoleToolStripMenuItem";
        luaConsoleToolStripMenuItem.Size = new Size(167, 22);
        luaConsoleToolStripMenuItem.Text = "Lua Console";
        luaConsoleToolStripMenuItem.Click += luaConsoleToolStripMenuItem_Click;
        // 
        // aboutToolStripMenuItem
        // 
        aboutToolStripMenuItem.Name = "aboutToolStripMenuItem";
        aboutToolStripMenuItem.Size = new Size(52, 20);
        aboutToolStripMenuItem.Text = "About";
        aboutToolStripMenuItem.Click += aboutRaCMANToolStripMenuItem_Click;
        // 
        // openFileDialog1
        // 
        openFileDialog1.Filter = "ZIP files|*.zip|All files|*.*";
        // 
        // MainForm
        // 
        AutoScaleDimensions = new SizeF(7F, 15F);
        AutoScaleMode = AutoScaleMode.Font;
        ClientSize = new Size(624, 381);
        Controls.Add(menuStrip1);
        DoubleBuffered = true;
        Font = new Font("Segoe UI", 9F, FontStyle.Regular, GraphicsUnit.Point, 0);
        Icon = (Icon)resources.GetObject("$this.Icon");
        MainMenuStrip = menuStrip1;
        Margin = new Padding(4, 3, 4, 3);
        Name = "MainForm";
        Text = "SluMAN {version} - {title ID} - {game title}";
        FormClosing += MainForm_FormClosing;
        Load += MainForm_Load;
        Shown += MainForm_Shown;
        menuStrip1.ResumeLayout(false);
        menuStrip1.PerformLayout();
        ResumeLayout(false);
        PerformLayout();
    }

    #endregion

    private System.Windows.Forms.MenuStrip menuStrip1;
    private System.Windows.Forms.ToolStripMenuItem toolsToolStripMenuItem;
    private System.Windows.Forms.ToolStripMenuItem combosHotkeysToolStripMenuItem;
    private System.Windows.Forms.ToolStripMenuItem inputDisplayToolStripMenuItem;
    private System.Windows.Forms.ToolStripMenuItem autosplittersToolStripMenuItem;
    private System.Windows.Forms.ToolStripMenuItem luaConsoleToolStripMenuItem;
    private OpenFileDialog openFileDialog1;
    private ToolStripMenuItem settingsToolStripMenuItem1;
    private ToolStripMenuItem aboutToolStripMenuItem;
}