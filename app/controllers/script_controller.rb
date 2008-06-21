class ScriptController < ApplicationController
  before_filter :login_required
  active_scaffold do |config|
    config.actions.exclude :show # Exclude actions from the main list view.
    list.columns = [:id, :title, :description]   # Visable columns in "list" view.
    update.columns = [:title, :description, :content]   # Visable columns in "list" view.
    list.label = "Script Picker Admin"
  end
end
