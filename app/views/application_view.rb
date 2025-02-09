# frozen_string_literal: true

class MethodCallFinder < Prism::Visitor
  attr_reader :calls

  def initialize(calls)
    @calls = calls
  end

  def visit_call_node(node)
    super
    calls << node.name
  end
end

class ApplicationView < ApplicationComponent
  # include RBUI
  include Components
  include ApplicationHelper
  # The ApplicationView is an abstract class for all your views.

  # By default, it inherits from `ApplicationComponent`, but you
  # can change that to `Phlex::HTML` if you want to keep views and
  # components independent.

  GITHUB_REPO_URL = "https://github.com/rbui-labs/rbui/"
  GITHUB_FILE_URL = "#{GITHUB_REPO_URL}blob/main/"

  def before_template
    Docs::VisualCodeExample.reset_collected_code
    super
  end
end
