# frozen_string_literal: true
include Turbo::FramesHelper

class ItemComponent < ViewComponent::Base
  def initialize(item:, show_controls: true, show_handle: true, show_upload: true)
    @item = item
    @show_controls = show_controls
    @show_handle = show_handle
    @show_upload = show_upload
  end
end
