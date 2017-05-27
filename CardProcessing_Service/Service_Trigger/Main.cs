using System;
using System.Configuration;
using System.Data.OleDb;
using System.IO;
using System.Windows.Forms;
using System.Xml;
using log4net;
using Microsoft.SqlServer.Dts.Runtime;

namespace Service_Trigger
{
	public partial class Main : Form
	{
		#region Fields
		private static readonly ILog Log = LogManager.GetLogger(System.Reflection.MethodBase.GetCurrentMethod().DeclaringType);
		private FileSystemWatcher _watcher;
		private readonly string _connectionString = ConfigurationManager.AppSettings["ConnectionString"];
		private readonly string _transactionTable = ConfigurationManager.AppSettings["TransactionTable"];
		private const string CacheFile = "cache.xml";
		public string DataFolderPath
		{
			get { return txtData.Text; }
			set { txtData.Text = value; }
		}

		public string StoreFolderPath
		{
			get { return txtStore.Text; }
			set { txtStore.Text = value; }
		}

		public string ErrorFolderPath
		{
			get { return txtError.Text; }
			set { txtError.Text = value; }
		}

		public string PackageFilePath
		{
			get { return txtSSIS.Text; }
			set { txtSSIS.Text = value; }
		}
		#endregion

		#region Methods
		public Main()
		{
			InitializeComponent();
			InitTextControl();
		}

		private void InitTextControl()
		{
			string fileName = Environment.CurrentDirectory + "\\" + CacheFile;
			if (File.Exists(fileName))
			{
				try
				{
					XmlDocument doc = new XmlDocument();
					doc.Load(fileName);
					var package = doc.SelectSingleNode("//Path/Package");
					var data = doc.SelectSingleNode("//Path/Data");
					var store = doc.SelectSingleNode("//Path/Store");
					var error = doc.SelectSingleNode("//Path/Error");
					txtSSIS.Text = package?.InnerText;
					txtData.Text = data?.InnerText;
					txtStore.Text = store?.InnerText;
					txtError.Text = error?.InnerText;
				}
				catch (Exception e)
				{
					Log.Error(e);
				}
			}
			if (string.IsNullOrEmpty(txtSSIS.Text?.Trim()))
				txtSSIS.Text = ConfigurationManager.AppSettings["PackageFilePath"];
			if (string.IsNullOrEmpty(txtData.Text?.Trim()))
				txtData.Text = ConfigurationManager.AppSettings["DataFolderPath"];
			if (string.IsNullOrEmpty(txtStore.Text?.Trim()))
				txtStore.Text = ConfigurationManager.AppSettings["StoreFolderPath"];
			if (string.IsNullOrEmpty(txtError.Text?.Trim()))
				txtError.Text = ConfigurationManager.AppSettings["ErrorFolderPath"];
		}

		private void ImportFile(params FileInfo[] files)
		{
			var app = new Microsoft.SqlServer.Dts.Runtime.Application();
			var pkg = app.LoadPackage(PackageFilePath, null);
			Variables myVars = pkg.Variables;
			if (files == null) return;
			foreach (var file in files)
			{
				try
				{
					Log.Info($"Importing file \"{file.FullName}\"");
					myVars["ConnectionString"].Value = _connectionString;
					myVars["TransactionFilePath"].Value = file.FullName;
					myVars["TransactionTable"].Value = _transactionTable;
					var pkgResults = pkg.Execute(null, myVars, null, null, null);
					if (pkgResults == DTSExecResult.Failure)
					{
						var newFileName = "Failed" + DateTime.Now.ToString("_dd_MM_yyyy_HH_mm_ss_") + file.Name;
						Log.Error($"Import \"{file.Name}\" failed. Move to \"{ErrorFolderPath}\". Rename file to \"{newFileName}\"\n\n");

						File.Move(file.FullName, ErrorFolderPath + "\\" + newFileName);
					}
					else
					{
						var newFileName = "Completed" + DateTime.Now.ToString("_dd_MM_yyyy_HH_mm_ss_") + file.Name;
						Log.Info($"Import \"{file.Name}\" successfully. Move to \"{StoreFolderPath}\". Rename file to \"{newFileName}\"\n\n");

						File.Move(file.FullName, StoreFolderPath + "\\" + newFileName);
					}
				}
				catch (Exception ex)
				{
					Log.Error(ex.ToString());
					var newFileName = "Exception" + DateTime.Now.ToString("_dd_MM_yyyy_HH_mm_ss_") + file.Name;
					Log.Error($"Import \"{file.Name}\" failed. Move to \"{ErrorFolderPath}\". Rename file to \"{newFileName}\"\n\n");

					File.Move(file.FullName, ErrorFolderPath + "\\" + newFileName);
				}
			}
		}

