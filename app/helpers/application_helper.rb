# Methods added to this helper will be available to all templates in the application.
require "will_paginate"

module ApplicationHelper
  include WillPaginate::ViewHelpers
end
