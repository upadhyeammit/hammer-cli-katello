module HammerCLIKatello
  module CompositeContentViewNameResolvable
    def composite_content_view_resolve_options(options)
      {
        HammerCLI.option_accessor_name("organization_id") => options["option_organization_id"],
        HammerCLI.option_accessor_name("organization_name") => options["option_organization_name"],
        HammerCLI.option_accessor_name("organization_label") =>
          options["option_organization_label"],
        HammerCLI.option_accessor_name("name") => options["option_composite_content_view_name"]
      }
    end

    def options
      if super['option_composite_content_view_name'] &&
         super['option_composite_content_view_id'].nil?
        options = composite_content_view_resolve_options(super)
        super['option_composite_content_view_id'] = resolver.content_view_id(options)
      end
      super
    end

    def self.included(base)
      base.option "--composite-content-view",
             "COMPOSITE_CONTENT_VIEW_NAME", _("Name of the composite content view"),
             :attribute_name => :option_composite_content_view_name
    end
  end
end
