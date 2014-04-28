class Admin::BaseController < ApplicationController
  authorize_resource class: false
end
