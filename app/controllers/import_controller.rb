class ImportController < ApplicationController
  def analyze
    raise TempDb.get_definition("posts").inspect
  end
end
