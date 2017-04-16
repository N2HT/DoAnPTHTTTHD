using Microsoft.SqlServer.Dts.Runtime;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Text;
using System.Windows.Forms;

namespace CallSSIS {
    public partial class Form1 : Form {
        public Form1() {
            InitializeComponent();
        }

        private void btnImport_Click(object sender, EventArgs e) {
            String importFilePath = txtFilePath.Text;
            String SSISPackageFilePath = txtSSISPackageFilePath.Text;
            if (importFilePath == "") {
                MessageBox.Show("Please enter the data import file path!");
                return;
            }

            if (SSISPackageFilePath == "") {
                MessageBox.Show("Please enter the SSIS package file path!");
                return;
            }

            // Check the data import file exists?
            if (!File.Exists(importFilePath)) {
                MessageBox.Show("Data import file is not exists. Please check the file path!");
                return;
            }

            // Check the SSIS package file exists?
            if (!File.Exists(SSISPackageFilePath)) {
                MessageBox.Show("SSIS package file is not exists. Please check the file path!");
                return;
            }

            // Call command line
            string pkgLocation;
            Package pkg;
            Microsoft.SqlServer.Dts.Runtime.Application app;
            DTSExecResult pkgResults;

            pkgLocation = SSISPackageFilePath;
            app = new Microsoft.SqlServer.Dts.Runtime.Application();
            pkg = app.LoadPackage(pkgLocation, null);
            Variables appVars = pkg.Variables;
            appVars["User::FileTransactionNamePath"].Value = importFilePath;

            pkgResults = pkg.Execute(null, appVars, null, null, null);

            if (pkgResults == DTSExecResult.Success) {
                MessageBox.Show("Package ran successfully");
            } else {
                MessageBox.Show("Package failed");
            }
            //Console.WriteLine(pkgResults.ToString());
            //Console.ReadKey();
        }
    }
}
