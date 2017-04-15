using System;
using System.Configuration;
using System.IO;
using System.Windows.Forms;
using Microsoft.SqlServer.Dts.Runtime;

namespace _1542226_Calling_SSIS
{
	public partial class Form1 : Form
	{

		private string _sourceFolderPath = ConfigurationManager.AppSettings["SourceFolderPath"];
		private string _recycleBinPath = ConfigurationManager.AppSettings["RecycleBinPath"];
		private string _errorFilesPath = ConfigurationManager.AppSettings["ErrorFilesPath"];
		private string _packagePath = ConfigurationManager.AppSettings["PackagePath"];

		public Form1()
		{
			InitializeComponent();
			Closing += WriteFinalLog;
			if (!File.Exists(_packagePath))
			{
				LogError("File " + _packagePath + " không tồn tại. Vui lòng kiểm tra lại PackagePath trong App.config !");
				return;
			}
			if (!Directory.Exists(_sourceFolderPath))
			{
				LogError("Đường dẫn " + _sourceFolderPath + " không tồn tại. Vui lòng kiểm tra lại SourceFolderPath trong App.config !");
				return;
			}
			if (!Directory.Exists(_recycleBinPath))
			{
				LogError("Đường dẫn " + _recycleBinPath + " không tồn tại. Vui lòng kiểm tra lại RecycleBinPath trong App.config !");
				return;
			}
			if (!Directory.Exists(_errorFilesPath))
			{
				LogError("Đường dẫn " + _errorFilesPath + " không tồn tại. Vui lòng kiểm tra lại ErrorFilesPath trong App.config !");
				return;
			}
			var directory = new DirectoryInfo(_sourceFolderPath);
			var files = directory.GetFiles();
			ImportFile(files);

			ListenFileChange();
		}


		public void ListenFileChange()
		{
			FileSystemWatcher watcher = new FileSystemWatcher()
			{
				Path = _sourceFolderPath,
				Filter = "*.*",
				EnableRaisingEvents = true
			};
			watcher.Created += Watcher_Event;
		}

		private void Watcher_Event(object sender, FileSystemEventArgs e)
		{
			var files = new FileInfo(e.FullPath).Directory?.GetFiles();
			ImportFile(files);
		}

		private void ImportFile(params FileInfo[] files)
		{
			Package pkg;
			Microsoft.SqlServer.Dts.Runtime.Application app;
			DTSExecResult pkgResults;
			app = new Microsoft.SqlServer.Dts.Runtime.Application();
			pkg = app.LoadPackage(_packagePath, null);
			Variables myVars = pkg.Variables;
			if (files == null) return;
			foreach (var file in files)
			{
				try
				{
					LogInfo("Tiến hành import file <" + file.Name + ">");
					myVars["TransactionFilePath"].Value = file.FullName;
					pkgResults = pkg.Execute(null, myVars, null, null, null);
					if (pkgResults == DTSExecResult.Failure)
					{
						LogError("Import <" + file.Name + "> thất bại. Chuyển file <" + file.Name + "> sang thư mục \"" + _errorFilesPath + "\"" + Environment.NewLine + Environment.NewLine);
						File.Move(file.FullName, _errorFilesPath + "\\" + DateTime.Now.ToString("dd_MM_yyyy_HH_mm_ss_") + file.Name);
					}
					else
					{
						LogInfo("Import <" + file.Name + "> thành công. Chuyển file <" + file.Name + "> sang thư mục \"" + _recycleBinPath + "\"" + Environment.NewLine + Environment.NewLine);
						File.Move(file.FullName, _recycleBinPath + "\\" + DateTime.Now.ToString("dd_MM_yyyy_HH_mm_ss_") + file.Name);
					}
				}
				catch (Exception ex)
				{
					LogError(ex.ToString());
					LogError("Import <" + file.Name + "> thất bại. Chuyển file <" + file.Name + "> sang thư mục \"" + _errorFilesPath + "\"" + Environment.NewLine + Environment.NewLine);
					File.Move(file.FullName, _errorFilesPath + "\\" + DateTime.Now.ToString("dd_MM_yyyy_HH_mm_ss_") + file.Name);
				}
			}
		}

		private void LogError(string message)
		{
			txtLog.Text += DateTime.Now.ToString("dd-MM-yyyy HH:mm:ss ") + "Error: " + message + Environment.NewLine; 
		}

		private void LogInfo(string message)
		{
			txtLog.Text += DateTime.Now.ToString("dd-MM-yyyy HH:mm:ss ") + "Infomation: " + message + Environment.NewLine;
		}

		private void WriteFinalLog(object sender, System.ComponentModel.CancelEventArgs e)
		{
			File.WriteAllText("SystemLog.txt", txtLog.Text);
		}
	}
}
