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