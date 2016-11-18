<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="default.aspx.cs" Inherits="WebAppSignalR._default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="scripts/jquery-1.6.4.min.js" type="text/javascript"></script>
    <script src="scripts/jquery.signalR-2.2.1.min.js" type="text/javascript"></script>
    <script src="signalr/hubs" type="text/javascript"></script>
    <style type="text/css">
        .container {
            background-color: #99CCFF;
            border: thick solid #808080;
            padding: 20px;
            margin: 20px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <div class="container">

                <input type="text" id="message" />

                <input type="button" id="sendmessage" value="Send" />
                <input type="button" id="sendnotify" value="Send Notify" />
                <input type="hidden" id="displayname" />

                <ul id="discussion"></ul>

            </div>
            <script type="text/javascript">

$(function () {

// Declare a proxy to reference the custom Hub name.

    var spdfHub = $.connection.PdfHub;
    var notifyHub = $.connection.NotificationHub;

// Create a function that the hub can call to broadcast messages.

    spdfHub.client.broadcastMessage = function (name, message) {

// Html encode display name and message.

var encodedName = $('<div />').text(name).html();

var encodedMsg = $('<div />').text(message).html();

// Add the message to the page.

$('#discussion').append('<li><strong>' + encodedName

+ '</strong>:&nbsp;&nbsp;' + encodedMsg + '</li>');

};

notifyHub.client.broadcastNotification = function (name, message) {

    // Html encode display name and message.

    var encodedName = $('<div />').text(name).html();

    var encodedMsg = $('<div />').text(message).html();

    // Add the message to the page.

    $('#discussion').append('<li><strong>' + encodedName

    + '</strong>:&nbsp;&nbsp;' + encodedMsg + '</li>');

};

// Get the user name and store it to prepend to messages.

//$('#displayname').val(prompt('Enter your name:', ''));

// Set initial focus to message input box.

$('#message').focus();

// Start the connection.

$.connection.hub.start().done(function () {

$('#sendmessage').click(function () {

// Call the Send method on the Custom Hub name.

    spdfHub.server.sendMessage($('#displayname').val(), $('#message').val());

// Clear text box and reset focus for next comment.

$('#message').val('').focus();

});
$('#sendnotify').click(function () {

// Call the Send method on the Custom Hub name.

    notifyHub.server.sendNotification($('#displayname').val(), $('#message').val());

// Clear text box and reset focus for next comment.

$('#message').val('').focus();

});

});

});

            </script>
        </div>
    </form>
</body>
</html>
