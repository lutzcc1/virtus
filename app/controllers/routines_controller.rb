class RoutinesController < ApplicationController
  def new
    @routine = Routine.new
  end

  def index
    @routines = Routine.all
  end

  private
  def permitted_params
    params.require(:routine).permit(:name, :type)
  end
end
