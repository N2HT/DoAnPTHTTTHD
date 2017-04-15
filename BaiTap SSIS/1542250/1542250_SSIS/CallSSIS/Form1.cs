using Microsoft.SqlServer.Dts.Runtime;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;

namespace CallSSIS {
    public partial class Form1 : Form {
        public Form1() {
            InitializeComponent();
        }

        private void btnImport_Click(object sender, EventArgs e) {
            String filePath = txtFilePath.Text;
            if (filePath == "") {
                MessageBox.Show("Please enter the data file path");
                return;
            }

            // Call command line
            string pkgLocation;
            Package pkg;
            Microsoft.SqlServer.Dts.Runtime.Application app;
            DTSExecResult pkgResults;

            pkgLocation = @"D:\Transaction_Processing.dtsx";
            app = new Microsoft.SqlServer.Dts.Runtime.Application();
            pkg = app.LoadPackage(pkgLocation, null);
            Variables appVars = pkg.Variables;
            appVars["FileTransactionNamePath"].Value = @"D:\transaction_lythuongkiet_01042017.dat";

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
