class RoutinesController < ApplicationController
  def new
  end

  def create
  end

  def show
    @routine = Routine.find_by(id: params[:id])
  end

  private
  def permitted_params
    params.require(:exercise).permit(:set_weight, :set_reps)
  end
end
