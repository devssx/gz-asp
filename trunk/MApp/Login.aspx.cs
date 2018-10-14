using System;
using System.Data.SqlClient;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MApp
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.HttpMethod == "POST")
            {
                try
                {
                    using (SqlConnection connection = new SqlConnection(@"Data Source=(localDB)\MSSQLLocalDB; Initial Catalog=asp; User ID=alumnosa; Password=root"))
                    {
                        SqlCommand command = new SqlCommand($"SELECT TOP(1) email, pass, name, lastname FROM users WHERE email=@email and pass=@pass", connection);
                        command.Parameters.AddWithValue("@email", Request["email"]);
                        command.Parameters.AddWithValue("@pass", Request["pass"]);
                        connection.Open();

                        SqlDataReader reader = command.ExecuteReader();
                        try
                        {
                            while (reader.Read())
                            {
                                ViewState["result"] = $"{reader[0]} : {reader[1]}";
                            }
                        }
                        finally
                        {
                            // Always call Close when done reading.
                            reader.Close();
                        }
                    }
                }
                catch (Exception ex)
                {
                    ViewState["result"] = ("error" + ex.ToString());
                }
            }
        }
    }
}