		private bool ValidateTextControl(Control ctr, ErrorProvider error)
		{
			error.SetError(ctr, string.Empty);
			if (string.IsNullOrEmpty(ctr.Text.Trim()))
			{
				error.SetError(ctr, @"This field must not empty.");
				return false;
			}
			if (ctr.Name.Equals("txtSSIS"))
			{
				if (File.Exists(ctr.Text)) return true;
				error.SetError(ctr, @"File path not exist.");
				return false;
			}
			if (Directory.Exists(ctr.Text)) return true;
			error.SetError(ctr, @"Folder path not exist.");
			return false;
		}

		private bool ValidateFileAndFolderPath()
		{
			bool valid = ValidateTextControl(txtSSIS, _errorProvider);
			if (!ValidateTextControl(txtData, _errorProvider))
				valid = false;
			if (!ValidateTextControl(txtStore, _errorProvider))
				valid = false;
			if (!ValidateTextControl(txtError, _errorProvider))
				valid = false;
			return valid;
		}

		private bool ValidateConnectionString()
		{
			try
			{
				using (OleDbConnection con = new OleDbConnection(_connectionString))
				{
					con.Open();
					con.Close();
					return true;
				}
			}
			catch (Exception e)
			{
				Log.Error(e);
				return false;
			}

		}

		private void InitWatcher()
		{
			_watcher = new FileSystemWatcher()
			{
				Path = DataFolderPath,
				Filter = "*.*",
				EnableRaisingEvents = true
			};
		}
		private bool ValidateTableName()
		{
			bool exists = false;
			var con = new OleDbConnection(_connectionString);
			try
			{
				var cmd = new OleDbCommand(
					$"select case when exists((select * from information_schema.tables where table_name = '{_transactionTable}')) then 1 else 0 end");
				cmd.Connection = con;
				con.Open();
				exists = (int)cmd.ExecuteScalar() == 1;
			}
			catch (Exception e)
			{
				Log.Error(e);
			}
			finally
			{
				con.Close();
			}
			return exists;
		}

		private void SavePath()
		{
			Log.Info("Save file and folder paths to cache.xml");
			XmlTextWriter writer = new XmlTextWriter(CacheFile, null);
			Log.Info("Create new cache.xml file.");
			string content = "<Path>" +
							 $"<Package>{PackageFilePath}</Package>" +
							 $"<Data>{DataFolderPath}</Data>" +
							 $"<Store>{StoreFolderPath}</Store>" +
							 $"<Error>{ErrorFolderPath}</Error>" +
							 "</Path>";
			var doc = new XmlDocument();
			doc.LoadXml(content);

			writer.Formatting = Formatting.Indented;
			doc.Save(writer);

		}
		#endregion

		#region Event
		private void btnStop_Click(object sender, EventArgs e)
		{
			Log.Info("Stop service...");
			gbConfiguration.Enabled = true;
			btnStart.Enabled = true;
			btnStop.Enabled = false;
			Text = @"Service stoped";
			ControlBox = true;
			_watcher.EnableRaisingEvents = false;
			_watcher.Created -= Watcher_Event;
		}

