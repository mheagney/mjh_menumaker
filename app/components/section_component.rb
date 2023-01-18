# frozen_string_literal: true
include Turbo::FramesHelper

class SectionComponent < ViewComponent::Base
  def initialize(section:)
    @section = section
  end
end
