
namespace P1_3
{
    partial class Form1
    {
        /// <summary>
        ///  Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        ///  Clean up any resources being used.
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
        ///  Required method for Designer support - do not modify
        ///  the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.label1 = new System.Windows.Forms.Label();
            this.server_textbox = new System.Windows.Forms.TextBox();
            this.user_textbox = new System.Windows.Forms.TextBox();
            this.label2 = new System.Windows.Forms.Label();
            this.password_textbox = new System.Windows.Forms.TextBox();
            this.label3 = new System.Windows.Forms.Label();
            this.attempt_button = new System.Windows.Forms.Button();
            this.hello_button = new System.Windows.Forms.Button();
            this.SuspendLayout();
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(42, 37);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(39, 15);
            this.label1.TabIndex = 0;
            this.label1.Text = "Server";
            // 
            // server_textbox
            // 
            this.server_textbox.Location = new System.Drawing.Point(112, 34);
            this.server_textbox.Name = "server_textbox";
            this.server_textbox.Size = new System.Drawing.Size(305, 23);
            this.server_textbox.TabIndex = 1;
            // 
            // user_textbox
            // 
            this.user_textbox.Location = new System.Drawing.Point(112, 80);
            this.user_textbox.Name = "user_textbox";
            this.user_textbox.Size = new System.Drawing.Size(305, 23);
            this.user_textbox.TabIndex = 3;
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(42, 83);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(30, 15);
            this.label2.TabIndex = 2;
            this.label2.Text = "User";
            // 
            // password_textbox
            // 
            this.password_textbox.Location = new System.Drawing.Point(112, 127);
            this.password_textbox.Name = "password_textbox";
            this.password_textbox.Size = new System.Drawing.Size(305, 23);
            this.password_textbox.TabIndex = 5;
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(42, 130);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(57, 15);
            this.label3.TabIndex = 4;
            this.label3.Text = "Password";
            // 
            // attempt_button
            // 
            this.attempt_button.Location = new System.Drawing.Point(112, 179);
            this.attempt_button.Name = "attempt_button";
            this.attempt_button.Size = new System.Drawing.Size(140, 51);
            this.attempt_button.TabIndex = 6;
            this.attempt_button.Text = "Attempt Connection";
            this.attempt_button.UseVisualStyleBackColor = true;
            this.attempt_button.Click += new System.EventHandler(this.attempt_button_Click);
            // 
            // hello_button
            // 
            this.hello_button.Location = new System.Drawing.Point(277, 179);
            this.hello_button.Name = "hello_button";
            this.hello_button.Size = new System.Drawing.Size(140, 51);
            this.hello_button.TabIndex = 7;
            this.hello_button.Text = "Hello Table";
            this.hello_button.UseVisualStyleBackColor = true;
            this.hello_button.Click += new System.EventHandler(this.hello_button_Click);
            // 
            // Form1
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(7F, 15F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(472, 266);
            this.Controls.Add(this.hello_button);
            this.Controls.Add(this.attempt_button);
            this.Controls.Add(this.password_textbox);
            this.Controls.Add(this.label3);
            this.Controls.Add(this.user_textbox);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.server_textbox);
            this.Controls.Add(this.label1);
            this.Name = "Form1";
            this.Text = "Form1";
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.TextBox server_textbox;
        private System.Windows.Forms.TextBox user_textbox;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.TextBox password_textbox;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.Button attempt_button;
        private System.Windows.Forms.Button hello_button;
    }
}

