<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="viewprojects.aspx.cs" Inherits="WebApplication2.viewprojects" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div class="container">
            <div class="row">

                <div class="col-sm-12">
                    <center>
                        <h3>
                        Project List</h3>
                    </center>
                    <div class="row">
                        <div class="col-sm-12 col-md-12">
                            <asp:Panel class="alert alert-success" role="alert" ID="Panel1" runat="server" Visible="False">
                                <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
                            </asp:Panel>
                        </div>
                    </div>
                    <br />
                    <div class="row">
                        <div class="card">
                            <div class="card-body">

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
                <center>
                    <a href="home.aspx">
                        << Back to Home</a><span class="clearfix"></span>
                            <br />
                            <center>
            </div>
        </div>
    </asp:Content>


 

