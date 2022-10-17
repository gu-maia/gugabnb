# frozen_string_literal: true

module ApplicationHelper
  def page_active?(page_name)
    page_name == params[:controller]
  end

  def navbar_class(page)
    page_active?(page) ? 'bg-gray-900 text-white' : 'text-gray-300 hover:bg-gray-700 hover:text-white'
  end
end
