@{
    ViewBag.Title = "Departmens and Categories";
    Layout = "~/Views/Shared/_Folder.cshtml";
}
@section Scripts{
    <script>
        function Department(data) {
            var self = this;
            self.Id = ko.observable(data.Id);
            self.Created = ko.observable(data.Created);
            self.RowVersion = ko.observable(data.RowVersion);
            self.Updated = ko.observable(data.Updated);

            self.Name = ko.observable(data.Name);
            self.Description = ko.observable(data.Description);
            self.Categories = ko.observableArray();
        }

        function Category(data) {
            var self = this;
            self.Id = ko.observable(data.Id);
            self.Created = ko.observable(data.Created);
            self.RowVersion = ko.observable(data.RowVersion);
            self.Updated = ko.observable(data.Updated);

            self.Name = ko.observable(data.Name);
            self.Description = ko.observable(data.Description);
        }

        var DepartmentViewModel = function (departments) {
            var self = this;

            self.departments = ko.observableArray(departments);
            self.selectedItem = ko.observable();
            self.dpt = null;
            self.selectedCategory = ko.observable();

            self.addDepartment = function () {
                var current = self.selectedItem();
                if (current == null) {
                    var newItem = new Department({});
                    self.departments.unshift(newItem);
                    self.selectedItem(newItem);
                }
            };

            self.editDepartment = function (dpt) {
                self.selectedItem(dpt);
            };

            self.removeDepartment = function (dpt) {
                var model = ko.toJS(dpt);

                if (confirm('Are you sure about delete this Department?')) {
                    $.ajax({
                        url: '/api/departments/' + model.Id,
                        type: 'DELETE',
                        success: function (data) {
                            self.departments.remove(dpt);
                        }
                    });
                }
            };

            self.saveDepartment = function (dpt) {
                var viewModel = self.selectedItem(),
                    model = ko.toJS(viewModel),
                    verb = model.Id ? 'PUT' : 'POST';

                $.ajax({
                    url: '/api/departments',
                    type: verb,
                    contentTYpe: 'application/json; charset=utf-8',
                    data: model,
                    success: function (data) {
                        self.selectedItem().Id(data.Id);
                        self.selectedItem().RowVersion(data.RowVersion);
                        self.selectedItem(null);
                    }
                });
            };

            self.cancel = function (dpt) {
                if (dpt.Id()) {
                    self.selectedItem(null);
                } else {
                    self.departments.remove(dpt);
                    self.selectedItem(null);
                }
            };

            self.addCategory = function (dpt) {
                var current = self.selectedCategory();
                if (current == null) {
                    var newItem = new Category({});
                    self.dpt = dpt;
                    dpt.Categories.push(newItem);
                    self.selectedCategory(newItem);
                }
            };

            self.editCategory = function (dpt, cat) {
                self.dpt = dpt;
                self.selectedCategory(cat);
            };

            self.removeCategory = function (dpt, cat) {
                var model = ko.toJS(cat);

                if (confirm('Are you sure about delete this Category?')) {
                    $.ajax({
                        url: '/api/categories/' + model.Id,
                        type: 'DELETE',
                        success: function (data) {
                            dpt.Categories.remove(cat);
                        }
                    });
                }
            };

            self.saveCategory = function (cat) {
                var viewModel = self.selectedCategory(),
                    model = ko.toJS(viewModel),
                    verb = model.Id ? 'PUT' : 'POST';

                model.DepartmentId = self.dpt.Id();
                $.ajax({
                    url: '/api/categories',
                    type: verb,
                    contentTYpe: 'application/json; charset=utf-8',
                    data: model,
                    success: function (data) {
                        self.selectedCategory().Id(data.Id);
                        self.selectedCategory().RowVersion(data.RowVersion);
                        self.selectedCategory(null);
                    }
                });
            };

            self.cancelCategory = function (cat) {
                if (cat.Id()) {
                    self.selectedCategory(null);
                } else {
                    self.dpt.Categories.remove(cat);
                    self.selectedCategory(null);
                }
            };

            self.templateToUse = function (item) {
                return self.selectedItem() === item ? 'editTmpl' : 'itemTmpl';
            };

            self.tmplToUse = function (item) {
                return self.selectedCategory() === item ? 'editCategory' : 'categoryTmpl';
            };
        };

        $(function () {
            $.ajax({
                url: '/api/departments/List',
                type: 'GET',
                success: function (data) {
                    var initData = [];
                    $.each(data, function () {
                        var dpt = new Department(this);
                        $.each(this.Categories, function () {
                            dpt.Categories.push(new Category(this));
                        });
                        initData.push(dpt);
                    });
                    ko.applyBindings(new DepartmentViewModel(initData), document.getElementById('viewArea'));
                }
            });
        });
    </script>
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
