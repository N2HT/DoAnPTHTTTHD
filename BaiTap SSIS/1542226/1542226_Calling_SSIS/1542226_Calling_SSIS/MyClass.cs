using System;
using Microsoft.SqlServer.Dts.Runtime;
using System.Configuration;
using System.IO;
using System.Threading;

namespace _1542226_Calling_SSIS
{
	public class MyClass
	{
		private static string _sourceFolderPath = ConfigurationManager.AppSettings["SourceFolderPath"];
		private static string _rycycleBinPath = ConfigurationManager.AppSettings["RycycleBinPath"];
		private static string _errorFilesPath = ConfigurationManager.AppSettings["ErrorFilesPath"];
		private static string _packagePath = ConfigurationManager.AppSettings["PackagePath"];
		public static void ListenFileChange()
		{
			new Thread(() =>
			{
				if (!File.Exists(_packagePath))
				{
					Console.WriteLine("Duong dan den file package khong ton tai. Vui long xem lai PackagePath trong app.config");
					return;
				}
				if (!Directory.Exists(_sourceFolderPath))
				{
					Console.WriteLine("Duong dan den source folder khong ton tai. Vui long xem lai SourceFolderPath trong app.config");
				}
				FileSystemWatcher watcher = new FileSystemWatcher()
				{
					Path = _sourceFolderPath,
				};
				watcher.Created += Watcher_Created;
			}).Start();
			Console.ReadLine();
		}

		private static void Watcher_Created(object sender, FileSystemEventArgs e)
		{
			Package pkg;
			Application app;
			DTSExecResult pkgResults;
			app = new Application();
			pkg = app.LoadPackage(_packagePath, null);
			Variables myVars = pkg.Variables;
			var files = new FileInfo(e.FullPath).Directory?.GetFiles();
			if (files == null) return;
			foreach (var file in files)
			{
				try
				{
					myVars["TransactionFilePath"].Value = file.FullName;
					pkgResults = pkg.Execute(null, myVars, null, null, null);
					Console.WriteLine(pkgResults.ToString());
					File.Move(file.FullName, _rycycleBinPath + "\\" + file.Name);
				}
				catch (Exception ex)
				{
					Console.WriteLine(ex.Message);
				}
			}
		}


		public static void Run()
		{
			if (!File.Exists(_packagePath))
			{
				Console.WriteLine("Duong dan den file package khong ton tai. Vui long xem lai PackagePath trong app.config");
				Console.ReadLine();
				return;
			}
			if (!Directory.Exists(_sourceFolderPath))
			{
				Console.WriteLine("Duong dan den source folder khong ton tai. Vui long xem lai SourceFolderPath trong app.config");
				Console.ReadLine();
				return;
			}
			Package pkg;
			Application app;
			DTSExecResult pkgResults;
			app = new Application();
			pkg = app.LoadPackage(_packagePath, null);
			Variables myVars = pkg.Variables;
			var files = Directory.CreateDirectory(_sourceFolderPath).GetFiles();
			//if (files == null) return;
			foreach (var file in files)
			{
				try
				{
					myVars["TransactionFilePath"].Value = file.FullName;
					pkgResults = pkg.Execute(null, myVars, null, null, null);
					Console.WriteLine(pkgResults.ToString());
					File.Move(file.FullName, _rycycleBinPath + "\\" + file.Name);
				}
				catch (Exception ex)
				{
					Console.WriteLine(ex.Message);
				}
			}
		}
	}
}
