class CollaboratorsController < ApplicationController

  def new
    @collaborator = Collaborator.new

  end

  def create
    Collaborator.create(params[:collaborator])

    redirect_to 
  end

  def index
    @document = Document.find_by_id(params[:id])
    @collaborators = @document.collaborators
  end

  def destroy

    @collaborator = Collaborator.find_by_id(params[:id])

    @collaborator.destroy

  end


end
