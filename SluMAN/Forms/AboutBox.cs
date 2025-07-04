﻿using DarkModeForms;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Drawing;
using System.Linq;
using System.Reflection;
using System.Threading.Tasks;
using System.Windows.Forms;
using DarkModeForms;

namespace RacMAN.Forms;
partial class AboutBox : Form
{

    private DarkModeCS dm = null;
    public AboutBox()
    {
        InitializeComponent();
        dm = new DarkModeCS(this)
        {
            //[Optional] Choose your preferred color mode here:
            ColorMode = DarkModeCS.DisplayMode.SystemDefault
        };
        this.Text = String.Format("About {0}", AssemblyTitle);
        //this.labelProductName.Text = AssemblyProduct;
        this.labelVersion.Text = $"v{Assembly.GetEntryAssembly()!.GetName().Version.Major}." +
            $"{Assembly.GetEntryAssembly()!.GetName().Version.Minor}." +
            $"{Assembly.GetEntryAssembly()!.GetName().Version.Build}";
        //this.labelCopyright.Text = AssemblyCopyright;
        //this.labelCompanyName.Text = AssemblyCompany;
        //this.textBoxDescription.Text = AssemblyDescription;
    }

    #region Assembly Attribute Accessors

    public string AssemblyTitle
    {
        get
        {
            object[] attributes = Assembly.GetExecutingAssembly().GetCustomAttributes(typeof(AssemblyTitleAttribute), false);
            if (attributes.Length > 0)
            {
                AssemblyTitleAttribute titleAttribute = (AssemblyTitleAttribute)attributes[0];
                if (titleAttribute.Title != "")
                {
                    return titleAttribute.Title;
                }
            }
            return System.IO.Path.GetFileNameWithoutExtension(Assembly.GetExecutingAssembly().CodeBase);
        }
    }

    public string AssemblyVersion
    {
        get
        {
            return Assembly.GetExecutingAssembly().GetName().Version.ToString();
        }
    }

    public string AssemblyDescription
    {
        get
        {
            object[] attributes = Assembly.GetExecutingAssembly().GetCustomAttributes(typeof(AssemblyDescriptionAttribute), false);
            if (attributes.Length == 0)
            {
                return "";
            }
            return ((AssemblyDescriptionAttribute)attributes[0]).Description;
        }
    }

    public string AssemblyProduct
    {
        get
        {
            object[] attributes = Assembly.GetExecutingAssembly().GetCustomAttributes(typeof(AssemblyProductAttribute), false);
            if (attributes.Length == 0)
            {
                return "";
            }
            return ((AssemblyProductAttribute)attributes[0]).Product;
        }
    }

    public string AssemblyCopyright
    {
        get
        {
            object[] attributes = Assembly.GetExecutingAssembly().GetCustomAttributes(typeof(AssemblyCopyrightAttribute), false);
            if (attributes.Length == 0)
            {
                return "";
            }
            return ((AssemblyCopyrightAttribute)attributes[0]).Copyright;
        }
    }

    public string AssemblyCompany
    {
        get
        {
            object[] attributes = Assembly.GetExecutingAssembly().GetCustomAttributes(typeof(AssemblyCompanyAttribute), false);
            if (attributes.Length == 0)
            {
                return "";
            }
            return ((AssemblyCompanyAttribute)attributes[0]).Company;
        }
    }
    #endregion

    private void labelProductName_Click(object sender, EventArgs e)
    {

    }

    private void textBoxDescription_TextChanged(object sender, EventArgs e)
    {

    }

    private void labelCompanyName_Click(object sender, EventArgs e)
    {

    }
}