		private void btnStart_Click(object sender, EventArgs e)
		{
			if (!ValidateConnectionString())
			{
				MessageBox.Show($@"Connection String '{_connectionString}' is incorrect. Please check ConnectionString value in configuration file.");
				return;
			}
			if (!ValidateTableName())
			{
				MessageBox.Show($@"Table Name '{_transactionTable}' is incorrect. Please check TransactionTable value in configuration file.");
				return;
			}

			if (!ValidateFileAndFolderPath()) return;
			Log.Info("All paths valid. Start service...");
			InitWatcher();
			gbConfiguration.Enabled = false;
			btnStart.Enabled = false;
			btnStop.Enabled = true;
			Text = @"Service running";
			ControlBox = false;

			var directory = new DirectoryInfo(DataFolderPath);
			var files = directory.GetFiles();
			ImportFile(files);

			_watcher.EnableRaisingEvents = true;
			_watcher.Created += Watcher_Event;
		}

		private void Watcher_Event(object sender, FileSystemEventArgs e)
		{
			var files = new FileInfo(e.FullPath).Directory?.GetFiles();
			ImportFile(files);
		}

		private void btnChangeSSIS_Click(object sender, EventArgs e)
		{
			OpenFileDialog op = new OpenFileDialog { Multiselect = false };
			if (op.ShowDialog() != DialogResult.OK) return;
			PackageFilePath = op.FileName;
			txtSSIS_Validated(txtSSIS, new EventArgs());
		}

		private void btnChangeData_Click(object sender, EventArgs e)
		{
			FolderBrowserDialog dlg = new FolderBrowserDialog();
			if (dlg.ShowDialog() != DialogResult.OK) return;
			DataFolderPath = dlg.SelectedPath;
			txtData_Validated(txtData, new EventArgs());
		}

		private void btnChangeStore_Click(object sender, EventArgs e)
		{
			FolderBrowserDialog dlg = new FolderBrowserDialog();
			if (dlg.ShowDialog() != DialogResult.OK) return;
			StoreFolderPath = dlg.SelectedPath;
			txtStore_Validated(txtStore, new EventArgs());
		}

		private void btnChangeError_Click(object sender, EventArgs e)
		{
			FolderBrowserDialog dlg = new FolderBrowserDialog();
			if (dlg.ShowDialog() != DialogResult.OK) return;
			ErrorFolderPath = dlg.SelectedPath;
			txtError_Validated(txtError, new EventArgs());
		}

		private void txtSSIS_Validated(object sender, EventArgs e)
		{
			ValidateTextControl(txtSSIS, _errorProvider);
		}

		private void txtData_Validated(object sender, EventArgs e)
		{
			ValidateTextControl(txtData, _errorProvider);
		}

		private void txtStore_Validated(object sender, EventArgs e)
		{
			ValidateTextControl(txtStore, _errorProvider);
		}

		private void txtError_Validated(object sender, EventArgs e)
		{
			ValidateTextControl(txtError, _errorProvider);
		}

		private void Main_FormClosing(object sender, FormClosingEventArgs e)
		{
			SavePath();
		}

		private void Main_Resize(object sender, EventArgs e)
		{
			switch (WindowState)
			{
				case FormWindowState.Minimized:
					myNotifyIcon.BalloonTipText = @"Service Form has been Minimized.";
					myNotifyIcon.Visible = true;
					ShowInTaskbar = false;
					myNotifyIcon.ShowBalloonTip(500);
					break;
				case FormWindowState.Normal:
					myNotifyIcon.Visible = false;
					ShowInTaskbar = true;
					break;
			}
		}

		private void myNotifyIcon_MouseDoubleClick(object sender, MouseEventArgs e)
		{
			WindowState = FormWindowState.Normal;
		}
		#endregion
	}
}
