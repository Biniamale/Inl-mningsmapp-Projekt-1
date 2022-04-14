<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Project List.aspx.cs" Inherits="WebApplication2.Project_List" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
               $(document).ready(function () {
                   $(".table").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();
               });
</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid">
      <div class="row">
         <div class="col-md-5">
            <div class="card">
               <div class="card-body">
                  <div class="row">
                     <div class="col">
                        <center>
                           <h4>Project Details</h4>
                        </center>
                     </div>
                  </div>

                  <div class="row">
                     <div class="col">
                        <hr>
                     </div>
                  </div>

                  <div class="row">
                     <div class="col-md-4">
                        <label>Project ID</label>
                        <div class="form-group">
                           <div class="input-group">
                              <asp:TextBox CssClass="form-control" ID="TextBox1" runat="server" placeholder="Project ID"></asp:TextBox>
                              <asp:Button class="form-control btn btn-primary" ID="Button4" runat="server" Text="Go" OnClick="Button4_Click" />
                           </div>
                        </div>
                     </div>
                     <div class="col-md-8">
                        <label>Project Name</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="TextBox2" runat="server" placeholder="Project Name"></asp:TextBox>
                        </div>
                     </div>
                  </div>

                  <div class="row">
                     <div class="col-md-4">
                        <label>Programming languages</label>
                        <div class="form-group">
                           <asp:DropDownList class="form-control" ID="DropDownList1" runat="server">
                              <asp:ListItem Text="Python" Value="Python" />
                              <asp:ListItem Text="Java " Value="Java " />
                              <asp:ListItem Text="C#" Value="C#" />
                              <asp:ListItem Text="PHP" Value="PHP" />
                              <asp:ListItem Text="Swift" Value="Swift" />
                           </asp:DropDownList>
                        </div>
                        <label>Project Owner</label>
                        <div class="form-group">
                           <asp:DropDownList class="form-control" ID="DropDownList2" runat="server">
                              <asp:ListItem Text="Owner 1" Value="Owner 1" />
                              <asp:ListItem Text="Owner 2" Value="Owner 2" />
                           </asp:DropDownList>
                        </div>
                     </div>
                     <div class="col-md-4">
                        <label>Ordered By</label>
                        <div class="form-group">
                           <asp:DropDownList class="form-control" ID="DropDownList4" runat="server">
                              <asp:ListItem Text="A1" Value="a1" />
                              <asp:ListItem Text="a2" Value="a2" />
                           </asp:DropDownList>
                        </div>
                       <label>Project Registered Date</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="TextBox4" runat="server" placeholder="Date" TextMode="Date"></asp:TextBox>
                        </div>
                     </div>
                     <div class="col-md-4">
                        <label>Type of Project</label>
                        <div class="form-group">
                           <asp:ListBox CssClass="form-control" ID="ListBox1" runat="server" SelectionMode="Multiple" Rows="5">
                              <asp:ListItem Text="Web development" Value="Web development" />
                              <asp:ListItem Text="Software development" Value="Software development" />
                              <asp:ListItem Text="Mobile app development" Value="Mobile app development" />
                              <asp:ListItem Text="Software implementation" Value="Software implementation" />
                              <asp:ListItem Text="Database management" Value="Database management" />                            
                           </asp:ListBox>
                        </div>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col-12">
                        <label>Project Description</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="TextBox6" runat="server" placeholder="Book Description" TextMode="MultiLine" Rows="2"></asp:TextBox>
                        </div>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col-4">
                        <asp:Button ID="Button1" class="btn btn-lg btn-block btn-success" runat="server" Text="Add" OnClick="Button1_Click"  />
                     </div>
                     <div class="col-4">
                        <asp:Button ID="Button3" class="btn btn-lg btn-block btn-warning" runat="server" Text="Update" OnClick="Button3_Click" />
                     </div>
                     <div class="col-4">
                        <asp:Button ID="Button2" class="btn btn-lg btn-block btn-danger" runat="server" Text="Delete" OnClick="Button2_Click" />
                     </div>
                  </div>
               </div>
            </div>
            <a href="homepage.aspx"><< Back to Home</a><br>
            <br>
         </div>
         <div class="col-md-7">
            <div class="card">
               <div class="card-body">
                  <div class="row">
                     <div class="col">
                        <center>
                           <h4>Project List</h4>
                        </center>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col">
                        <hr>
                     </div>
                  </div>
                  <div class="row">
                      <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Project 1DBConnectionString2 %>" SelectCommand="SELECT * FROM [project_list_tbl]"></asp:SqlDataSource>
                     <div class="col">
                <asp:GridView class="table table-striped table-bordered" ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" DataKeyNames="project_id" >
                    <Columns>
                        <asp:BoundField DataField="project_id" HeaderText="project_id" SortExpression="project_id" ReadOnly="True" />
                        <asp:BoundField DataField="project_name" HeaderText="project_name" SortExpression="project_name" />
                        <asp:BoundField DataField="type_of_project" HeaderText="type_of_project" SortExpression="type_of_project" />
                        <asp:BoundField DataField="project_owner_Name" HeaderText="project_owner_Name" SortExpression="project_owner_Name" />
                        <asp:BoundField DataField="ordered_by" HeaderText="ordered_by" SortExpression="ordered_by" />
                        <asp:BoundField DataField="registered_date" HeaderText="registered_date" SortExpression="registered_date" />
                        <asp:BoundField DataField="programming_language" HeaderText="programming_language" SortExpression="programming_language" />
                        <asp:BoundField DataField="project_description" HeaderText="project_description" SortExpression="project_description" />
                    </Columns>
                    
                           
                        </asp:GridView>
                     </div>
                  </div>
               </div>
            </div>
         </div>
      </div>
   </div>
</asp:Content>