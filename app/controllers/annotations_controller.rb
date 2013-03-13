class AnnotationsController < ApplicationController

  def create

    Annotation.create(document_version_id: params[:id], content: params[:content], number: params[:number])

  end

  def destroy

  end

end