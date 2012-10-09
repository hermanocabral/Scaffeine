@{
    ViewBag.Title = "Departmens and Categories";
    Layout = "~/Views/Shared/_Folder.cshtml";
	Bundles.Reference("content/custom/categories.less", "custom");
    Bundles.Reference("scripts/custom/department/department.js", "custom");
}

<div id="viewArea">
    <h2>Departments <a href="#" class="btn" data-bind="click: $root.addDepartment"><i class="icon-plus"></i>Add</a></h2>

    <div data-bind="template: {name: templateToUse, foreach: departments}">
    </div>
</div>

<script id="itemTmpl" type="text/html">
    <div class="row-fluid">
        <div class="span12 editable" style="padding-left: 75px;">
            <div class="controls hide">
                <a class="btn btn-small" data-bind="click: $root.editDepartment" href="#" title="edit"><i class="icon-edit"></i></a>
                <a class="btn btn-small" data-bind="click: $root.removeDepartment" href="#" title="remove"><i class="icon-trash"></i></a>
            </div>
            <p style="font-weight: bold;" data-bind="text: Name"></p>
            <span data-bind="text: Description"></span>
            <div data-bind="template: {name: $root.tmplToUse, foreach: Categories}">
            </div>
            <a href="#" class="btn btn-small" data-bind="click: $root.addCategory">Add Category</a>
        </div>
    </div>
    <hr />
</script>

<script id="editTmpl" type="text/html">
    <div class="row-fluid">
        <div class="span12">
            <div class="pull-right">
                <a class="btn btn-small btn-success" data-bind="click: $root.saveDepartment" href="#" title="save"><i class="icon-ok"></i></a>
                <a class="btn btn-small" data-bind="click: $root.cancel" href="#" title="cancel"><i class="icon-remove"></i></a>
            </div>
            <p>
                <input type="text" data-bind="value: Name" class="input-xxlarge" />
            </p>
            <span>
                <textarea data-bind="value:Description" class="input-xxlarge"></textarea></span>
        </div>
    </div>
    <hr />
</script>

<script id="categoryTmpl" type="text/html">
    <div class="row-fluid">
        <div class="span12 categoryEditable" style="padding-left: 75px;">
            <div class="categoryControls hide">
                <a class="btn btn-small" data-bind="click: function(){$root.editCategory($parent, this);}" href="#" title="edit"><i class="icon-edit"></i></a>
                <a class="btn btn-small" data-bind="click: function(){$root.removeCategory($parent, this);}" href="#" title="remove"><i class="icon-trash"></i></a>
            </div>
            <p style="font-weight: bold;" data-bind="text: Name"></p>
            <span data-bind="text: Description"></span>
        </div>
    </div>
</script>

<script id="editCategory" type="text/html">
    <div class="row-fluid">
        <div class="span2">
            <div class="pull-right">
                <a class="btn btn-small btn-success" data-bind="click: $root.saveCategory" href="#" title="edit"><i class="icon-ok"></i></a>
                <a class="btn btn-small" data-bind="click: $root.cancelCategory" href="#" title="remove"><i class="icon-remove"></i></a>
            </div>
        </div>
        <div class="span10">
            <p>
                <input type="text" data-bind="value: Name" class="input-xxlarge" />
            </p>
            <span>
                <textarea data-bind="value:Description" class="input-xxlarge"></textarea></span>
        </div>
    </div>
</script>
