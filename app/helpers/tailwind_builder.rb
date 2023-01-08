class TailwindBuilder < ActionView::Helpers::FormBuilder
  def tw_text_field(method, options = {})
    default_style = "block w-full rounded-md border-gray-300 shadow-sm focus:border-indigo-500 focus:ring-indigo-500 sm:text-sm"
    @template.content_tag(:div, class: "mt-1") do
      @template.text_field(@object_name, method, options.merge({ class: default_style }))
    end
  end

  def site_field(method, options = {})
    @template.content_tag(:div, class: "mt-1 sm:col-span-2") do
      @template.content_tag(:div, class: "flex max-w-lg rounded-md shadow-sm") do
        @template.content_tag(:span, options[:site], class: "inline-flex items-center rounded-l-md border border-r-0 border-gray-300 bg-gray-50 px-3 text-gray-500 sm:text-sm") +
        @template.text_field(@object_name, method, { class: "block w-full min-w-0 flex-1 rounded-none rounded-r-md border-gray-300 focus:border-indigo-500 focus:ring-indigo-500 sm:text-sm" })
      end
    end
  end

  def tw_email_field(method, options = {})
    default_style = "block w-full rounded-md border-gray-300 shadow-sm focus:border-indigo-500 focus:ring-indigo-500 sm:text-sm"
    @template.content_tag(:div, class: "mt-1") do
      @template.email_field(@object_name, method, options.merge({ class: default_style }))
    end
  end

  def tw_phone_field(method, options = {})
    default_style = "block w-full rounded-md border-gray-300 shadow-sm focus:border-indigo-500 focus:ring-indigo-500 sm:text-sm"
    @template.content_tag(:div, class: "mt-1") do
      @template.phone_field(@object_name, method, options.merge({ class: default_style }))
    end
  end

  def tw_text_area(method, options = {})
    default_style = "block w-full rounded-md border-gray-300 shadow-sm focus:border-indigo-500 focus:ring-indigo-500 sm:text-sm"
    @template.content_tag(:div, class: "mt-1") do
      @template.text_area(@object_name, method, options.merge({ class: default_style }))
    end
  end

  def label(method, text = nil, options = {})
    default_style = "block text-sm font-medium text-gray-700"
    super(method, text, options.merge({ class: default_style }))
  end
end
