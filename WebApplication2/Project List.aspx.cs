using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication2
{
    public partial class Project_List : System.Web.UI.Page
    {

        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                fillProjectOwnerValues();
            }

            GridView1.DataBind();
        }
        // go button click
        protected void Button4_Click(object sender, EventArgs e)
        {
            getProjectByID();
        }
        // update button click
        protected void Button3_Click(object sender, EventArgs e)
        {
            updateProjectByID();
        }
        // delete button click
        protected void Button2_Click(object sender, EventArgs e)
        {
            deleteProjectByID();
        }
        // add button click
        protected void Button1_Click(object sender, EventArgs e)
        {
            if (checkIfProjectExists())
            {
                Response.Write("<script>alert('Project Already Exists, try some other Project ID');</script>");
            }
            else
            {
                addNewProject();
            }
        }


        void deleteProjectByID()
        {
            if (checkIfProjectExists())
            {
                try
                {
                    SqlConnection con = new SqlConnection(strcon);
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }

                    SqlCommand cmd = new SqlCommand("DELETE from project_list_tbl WHERE project_id='" + TextBox1.Text.Trim() + "'", con);

                    cmd.ExecuteNonQuery();
                    con.Close();
                    Response.Write("<script>alert('Project Deleted Successfully');</script>");

                    GridView1.DataBind();

                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert('" + ex.Message + "');</script>");
                }

            }
            else
            {
                Response.Write("<script>alert('Invalid Developer ID');</script>");
            }
        }

        void updateProjectByID()
        {

            if (checkIfProjectExists())
            {
                try
                {
                    string typeofprojects = "";
                    foreach (int i in ListBox1.GetSelectedIndices())
                    {
                        typeofprojects = typeofprojects + ListBox1.Items[i] + ",";
                    }
                    typeofprojects = typeofprojects.Remove(typeofprojects.Length - 1);

                    SqlConnection con = new SqlConnection(strcon);
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }
                    SqlCommand cmd = new SqlCommand("UPDATE project_list_tbl set project_name=@project_name, type_of_project=@type_of_project, project_owner_Name=@project_owner_Name, ordered_by=@ordered_by, registered_date=@registered_date, programming_language=@programming_language,project_description=@project_description where project_id='" + TextBox1.Text.Trim() + "'", con);

                    cmd.Parameters.AddWithValue("@project_name", TextBox2.Text.Trim());
                    cmd.Parameters.AddWithValue("@type_of_project", typeofprojects);
                    cmd.Parameters.AddWithValue("@project_owner_Name", DropDownList2.SelectedItem.Value);
                    cmd.Parameters.AddWithValue("@ordered_by", DropDownList4.SelectedItem.Value);
                    cmd.Parameters.AddWithValue("@registered_date", TextBox4.Text.Trim());
                    cmd.Parameters.AddWithValue("@programming_language", DropDownList1.SelectedItem.Value);
                    cmd.Parameters.AddWithValue("@project_description", TextBox6.Text.Trim());

                    cmd.ExecuteNonQuery();
                    con.Close();
                    GridView1.DataBind();
                    Response.Write("<script>alert('Project Updated Successfully');</script>");


                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert('" + ex.Message + "');</script>");
                }
            }
            else
            {
                Response.Write("<script>alert('Invalid Project ID');</script>");
            }
        }


        void getProjectByID()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT * from project_list_tbl WHERE project_id='" + TextBox1.Text.Trim() + "';", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                if (dt.Rows.Count >= 1)
                {
                    TextBox2.Text = dt.Rows[0]["project_name"].ToString();
                    TextBox4.Text = dt.Rows[0]["registered_date"].ToString();
                    TextBox6.Text = dt.Rows[0]["project_description"].ToString();

                    DropDownList1.SelectedValue = dt.Rows[0]["programming_language"].ToString().Trim();
                    DropDownList2.SelectedValue = dt.Rows[0]["project_owner_Name"].ToString().Trim();
                    DropDownList4.SelectedValue = dt.Rows[0]["ordered_by"].ToString().Trim();

                    ListBox1.ClearSelection();
                    string[] type_of_project = dt.Rows[0]["type_of_project"].ToString().Trim().Split(',');
                    for (int i = 0; i < type_of_project.Length; i++)
                    {
                        for (int j = 0; j < ListBox1.Items.Count; j++)
                        {
                            if (ListBox1.Items[j].ToString() == type_of_project[i])
                            {
                                ListBox1.Items[j].Selected = true;

                            }
                        }
                    }

                }
                else
                {
                    Response.Write("<script>alert('Invalid Project ID');</script>");
                }

            }
            catch (Exception ex)
            {

            }
        }

        void fillProjectOwnerValues()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT project_owner_Name from project_owner_tbl;", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                DropDownList1.DataSource = dt;
                DropDownList1.DataValueField = "project_owner_Name";
                DropDownList1.DataBind();



            }
            catch (Exception ex)
            {

            }
        }



        bool checkIfProjectExists()
        {
            try
            {

                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("SELECT * from project_list_tbl where project_id='" + TextBox1.Text.Trim() + "' OR book_name='" + TextBox2.Text.Trim() + "';", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                if (dt.Rows.Count >= 1)
                {
                    return true;
                }
                else
                {
                    return false;
                }


            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
                return false;
            }
        }

        void addNewProject()
        {
            try
            {
                string typeofprojects = "";
                foreach (int i in ListBox1.GetSelectedIndices())
                {
                    typeofprojects = typeofprojects + ListBox1.Items[i] + ",";
                }
                typeofprojects = typeofprojects.Remove(typeofprojects.Length - 1);

                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("INSERT INTO project_list_tbl(project_id,project_name,type_of_project,project_owner_Name,ordered_by,registered_date,programming_language,project_description) values(@project_id,@project_name,@type_of_project,@project_owner_Name,@ordered_by,@registered_date,@programming_language,@project_description)", con);

                cmd.Parameters.AddWithValue("@project_id", TextBox1.Text.Trim());
                cmd.Parameters.AddWithValue("@project_name", TextBox2.Text.Trim());
                cmd.Parameters.AddWithValue("@type_of_project", typeofprojects);
                cmd.Parameters.AddWithValue("@project_owner_Name", DropDownList2.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@ordered_by", DropDownList4.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@registered_date", TextBox4.Text.Trim());
                cmd.Parameters.AddWithValue("@programming_language", DropDownList1.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@project_description", TextBox6.Text.Trim());

                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('Project added successfully.');</script>");
                GridView1.DataBind();

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }
    }
}