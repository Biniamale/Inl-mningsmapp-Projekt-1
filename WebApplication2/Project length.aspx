<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Project length.aspx.cs" Inherits="WebApplication2.Project_length" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
          $(document).ready(function () {
              $(".table").prepend($("< thead ></thead > ").append($(this).find("tr: first"))).dataTable();
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
									<h4>Project Duration</h4>
								</center>
							</div>
						</div>

						<div class="row">
							<div class="col">
								<hr>
								</div>
							</div>
							<div class="row">
								<div class="col-md-6">
									<label>Developer ID</label>
									<div class="form-group">
										<asp:TextBox CssClass="form-control" ID="TextBox2" runat="server" placeholder="Developer ID"></asp:TextBox>
									</div>
								</div>
								<div class="col-md-6">
									<label>Project ID</label>
									<div class="input-group">
										<asp:TextBox class="form-control" ID="TextBox1" runat="server" placeholder="Project ID"></asp:TextBox>
										<asp:Button for="TextBox1" class="btn btn-dark" ID="Button1" runat="server" Text="Go"  />
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-md-6">
									<label>Developer Name</label>
									<div class="form-group">
										<asp:TextBox CssClass="form-control" ID="TextBox3" runat="server" placeholder="Owner Name" ReadOnly="False"></asp:TextBox>
									</div>
								</div>
								<div class="col-md-6">
									<label>Project Name</label>
									<div class="form-group">
										<asp:TextBox CssClass="form-control" ID="TextBox4" runat="server" placeholder="Project Name" ReadOnly="False"></asp:TextBox>
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-md-6">
									<label>Start Date</label>
									<div class="form-group">
										<asp:TextBox CssClass="form-control" ID="TextBox5" runat="server" placeholder="Start Date" TextMode="Date"></asp:TextBox>
									</div>
								</div>
								<div class="col-md-6">
									<label>Finished Date</label>
									<div class="form-group">
										<asp:TextBox CssClass="form-control" ID="TextBox6" runat="server" placeholder="Finished Date" TextMode="Date"></asp:TextBox>
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-6">
									<asp:Button ID="Button2" class="btn btn-lg btn-block btn-primary" runat="server" Text="Start" />
								</div>
								<div class="col-6">
									<asp:Button ID="Button4" class="btn btn-lg btn-block btn-success" runat="server" Text="Finished" />
								</div>
							</div>
						</div>
					</div>
					<a href="homepage.aspx"><< Back to Home
					</a>
					<br>
						<br>
						</div>
						<div class="col-md-7">
							<div class="card">
								<div class="card-body">
									<div class="row">
										<div class="col">
											<center>
												<h4>Started Project List</h4>
											</center>
										</div>
									</div>
									<div class="row">
										<div class="col">
											<hr>
											</div>
										</div>
										<div class="row">
											<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Project 1DBConnectionString2 %>" SelectCommand="SELECT * FROM [project_length_tbl]"></asp:SqlDataSource>
											<div class="col">
									
                                               <asp:GridView class="table table-striped table-bordered" ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" >
                                                   <Columns>
                                                       <asp:BoundField DataField="developer_id" HeaderText="developer_id" SortExpression="developer_id" />
                                                       <asp:BoundField DataField="developer_name" HeaderText="developer_name" SortExpression="developer_name" />
                                                       <asp:BoundField DataField="project_id" HeaderText="project_id" SortExpression="project_id" />
                                                       <asp:BoundField DataField="project_name" HeaderText="project_name" SortExpression="project_name" />
                                                       <asp:BoundField DataField="start_date" HeaderText="start_date" SortExpression="start_date" />
                                                       <asp:BoundField DataField="finished_date" HeaderText="finished_date" SortExpression="finished_date" />
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