class AnnotationsController < ApplicationController

  def create

    Annotation.create(document_version_id: params[:id])

  end

  def destroy

  end

end