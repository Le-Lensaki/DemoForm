<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm.aspx.cs" Inherits="DemoWeb.WebForm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="Scripts/jquery-3.6.0.js" type="text/javascript"></script>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager runat="server" ID="mid1" EnablePageMethods="true" />
        <div>
            <script type="text/javascript">
                function getValues() {
                    var text1 = $('#txtTaiKhoan').val();
                    var text2 = $('#txtPass').val();
                    var text3 = $('#txtEmail').val();
                    PageMethods.getValues(text1, text2, text3, getValues_Success);
                }
                
                function getValues_Success(msg) {
                    $('#test').html(msg);
                }
                function getValues_Fail(msg) {
                    alert(msg.get_message());
                }
            </script>
            Tài khoản<br />
            <asp:Textbox type="text" id="txtTaiKhoan" runat="server" />
            <br />
            Mật khẩu<br />
            <asp:Textbox type="password" id="txtPass" runat="server" />
            <br />
            Email<br />
            <asp:Textbox type="email" id="txtEmail" runat="server" />
            <br />
            <input type="button" id="btnSubmit" onclick="getValues();" value="Submit" />
            <input type="reset" id="btnreset" value="Clear" />                                                                                                                        
            <asp:Button ID="btnInsert" runat="server" Text="Insert" OnClick="add" />
            <asp:Button ID="btnUpdate" runat="server" Text="Update" OnClick="update" />
            <asp:Button ID="btnDelete" runat="server" Text="Delete" OnClick="delete"  />
            <br />
            <br />
            <div id="test"></div>
            <asp:GridView runat="server" ID="dataGV" DatasourceID="SqlDataSource1" OnSelectedIndexChanged="dataGV_SelectedIndexChanged">
                <Columns>
                    <asp:CommandField ButtonType="Button" SelectText="Sửa" ShowSelectButton="True" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" ConnectionString="<%$ ConnectionStrings:DemoWebConnectionString %>" runat="server" SelectCommand="SELECT * FROM [NguoiDung]" InsertCommand="INSERT INTO NguoiDung(username,pass,email) VALUES (@username,@pass,@email)" UpdateCommand="update NguoiDung
                 set username = @username, pass = @password, email = @email
                 where username = @username" DeleteCommand="DELETE FROM NguoiDung where username = @username">
                <DeleteParameters>
                    <asp:ControlParameter ControlID="txtTaiKhoan" Name="username" PropertyName="Text" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:ControlParameter ControlID="txtTaiKhoan" Name="username" PropertyName="Text" />
                    <asp:ControlParameter ControlID="txtPass" Name="pass" PropertyName="Text" />
                    <asp:ControlParameter ControlID="txtEmail" Name="email" PropertyName="Text" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:ControlParameter ControlID="txtTaiKhoan" Name="username" PropertyName="Text" />
                    <asp:ControlParameter ControlID="txtPass" Name="password" PropertyName="Text" />
                    <asp:ControlParameter ControlID="txtEmail" Name="email" PropertyName="Text" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </div>
        
    </form>
        
            
            
           
</body>
</html>
