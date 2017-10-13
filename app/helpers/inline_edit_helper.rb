module InlineEditHelper
  def link_to_inline_edit(name = nil, container_dom_id = nil, html_options = {}, &block)
    html_options.deep_merge!(
      data: {
        behavior: 'toggle-inline-edit',
        inline_edit_target: container_dom_id
      }
    )
    link_to(name, '#', html_options, &block)
  end
end
