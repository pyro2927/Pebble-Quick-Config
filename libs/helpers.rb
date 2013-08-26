# -*- encoding: utf-8 -*-
module TemplateHelpers
  def h(text)
    Rack::Utils.escape_html(text)
  end
  def partial(template, locals = {})
    erb("partials/_#{template.to_sym}".to_sym, :layout => false, :locals => locals)
  end
end
