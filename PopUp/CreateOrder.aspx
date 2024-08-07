<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMaster.Master" AutoEventWireup="true" CodeBehind="CreateOrder.aspx.cs" Inherits="Web.App.Transaction.CreateOrder" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- Button trigger modal -->
    <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
        Launch demo modal
    </button>


    <button type="button" class="btn btn-primary" id="openModalButton">
        Launch demo modal
    </button>

    <section>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CssClass="table table-striped" OnRowCommand="GridView1_RowCommand">
            <Columns>
                <asp:BoundField DataField="ProductID" HeaderText="Product ID" />
                <asp:BoundField DataField="ProductName" HeaderText="Product Name" />
                <asp:BoundField DataField="Price" HeaderText="Price" DataFormatString="{0:C}" />
                <asp:BoundField DataField="Description" HeaderText="Description" />
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:Button runat="server" Text="Button" ID="btnShow" CommandName="Select" CommandArgument='<%#Container.DataItemIndex %>' />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </section>

    <!-- Modal -->
    <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h1 class="modal-title fs-5" id="exampleModalLabel">
                        <asp:Label ID="lblTitle" runat="server" Text="Label"></asp:Label></h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <div class="col-lg-3">
                            <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
                            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                        </div>
                        <div class="col-lg-3">
                            <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
                            <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <asp:HiddenField ID="HF_rowIndex" runat="server" />
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    <asp:Button ID="btnSave" runat="server" Text="Save changes" OnClick="btnSave_Click" />
                    <%--<button type="button" class="btn btn-primary">Save changes</button>--%>
                </div>
            </div>
        </div>
    </div>

    <script>

        document.getElementById('openModalButton').onclick = function () {
            var myModal = new bootstrap.Modal(document.getElementById('exampleModal'), {
                keyboard: false
            });
            myModal.show();
        }
        function showModal() {
            debugger;
            var myModal = new bootstrap.Modal(document.getElementById('exampleModal'), {
                keyboard: false
            });
            myModal.show();
        }
</script>

</asp:Content>
