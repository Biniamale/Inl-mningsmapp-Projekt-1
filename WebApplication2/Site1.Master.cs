using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication2
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (Session["role"].Equals(""))
                {
                    LinkButton1.Visible = true; // developer login link button
                    LinkButton2.Visible = true; // developer sign up link button

                    LinkButton3.Visible = false; // logout link button
                    LinkButton7.Visible = false; // hello developer link button


                    LinkButton6.Visible = true; // admin login link button
                    LinkButton5.Visible = false; // Project Owner link button
                    LinkButton8.Visible = false; // Project length link button
                    LinkButton9.Visible = false; // Project List link button
                    LinkButton10.Visible = false; // Developers Management link button

                }
                else if (Session["role"].Equals("user"))
                {
                    LinkButton1.Visible = false; // user login link button
                    LinkButton2.Visible = false; // sign up link button

                    LinkButton3.Visible = true; // logout link button
                    LinkButton7.Visible = true; // hello user link button
                    LinkButton7.Text = "Hello " + Session["username"].ToString();


                    LinkButton6.Visible = true; // admin login link button
                    LinkButton5.Visible = false; // Project Owner link button
                    LinkButton8.Visible = false; // Project length link button
                    LinkButton9.Visible = false; // Project List link button
                    LinkButton10.Visible = false; // Developers Management link button
                }
                else if (Session["role"].Equals("admin"))
                {
                    LinkButton1.Visible = false; // user login link button
                    LinkButton2.Visible = false; // sign up link button

                    LinkButton3.Visible = true; // logout link button
                    LinkButton7.Visible = true; // hello user link button
                    LinkButton7.Text = "Hello Admin";


                    LinkButton6.Visible = false; // admin login link button
                    LinkButton5.Visible = true; // Project Owner link button
                    LinkButton8.Visible = true; // Project length link button
                    LinkButton9.Visible = true; // Project List link button
                    LinkButton10.Visible = true; // Developers Management link button
                }
            }
            catch (Exception ex)
            {

            }
        }

        protected void LinkButton6_Click1(object sender, EventArgs e)
        {
            Response.Redirect("adminlogin.aspx");
        }

        protected void LinkButton5_Click(object sender, EventArgs e)
        {
            Response.Redirect("Project Owner.aspx");
        }
        protected void LinkButton8_Click1(object sender, EventArgs e)
        {
            Response.Redirect("Project length.aspx");
        }

        protected void LinkButton9_Click1(object sender, EventArgs e)
        {
            Response.Redirect("Project List.aspx");
        }

        protected void LinkButton10_Click1(object sender, EventArgs e)
        {
            Response.Redirect("Developers Management.aspx");
        }

        protected void LinkButton4_Click1(object sender, EventArgs e)
        {
            Response.Redirect("viewprojects.aspx");
        }

        protected void LinkButton1_Click1(object sender, EventArgs e)
        {
            Response.Redirect("Developerlogin.aspx");
        }

        protected void LinkButton2_Click1(object sender, EventArgs e)
        {
            Response.Redirect("Developer Signup.aspx");
        }
        //logout button
        protected void LinkButton3_Click1(object sender, EventArgs e)
        {
            Session["username"] = "";
            Session["fullname"] = "";
            Session["role"] = "";
            Session["status"] = "";

            LinkButton1.Visible = true; // developer login link button
            LinkButton2.Visible = true; // developer sign up link button

            LinkButton3.Visible = false; // logout link button
            LinkButton7.Visible = false; // hello developer link button


            LinkButton6.Visible = true; // admin login link button
            LinkButton5.Visible = false; // Project Owner link button
            LinkButton8.Visible = false; // Project length link button
            LinkButton9.Visible = false; // Project list link button
            LinkButton10.Visible = false; // developer management link button
            Response.Redirect("homepage.aspx");
        }


        // view profile
        protected void LinkButton7_Click1(object sender, EventArgs e)
        {
            Response.Redirect("Developer Profilepage.aspx");
        }
    }
}
