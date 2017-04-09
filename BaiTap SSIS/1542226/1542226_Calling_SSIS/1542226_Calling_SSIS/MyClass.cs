using System;
using Microsoft.SqlServer.Dts.Runtime;
using System.Configuration;
using System.IO;

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
			FileSystemWatcher watcher = new FileSystemWatcher()
			{
				Path = _sourceFolderPath,
				Filter = "*.txt"
			};
			watcher.Created += Watcher_Created;
		}

		private static void Watcher_Created(object sender, FileSystemEventArgs e)
		{
			Package pkg;
			Application app;
			DTSExecResult pkgResults;
			app = new Application();

			pkg = app.LoadPackage(_packagePath, null);
			Variables myVars = pkg.Variables;
			myVars["MyVariable1"].Value = "value1";
			myVars["MyVariable2"].Value = "value2";
			pkgResults = pkg.Execute(null, myVars, null, null, null);

			Console.WriteLine(pkgResults.ToString());
			Console.ReadKey();
		}
	}
}
