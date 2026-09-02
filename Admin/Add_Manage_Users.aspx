<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" 
    CodeFile="Add_Manage_Users.aspx.cs" Inherits="Admin_Add_Manage_Users" 
    EnableEventValidation="true" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
      <style>
        .user-card {
            background: white;
            border-radius: 10px;
            padding: 20px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
            margin-bottom: 20px;
        }
        .role-badge-admin {
            background-color: #dc3545;
            color: white;
            padding: 5px 15px;
            border-radius: 20px;
            font-weight: bold;
        }
        .role-badge-member {
            background-color: #17a2b8;
            color: white;
            padding: 5px 15px;
            border-radius: 20px;
            font-weight: bold;
        }
        .role-badge-reader {
            background-color: #6c757d;
            color: white;
            padding: 5px 15px;
            border-radius: 20px;
            font-weight: bold;
        }
        .status-active {
            color: #28a745;
            font-weight: bold;
        }
        .status-inactive {
            color: #dc3545;
            font-weight: bold;
        }
        .table-users {
            background: white;
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
        }
        .table-users thead {
            background: linear-gradient(135deg, #17a2b8, #138496);
            color: white;
        }
        .table-users th {
            padding: 15px;
            font-weight: bold;
            border: none;
        }
        .table-users td {
            padding: 12px 15px;
            vertical-align: middle;
        }
        .btn-action {
            padding: 4px 10px;
            margin: 0 2px;
            font-size: 12px;
        }
        .search-box {
            background: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
            margin-bottom: 20px;
        }
        .stats-card {
            background: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
            text-align: center;
            margin-bottom: 20px;
        }
        .stats-number {
            font-size: 32px;
            font-weight: bold;
            color: #17a2b8;
        }
        .stats-label {
            color: #6c757d;
            font-size: 14px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
  <div class="container mt-4">
        <!-- عنوان الصفحة -->
        <div class="row mb-4">
            <div class="col-12">
                <h2 class="text-center text-info">
                    <i class="fas fa-users-cog"></i>
                    إدارة المستخدمين والأدوار
                </h2>
                <hr />
            </div>
        </div>

        <!-- رسالة النجاح/الخطأ -->
        <asp:Panel ID="pnlMessage" runat="server" Visible="false">
            <div id="divMessage" runat="server" class="alert"></div>
        </asp:Panel>

        <!-- إحصائيات -->
        <div class="row mb-4">
            <div class="col-md-3 col-sm-6">
                <div class="stats-card">
                    <div class="stats-number"><asp:Label ID="lblTotalUsers" runat="server" Text="0" /></div>
                    <div class="stats-label">إجمالي المستخدمين</div>
                </div>
            </div>
            <div class="col-md-3 col-sm-6">
                <div class="stats-card">
                    <div class="stats-number" style="color: #dc3545;"><asp:Label ID="lblAdmins" runat="server" Text="0" /></div>
                    <div class="stats-label">المسؤولون</div>
                </div>
            </div>
            <div class="col-md-3 col-sm-6">
                <div class="stats-card">
                    <div class="stats-number" style="color: #17a2b8;"><asp:Label ID="lblMembers" runat="server" Text="0" /></div>
                    <div class="stats-label">الأعضاء</div>
                </div>
            </div>
            <div class="col-md-3 col-sm-6">
                <div class="stats-card">
                    <div class="stats-number" style="color: #28a745;"><asp:Label ID="lblActive" runat="server" Text="0" /></div>
                    <div class="stats-label">المستخدمون النشطون</div>
                </div>
            </div>
        </div>

        <!-- شريط الأدوات -->
        <div class="row mb-3">
            <div class="col-md-6">
                <div class="search-box">
                    <div class="input-group">
                        <asp:TextBox ID="txtSearch" runat="server" CssClass="form-control" 
                            placeholder="ابحث عن مستخدم..." />
                        <div class="input-group-append">
                            <asp:Button ID="btnSearch" runat="server" Text="بحث" 
                                CssClass="btn btn-info" OnClick="btnSearch_Click" />
                            <asp:Button ID="btnClearSearch" runat="server" Text="مسح" 
                                CssClass="btn btn-secondary" OnClick="btnClearSearch_Click" />
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-6 text-left">
                <button type="button" class="btn btn-success btn-lg" data-toggle="modal" data-target="#addUserModal">
                    <i class="fas fa-user-plus"></i> إضافة مستخدم جديد
                </button>
            </div>
        </div>

        <!-- جدول المستخدمين -->
        <div class="table-users">
    <asp:GridView ID="gvUsers" runat="server" 
        AutoGenerateColumns="False" 
        DataKeyNames="ID"
        CssClass="table table-hover mb-0"
        OnRowCommand="gvUsers_RowCommand"
        OnRowDataBound="gvUsers_RowDataBound"
        EmptyDataText="لا يوجد مستخدمون">
        <Columns>
            <asp:BoundField DataField="ID" HeaderText="م" ItemStyle-Width="50px" />
            <asp:BoundField DataField="UserName" HeaderText="اسم المستخدم" />
            <asp:TemplateField HeaderText="الدور">
                <ItemTemplate>
                    <span class='<%# GetRoleBadgeClass(Eval("RoleName").ToString()) %>'>
                        <%# Eval("RoleName") %>
                    </span>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="الحالة">
                <ItemTemplate>
                    <span class='<%# (bool)Eval("IsActive") ? "status-active" : "status-inactive" %>'>
                        <i class='<%# (bool)Eval("IsActive") ? "fas fa-check-circle" : "fas fa-times-circle" %>'></i>
                        <%# (bool)Eval("IsActive") ? "نشط" : "معطل" %>
                    </span>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="CreatedDate" HeaderText="تاريخ الإضافة" DataFormatString="{0:yyyy-MM-dd}" />
            <asp:BoundField DataField="CreatedBy" HeaderText="أضيف بواسطة" />
            <asp:TemplateField HeaderText="الإجراءات" ItemStyle-Width="220px">
                <ItemTemplate>
                    <!-- ✅ زر التعديل - يستخدم CommandName -->
                    <asp:LinkButton ID="lnkEdit" runat="server" 
                        CssClass="btn btn-warning btn-action"
                        CommandName="EditUser" 
                        CommandArgument='<%# Eval("ID") %>'>
                        <i class="fas fa-edit"></i> تعديل
                    </asp:LinkButton>
                    
                    <!-- ✅ زر تبديل الحالة - CommandArgument بسيط -->
                    <asp:LinkButton ID="lnkToggle" runat="server" 
                        CssClass='<%# (bool)Eval("IsActive") ? "btn btn-secondary btn-action" : "btn btn-success btn-action" %>'
                        CommandName="ToggleStatus" 
                        CommandArgument='<%# Eval("ID") %>'>
                        <i class="fas fa-power-off"></i>
                        <%# (bool)Eval("IsActive") ? "تعطيل" : "تفعيل" %>
                    </asp:LinkButton>
                    
                    <!-- ✅ زر الحذف -->
                    <asp:LinkButton ID="lnkDelete" runat="server" 
                        CssClass="btn btn-danger btn-action"
                        CommandName="DeleteUser" 
                        CommandArgument='<%# Eval("ID") %>'
                        OnClientClick="return confirm('هل أنت متأكد من حذف هذا المستخدم؟');">
                        <i class="fas fa-trash"></i> حذف
                    </asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
</div>

<!-- ✅ HiddenFields لتخزين بيانات المستخدم المختار للتعديل -->
<asp:HiddenField ID="hfEditId" runat="server" />
<asp:HiddenField ID="hfEditUserName" runat="server" />
<asp:HiddenField ID="hfEditRole" runat="server" />
<asp:HiddenField ID="hfEditIsActive" runat="server" />
    </div>

    <!-- ============ Modal: إضافة مستخدم جديد ============ -->
    <div class="modal fade" id="addUserModal" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header bg-success text-white">
                    <h5 class="modal-title">
                        <i class="fas fa-user-plus"></i> إضافة مستخدم جديد
                    </h5>
                    <button type="button" class="close text-white" data-dismiss="modal">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <label><i class="fas fa-user"></i> اسم المستخدم (Login Name):</label>
                        <asp:TextBox ID="txtNewUserName" runat="server" CssClass="form-control" 
                            placeholder="مثال: ahmed.mohamed" />
                        <asp:RequiredFieldValidator ID="rfvNewUserName" runat="server" 
                            ControlToValidate="txtNewUserName" 
                            ErrorMessage="* اسم المستخدم مطلوب" 
                            ForeColor="Red" Display="Dynamic" />
                        <asp:RegularExpressionValidator ID="revNewUserName" runat="server" 
                            ControlToValidate="txtNewUserName"
                            ValidationExpression="^[a-zA-Z0-9._\-@]+$"
                            ErrorMessage="* اسم المستخدم يحتوي على أحرف غير مسموحة" 
                            ForeColor="Red" Display="Dynamic" />
                    </div>
                    <div class="form-group">
                        <label><i class="fas fa-user-tag"></i> الدور:</label>
                        <asp:DropDownList ID="ddlNewRole" runat="server" CssClass="form-control">
                            <asp:ListItem Value="Member" Selected="True">Member (عضو)</asp:ListItem>
                            <asp:ListItem Value="Admin">Admin (مسؤول)</asp:ListItem> 
                        </asp:DropDownList>
                    </div>
                    <div class="form-group">
                        <div class="custom-control custom-switch">
                            <asp:CheckBox ID="chkNewActive" runat="server" Checked="true" 
                                CssClass="custom-control-input" />
                            <label class="custom-control-label">نشط</label>
                        </div>
                    </div>
                    <asp:Label ID="lblNewError" runat="server" CssClass="text-danger" />
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">إلغاء</button>
                    <asp:Button ID="btnAddUser" runat="server" Text="إضافة" 
                        CssClass="btn btn-success" OnClick="btnAddUser_Click" />
                </div>
            </div>
        </div>
    </div>

<!-- ============ Modal: تعديل مستخدم ============ -->
<div class="modal fade" id="editUserModal" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header bg-warning text-white">
                <h5 class="modal-title">
                    <i class="fas fa-user-edit"></i> تعديل مستخدم
                </h5>
                <button type="button" class="close text-white" data-dismiss="modal">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <div class="form-group">
                    <label><i class="fas fa-user"></i> اسم المستخدم:</label>
                    <asp:TextBox ID="txtEditUserName" runat="server" CssClass="form-control" />
                    <asp:RequiredFieldValidator ID="rfvEditUserName" runat="server" 
                        ControlToValidate="txtEditUserName" 
                        ErrorMessage="* اسم المستخدم مطلوب" 
                        ForeColor="Red" Display="Dynamic" 
                        ValidationGroup="EditGroup" />
                </div>
                <div class="form-group">
                    <label><i class="fas fa-user-tag"></i> الدور:</label>
                    <asp:DropDownList ID="ddlEditRole" runat="server" CssClass="form-control">
                        <asp:ListItem Value="Member">Member (عضو)</asp:ListItem>
                        <asp:ListItem Value="Admin">Admin (مسؤول)</asp:ListItem>
                     <%--   <asp:ListItem Value="Reader">Reader (قارئ)</asp:ListItem>--%>
                    </asp:DropDownList>
                </div>
                <div class="form-group">
                    <div class="custom-control custom-switch">
                        <asp:CheckBox ID="chkEditActive" runat="server" 
                            CssClass="custom-control-input" />
                        <label class="custom-control-label">نشط</label>
                    </div>
                </div>
                <asp:Label ID="lblEditError" runat="server" CssClass="text-danger" />
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">إلغاء</button>
                <asp:Button ID="btnUpdateUser" runat="server" Text="حفظ التعديلات" 
                    CssClass="btn btn-warning" 
                    OnClick="btnUpdateUser_Click"
                    ValidationGroup="EditGroup" />
            </div>
        </div>
    </div>
</div>

    <!-- JavaScript للتعامل مع Modal التعديل -->
    <script>
        function setEditData(id, userName, roleName, isActive) {
            document.getElementById('<%= hfEditId.ClientID %>').value = id;
            document.getElementById('<%= txtEditUserName.ClientID %>').value = userName;
            document.getElementById('<%= ddlEditRole.ClientID %>').value = roleName;
            document.getElementById('<%= chkEditActive.ClientID %>').checked = isActive;
        }
    </script>
</asp:Content>

