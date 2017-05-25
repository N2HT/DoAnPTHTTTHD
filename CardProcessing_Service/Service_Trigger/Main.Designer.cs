namespace Service_Trigger
{
	partial class Main
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
			this.components = new System.ComponentModel.Container();
			this._errorProvider = new System.Windows.Forms.ErrorProvider(this.components);
			this.btnStart = new System.Windows.Forms.Button();
			this.btnStop = new System.Windows.Forms.Button();
			this.gbConfiguration = new System.Windows.Forms.GroupBox();
			this.btnChangeError = new System.Windows.Forms.Button();
			this.btnChangeStore = new System.Windows.Forms.Button();
			this.btnChangeData = new System.Windows.Forms.Button();
			this.btnChangeSSIS = new System.Windows.Forms.Button();
			this.txtError = new System.Windows.Forms.TextBox();
			this.label4 = new System.Windows.Forms.Label();
			this.txtStore = new System.Windows.Forms.TextBox();
			this.label3 = new System.Windows.Forms.Label();
			this.txtData = new System.Windows.Forms.TextBox();
			this.label2 = new System.Windows.Forms.Label();
			this.txtSSIS = new System.Windows.Forms.TextBox();
			this.label1 = new System.Windows.Forms.Label();
			((System.ComponentModel.ISupportInitialize)(this._errorProvider)).BeginInit();
			this.gbConfiguration.SuspendLayout();
			this.SuspendLayout();
			// 
			// _errorProvider
			// 
			this._errorProvider.ContainerControl = this;
			// 
			// btnStart
			// 
			this.btnStart.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
			this.btnStart.Location = new System.Drawing.Point(420, 303);
			this.btnStart.Name = "btnStart";
			this.btnStart.Size = new System.Drawing.Size(75, 40);
			this.btnStart.TabIndex = 3;
			this.btnStart.Text = "Start";
			this.btnStart.UseVisualStyleBackColor = true;
			this.btnStart.Click += new System.EventHandler(this.btnStart_Click);
			// 
			// btnStop
			// 
			this.btnStop.Enabled = false;
			this.btnStop.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
			this.btnStop.Location = new System.Drawing.Point(529, 303);
			this.btnStop.Name = "btnStop";
			this.btnStop.Size = new System.Drawing.Size(75, 40);
			this.btnStop.TabIndex = 3;
			this.btnStop.Text = "Stop";
			this.btnStop.UseVisualStyleBackColor = true;
			this.btnStop.Click += new System.EventHandler(this.btnStop_Click);
			// 
			// gbConfiguration
			// 
			this.gbConfiguration.Controls.Add(this.btnChangeError);
			this.gbConfiguration.Controls.Add(this.btnChangeStore);
			this.gbConfiguration.Controls.Add(this.btnChangeData);
			this.gbConfiguration.Controls.Add(this.btnChangeSSIS);
			this.gbConfiguration.Controls.Add(this.txtError);
			this.gbConfiguration.Controls.Add(this.label4);
			this.gbConfiguration.Controls.Add(this.txtStore);
			this.gbConfiguration.Controls.Add(this.label3);
			this.gbConfiguration.Controls.Add(this.txtData);
			this.gbConfiguration.Controls.Add(this.label2);
			this.gbConfiguration.Controls.Add(this.txtSSIS);
			this.gbConfiguration.Controls.Add(this.label1);
			this.gbConfiguration.Dock = System.Windows.Forms.DockStyle.Top;
			this.gbConfiguration.Location = new System.Drawing.Point(0, 0);
			this.gbConfiguration.Name = "gbConfiguration";
			this.gbConfiguration.Size = new System.Drawing.Size(624, 289);
			this.gbConfiguration.TabIndex = 4;
			this.gbConfiguration.TabStop = false;
			this.gbConfiguration.Text = "Configuration:";
			// 
			// btnChangeError
			// 
			this.btnChangeError.Location = new System.Drawing.Point(529, 252);
			this.btnChangeError.Name = "btnChangeError";
			this.btnChangeError.Size = new System.Drawing.Size(75, 23);
			this.btnChangeError.TabIndex = 11;
			this.btnChangeError.Text = "Change";
			this.btnChangeError.UseVisualStyleBackColor = true;
			this.btnChangeError.Click += new System.EventHandler(this.btnChangeError_Click);
			// 
			// btnChangeStore
			// 
			this.btnChangeStore.Location = new System.Drawing.Point(529, 176);
			this.btnChangeStore.Name = "btnChangeStore";
			this.btnChangeStore.Size = new System.Drawing.Size(75, 23);
			this.btnChangeStore.TabIndex = 12;
			this.btnChangeStore.Text = "Change";
			this.btnChangeStore.UseVisualStyleBackColor = true;
			this.btnChangeStore.Click += new System.EventHandler(this.btnChangeStore_Click);
			// 
			// btnChangeData
			// 
			this.btnChangeData.Location = new System.Drawing.Point(529, 105);
			this.btnChangeData.Name = "btnChangeData";
			this.btnChangeData.Size = new System.Drawing.Size(75, 23);
			this.btnChangeData.TabIndex = 13;
			this.btnChangeData.Text = "Change";
			this.btnChangeData.UseVisualStyleBackColor = true;
			this.btnChangeData.Click += new System.EventHandler(this.btnChangeData_Click);
			// 
			// btnChangeSSIS
			// 
			this.btnChangeSSIS.Location = new System.Drawing.Point(529, 37);
			this.btnChangeSSIS.Name = "btnChangeSSIS";
			this.btnChangeSSIS.Size = new System.Drawing.Size(75, 23);
			this.btnChangeSSIS.TabIndex = 14;
			this.btnChangeSSIS.Text = "Change";
			this.btnChangeSSIS.UseVisualStyleBackColor = true;
			this.btnChangeSSIS.Click += new System.EventHandler(this.btnChangeSSIS_Click);
			// 
			// txtError
			// 
			this.txtError.Location = new System.Drawing.Point(15, 255);
			this.txtError.Name = "txtError";
			this.txtError.Size = new System.Drawing.Size(480, 20);
			this.txtError.TabIndex = 7;
			this.txtError.Validated += new System.EventHandler(this.txtError_Validated);
			// 
			// label4
			// 
			this.label4.AutoSize = true;
			this.label4.Location = new System.Drawing.Point(12, 239);
			this.label4.Name = "label4";
			this.label4.Size = new System.Drawing.Size(89, 13);
			this.label4.TabIndex = 3;
			this.label4.Text = "Error Folder Path:";
			// 
			// txtStore
			// 
			this.txtStore.Location = new System.Drawing.Point(15, 178);
			this.txtStore.Name = "txtStore";
			this.txtStore.Size = new System.Drawing.Size(480, 20);
			this.txtStore.TabIndex = 8;
			this.txtStore.Validated += new System.EventHandler(this.txtStore_Validated);
			// 
			// label3
			// 
			this.label3.AutoSize = true;
			this.label3.Location = new System.Drawing.Point(12, 162);
			this.label3.Name = "label3";
			this.label3.Size = new System.Drawing.Size(92, 13);
			this.label3.TabIndex = 4;
			this.label3.Text = "Store Folder Path:";
			// 
			// txtData
			// 
			this.txtData.Location = new System.Drawing.Point(15, 107);
			this.txtData.Name = "txtData";
			this.txtData.Size = new System.Drawing.Size(480, 20);
			this.txtData.TabIndex = 9;
			this.txtData.Validated += new System.EventHandler(this.txtData_Validated);
			// 
			// label2
			// 
			this.label2.AutoSize = true;
			this.label2.Location = new System.Drawing.Point(12, 91);
			this.label2.Name = "label2";
			this.label2.Size = new System.Drawing.Size(90, 13);
			this.label2.TabIndex = 5;
			this.label2.Text = "Data Folder Path:";
			// 
			// txtSSIS
			// 
			this.txtSSIS.Location = new System.Drawing.Point(15, 39);
			this.txtSSIS.Name = "txtSSIS";
			this.txtSSIS.Size = new System.Drawing.Size(480, 20);
			this.txtSSIS.TabIndex = 10;
			this.txtSSIS.Validated += new System.EventHandler(this.txtSSIS_Validated);
			// 
			// label1
			// 
			this.label1.AutoSize = true;
			this.label1.Location = new System.Drawing.Point(12, 23);
			this.label1.Name = "label1";
			this.label1.Size = new System.Drawing.Size(124, 13);
			this.label1.TabIndex = 6;
			this.label1.Text = "SSIS Package Location:";
			// 
			// Main
			// 
			this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
			this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
			this.ClientSize = new System.Drawing.Size(624, 361);
			this.Controls.Add(this.gbConfiguration);
			this.Controls.Add(this.btnStop);
			this.Controls.Add(this.btnStart);
			this.MaximumSize = new System.Drawing.Size(640, 400);
			this.MinimumSize = new System.Drawing.Size(640, 400);
			this.Name = "Main";
			this.Text = "Service";
			this.FormClosing += new System.Windows.Forms.FormClosingEventHandler(this.Main_FormClosing);
			((System.ComponentModel.ISupportInitialize)(this._errorProvider)).EndInit();
			this.gbConfiguration.ResumeLayout(false);
			this.gbConfiguration.PerformLayout();
			this.ResumeLayout(false);

		}

		#endregion
		private System.Windows.Forms.ErrorProvider _errorProvider;
		private System.Windows.Forms.Button btnStop;
		private System.Windows.Forms.Button btnStart;
		private System.Windows.Forms.GroupBox gbConfiguration;
		private System.Windows.Forms.Button btnChangeError;
		private System.Windows.Forms.Button btnChangeStore;
		private System.Windows.Forms.Button btnChangeData;
		private System.Windows.Forms.Button btnChangeSSIS;
		private System.Windows.Forms.TextBox txtError;
		private System.Windows.Forms.Label label4;
		private System.Windows.Forms.TextBox txtStore;
		private System.Windows.Forms.Label label3;
		private System.Windows.Forms.TextBox txtData;
		private System.Windows.Forms.Label label2;
		private System.Windows.Forms.TextBox txtSSIS;
		private System.Windows.Forms.Label label1;
	}
}

