class RoutineTrackerController < ApplicationController
  def new
  end

  def create
  end

  def show
    @routine = Routine.find_by(id: params[:id])
  end

  private
  def permitted_params
  end
end
