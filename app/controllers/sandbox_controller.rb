class SandboxController < ApplicationController

  def index

    # Set filters based on given parameters
    @tags = params[:tags].to_s.split(/\s*,\s*/) || []
    @limit = params[:limit]
  end

end
