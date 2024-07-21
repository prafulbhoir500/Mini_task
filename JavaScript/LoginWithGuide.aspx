<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SignIn.aspx.cs" Inherits="Web.App.SignIn" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        .driver-popover.driverjs-theme {
            background-color: #fde047;
            color: #000;
        }

            .driver-popover.driverjs-theme .driver-popover-title {
                font-size: 20px;
            }

            .driver-popover.driverjs-theme .driver-popover-title,
            .driver-popover.driverjs-theme .driver-popover-description,
            .driver-popover.driverjs-theme .driver-popover-progress-text {
                color: #000;
            }

            .driver-popover.driverjs-theme button {
                flex: 1;
                text-align: center;
                background-color: #000;
                color: #ffffff;
                border: 2px solid #000;
                text-shadow: none;
                font-size: 14px;
                padding: 5px 8px;
                border-radius: 6px;
            }

                .driver-popover.driverjs-theme button:hover {
                    background-color: #000;
                    color: #ffffff;
                }

            .driver-popover.driverjs-theme .driver-popover-navigation-btns {
                justify-content: space-between;
                gap: 3px;
            }

            .driver-popover.driverjs-theme .driver-popover-close-btn {
                color: #9b9b9b;
            }

                .driver-popover.driverjs-theme .driver-popover-close-btn:hover {
                    color: #000;
                }

            .driver-popover.driverjs-theme .driver-popover-arrow-side-left.driver-popover-arrow {
                border-left-color: #fde047;
            }

            .driver-popover.driverjs-theme .driver-popover-arrow-side-right.driver-popover-arrow {
                border-right-color: #fde047;
            }

            .driver-popover.driverjs-theme .driver-popover-arrow-side-top.driver-popover-arrow {
                border-top-color: #fde047;
            }

            .driver-popover.driverjs-theme .driver-popover-arrow-side-bottom.driver-popover-arrow {
                border-bottom-color: #fde047;
            }
    </style>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous" />
    <script src="https://cdn.jsdelivr.net/npm/driver.js@1.0.1/dist/driver.js.iife.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/driver.js@1.0.1/dist/driver.css" />
    <script type="text/javascript">
        document.addEventListener('DOMContentLoaded', function () {
            if (Notification.permission !== "granted") {
                Notification.requestPermission();
            }
        })
        function msg(Title, Desc, URL) {
            if (Notification.permission !== "granted") {
                Notification.requestPermission();
            }
            else {
                var notification = new Notification(Title, { icon: 'assets/icon.png', body: Desc, });
                notification.onclick = function () {
                    window.open(URL);
                };
                notification.onclose = function () {
                    console.log('notification closed');
                };
            }
        }
    </script>
</head>
<body class="bg-warning-subtle">
    <form id="form1" runat="server">
        <div class="container">
            <div class="row vh-100 justify-content-between align-items-center">
                <div class="col-md-7 d-none d-md-block">
                    <img src="https://static.vecteezy.com/system/resources/thumbnails/005/879/539/small_2x/cloud-computing-modern-flat-concept-for-web-banner-design-man-enters-password-and-login-to-access-cloud-storage-for-uploading-and-processing-files-illustration-with-isolated-people-scene-free-vector.jpg" class="img-fluid" style="mix-blend-mode:multiply"/>
                </div>
                <div class="col-12 col-md-5">
                    <div class="card">
                        <div class="card-body">
                            <div class="mb-3">
                                <label class="form-label">User Name</label>
                                <asp:TextBox ID="txtUserName" CssClass="form-control" runat="server"></asp:TextBox>
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Password</label>
                                <asp:TextBox ID="txtPassword" TextMode="Password" CssClass="form-control" runat="server"></asp:TextBox>
                            </div>
                            <div class="mb-3">
                                <asp:Button ID="btnClick" CssClass="btn btn-warning w-100" runat="server" Text="Login" OnClick="btnClick_Click" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div id="tour-example" class=""></div>
    </form>

    <script>
        const driver = window.driver.js.driver;
        const driverObj = driver({
            showProgress: true,
            steps: [
                { element: '.card', popover: { title: 'Step 1', description: 'Login Page' } },
                { element: '#txtUserName', popover: { title: 'Step 2', description: 'Enter User Name' } },
                { element: '#txtPassword', popover: { title: 'Step 3', description: 'Enter Password' } },
                { element: '#btnClick', popover: { title: 'Step 4', description: 'After User Name and Password Click On Login' } },
            ]
        });
        driverObj.drive();
        //const driverObj = driver();

        //driverObj.highlight({
        //    element: "#some-element",
        //    popover: {
        //        title: "Title",
        //        description: "Description"
        //    }
        //});

        //const driverObj = driver({
        //    popoverClass: 'driverjs-theme'
        //});

        //driverObj.highlight({
        //    element: '#demo-theme',
        //    popover: {
        //        title: 'Style However You Want',
        //        description: 'You can use the default class names and override the styles or you can pass a custom class name to the popoverClass option either globally or per step.'
        //    }
        //});
    </script>
</body>
</html>
