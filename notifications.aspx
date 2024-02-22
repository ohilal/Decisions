<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="notifications.aspx.cs" Inherits="notifications" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
   
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

                
                    <span class="noti fa fa-solid fa-bell fa-2xs"><span class="count">&nbsp;</span></span>
                    <div class="noti-content">
                        <div class="noti-top-arrow"></div>
                        <ul id="notiContent"></ul>
                    </div>

    <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
    <asp:GridView ID="GridView1" runat="server"  OnPageIndexChanging="OnPaging">

    </asp:GridView>
     <script src="~/Scripts/jquery-2.2.3.min.js"></script>
        <script src="~/Scripts/jquery.signalR-2.2.0.min.js"></script>
        <script src="/signalr/hubs"></script>
        <script src="~/Scripts/bootstrap.min.js"></script>
     
    
        <script type="text/javascript">
        $(function () {
            // Click on notification icon for show notification
            $('span.noti').click(function (e) {
                e.stopPropagation();
                $('.noti-content').show();
                var count = 0;
                count = parseInt($('span.count').html()) || 0;
                //only load notification if not already loaded
                if (count > 0) {
                    updateNotification();
                }
                $('span.count', this).html('&nbsp;');
            })
            // hide notifications
            $('html').click(function () {
                $('.noti-content').hide();
            })
            // update notification
            function updateNotification() {
                $('#notiContent').empty();
                $('#notiContent').append($('<li>Loading...</li>'));
                $.ajax({
                    type: 'GET',
                    url: '/home/GetNotificationContacts',
                    success: function (response) {
                        $('#notiContent').empty();
                        if (response.length  == 0) {
                            $('#notiContent').append($('<li>No data available</li>'));
                        }
                        $.each(response, function (index, value) {
                            $('#notiContent').append($('<li>New contact : ' + value.ContactName + ' (' + value.ContactNo + ') added</li>'));
                        });
                    },
                    error: function (error) {
                        console.log(error);
                    }
                })
            }
            // update notification count
            function updateNotificationCount() {
                var count = 0;
                count = parseInt($('span.count').html()) || 0;
                count++;
                $('span.count').html(count);
            }
            // signalr js code for start hub and send receive notification
            var notificationHub = $.connection.notificationHub;
            $.connection.hub.start().done(function () {
                console.log('Notification hub started');
            });
            //signalr method for push server message to client
            notificationHub.client.notify = function (message) {
                if (message && message.toLowerCase() == "added") {
                    updateNotificationCount();
                }
            }
        })
        </script>
</asp:Content>

