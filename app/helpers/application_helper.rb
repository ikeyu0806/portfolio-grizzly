# frozen_string_literal: true

module ApplicationHelper
  def controller?(*controller)
    controller.include?(params[:controller])
  end

  def action?(*action)
    action.include?(params[:action])
  end

  private

  def sources_from_pack_manifest(names, type:)
    names.map { |name| Webpacker.manifest.lookup!(pack_name_with_extension(name, type: type)) }
  rescue Webpacker::Manifest::MissingEntryError
    []
  end
end
