@model dynamic
@{
    ViewBag.Title = "title";
    Layout = "~/Views/Shared/_Folder.cshtml";
    ViewBag.SitemapProvider = "Modules";
}

<div class="row-fluid">
    <div class="tab-content">
        <div class="tab-pane active" id="inbox">
            <table class="table table-bordered inbox">
                <thead>
                    <tr>
                        <td colspan="4">
                            <div class="btn-group pull-left">
                                <button class="btn">
                                    Delete</button>
                                <button class="btn">
                                    Archive</button>
                            </div>
                        </td>
                    </tr>
                </thead>
                <tr>
                    <th style="width: 20px">
                        <input type="checkbox" />
                    </th>
                    <th style="width: 150px">
                        From
                    </th>
                    <th style="width: 500px">
                        Subject
                    </th>
                    <th>
                        Received
                    </th>
                </tr>
                <tr class="unread">
                    <td>
                        <input type="checkbox" />
                    </td>
                    <td>
                        Ray Allen
                    </td>
                    <td>
                        Question about 'Computer'
                    </td>
                    <td>
                        March 13, 2012
                    </td>
                </tr>
                <tr>
                    <td>
                        <input type="checkbox" />
                    </td>
                    <td>
                        Mark Walburg
                    </td>
                    <td>
                        Hey There
                    </td>
                    <td>
                        March 13, 2012
                    </td>
                </tr>
                <tr>
                    <td>
                        <input type="checkbox" />
                    </td>
                    <td>
                        Steve McQueen
                    </td>
                    <td>
                        Hey There
                    </td>
                    <td>
                        March 13, 2012
                    </td>
                </tr>
                <tfoot>
                    <tr>
                        <td colspan="4">
                            <div class="btn-group pull-left">
                                <button class="btn">
                                    Delete</button>
                                <button class="btn">
                                    Archive</button>
                            </div>
                            <div class="btn-group pull-right">
                                <button class="btn">
                                    1</button>
                                <button class="btn">
                                    2</button>
                            </div>
                        </td>
                    </tr>
                </tfoot>
            </table>
        </div>
    </div>
</div>
