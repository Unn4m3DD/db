using System;
using System.Data;
using System.Windows.Forms;
using System.Data.SqlClient;
using Microsoft.VisualBasic;
namespace P1_3 {
  public partial class Form1 : Form {
    SqlConnection CN;
    public Form1() {
      InitializeComponent();
    }

    private void TestDBConnection(string dbServer, string dbName, string userName, string userPass) {
      CN = new SqlConnection("Data Source = " + dbServer + " ;" + "Initial Catalog = " + dbName +
          "; uid = " + userName + ";" + "password = " + userPass);
      try {
        CN.Open();
        if (CN.State == ConnectionState.Open) {
          Interaction.MsgBox("Successful connection to database " + CN.Database + " on the " +
          CN.DataSource + " server", MsgBoxStyle.OkOnly, "Connection Test");
        }
      } catch (Exception ex) {
        Interaction.MsgBox(
          "FAILED TO OPEN CONNECTION TO DATABASE DUE TO THE FOLLOWING ERROR" + System.Environment.NewLine +
          ex.Message,
          MsgBoxStyle.Critical, "Connection Test"
        );
      }
      if (CN.State == ConnectionState.Open) CN.Close();
    }

    private string getTableContent(SqlConnection CN) {
      string str = "";

      try {
        CN.Open();
        if (CN.State == ConnectionState.Open) {
          int cnt = 1;
          SqlCommand sqlcmd = new SqlCommand("SELECT * FROM Hello", CN);
          SqlDataReader reader;
          reader = sqlcmd.ExecuteReader();

          while (reader.Read()) {
            str += cnt.ToString() + " - " + reader.GetInt32(reader.GetOrdinal("MsgID")) + ", ";
            str += reader.GetString(reader.GetOrdinal("MsgSubject"));
            str += "\n";
            cnt += 1;
          }
        }
      } catch (Exception ex) {
        MessageBox.Show("FAILED TO OPEN CONNECTION TO DATABASE DUE TO THE FOLLOWING ERROR \r\n" + ex.Message, "Connection Error", MessageBoxButtons.OK);
      }

      if (CN.State == ConnectionState.Open)
        CN.Close();

      return str;
    }




    private void attempt_button_Click(object sender, EventArgs e) {
      TestDBConnection(server_textbox.Text, server_textbox.Text, user_textbox.Text, password_textbox.Text);
    }

    private void hello_button_Click(object sender, EventArgs e) {
      getTableContent(CN);
    }
  }
}
