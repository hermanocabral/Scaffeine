<div id="conversation" class="modal hide fade" style="display: none;">
    
    <div class="modal-header">
        <a class="close" data-dismiss="modal">[x]</a>
        <h3>
            Edit Role</h3>
    </div>
    <div class="modal-body" data-bind="with: Entity">
        <input type="hidden" id="Id" name="Id" />
        <div class="control-group">
            <label for="RoleName">
                Role
            </label>
            <input type="text" id="RoleName" name="RoleName" placeholder="Enter RoleName here" />
        </div>
        <div class="control-group">
            <label for="Description">
                Description
            </label>
            <input type="text" id="Description" name="Description" placeholder="Enter Description here"
                data-bind="value: Description" />
        </div>
    </div>
    <div class="modal-footer">
        <button class="btn">
            Cancel</button>
        <button type="submit" class="btn btn-primary">
            Save</button>
    </div>
   
</div>