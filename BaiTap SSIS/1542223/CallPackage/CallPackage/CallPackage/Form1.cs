using Microsoft.SqlServer.Dts.Runtime;
using System;
using System.Collections.Generic;
using System.Windows.Forms;

namespace CallPackage
{
	public partial class Form1 : Form
	{
		private string[] _listFiles;
		private string _package = string.Empty;
		public Form1()
		{
			InitializeComponent();
		}

		private void button1_Click(object sender, EventArgs e)
		{
			textBox1.Text = string.Empty;
			OpenFileDialog dlg = new OpenFileDialog();
			dlg.Multiselect = true;
			if (dlg.ShowDialog() == DialogResult.OK)
			{
				_listFiles = dlg.FileNames;
				foreach (string file in _listFiles)
				{
					textBox1.Text += @"""" + file + @""";";
				}
			}
		}

		private void button2_Click(object sender, EventArgs e)
		{
			Package pkg;
			Microsoft.SqlServer.Dts.Runtime.Application app;
			DTSExecResult pkgResults;
			app = new Microsoft.SqlServer.Dts.Runtime.Application();
			pkg = app.LoadPackage(_package, null);
			Variables myVars = pkg.Variables;
			List<string> thanhCong = new List<string>();
			List<string> thatbai = new List<string>();
			foreach (var file in _listFiles)
			{
				try
				{
					myVars["TransactionFilePath"].Value = file;
					pkgResults = pkg.Execute(null, myVars, null, null, null);
					if (pkgResults == DTSExecResult.Failure)
					{
						thatbai.Add(file);
					}
					else
					{
						thanhCong.Add(file);
					}
				}
				catch
				{
					thatbai.Add(file);
				}
			}
			string msg = string.Empty;
			if (thanhCong.Count > 0)
			{
				msg += "- Import thanh cong:\n";
				foreach (var file in thanhCong)
				{
					msg += file + "\n";
				}
			}
			if (thatbai.Count > 0)
			{
				msg += "- Import that bai:\n";
				foreach (var file in thatbai)
				{
					msg += file + "\n";
				}
			}
			MessageBox.Show(msg);
			textBox1.Text = string.Empty;
		}

		private void button3_Click(object sender, EventArgs e)
		{
			textBox2.Text = string.Empty;
			OpenFileDialog dlg = new OpenFileDialog();
			if (dlg.ShowDialog() == DialogResult.OK)
			{
				textBox2.Text = dlg.FileName;
				_package = dlg.FileName;
			}
		}

		private void textBox2_TextChanged(object sender, EventArgs e)
		{
			if (!string.IsNullOrEmpty(textBox1.Text) && !string.IsNullOrEmpty(textBox2.Text))
			{
				btnRun.Enabled = true;
			}
			else
			{
				btnRun.Enabled = false;
			}
		}
	}
}
