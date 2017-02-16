class SandboxController < ApplicationController

  def index
    # Get filter
    @tags = params[:tags].to_s.split(/\s*,\s*/) || []
    @limit = params[:limit]
  end

end
