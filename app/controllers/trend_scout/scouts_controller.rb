module TrendScout
  class ScoutsController < ApplicationController
    def index
      @scouts = Scout.order(name: :asc)
    end

    def show
      @scout = Scout.find(params[:id])
      @runs = @scout.runs.order(id: :desc).limit(25)
      @runs_chart_data = @scout.runs
                               .success
                               .where('created_at > ?', 1.year.ago)
                               .order(id: :asc)
                               .pluck(:created_at, :value)
                               .map { |m| [m[0].strftime("%H:%M"), m[1]] }
    end

    def new
      @scout = Scout.new
    end

    def create
      @scout = Scout.new(scout_params)

      if @scout.save
        redirect_to edit_scout_path(@scout)
      else
        render :new
      end
    end

    def edit
      @scout = Scout.find(params[:id])
    end

    def update
      @scout = Scout.find(params[:id])
      if @scout.update(scout_params)
        redirect_to scouts_path
      else
        render :edit
      end
    end

    def trigger
      @scout = Scout.find(params[:id])
      @scout.enqueue
      redirect_to scouts_path
    end

    private

    def scout_params
      type = params.dig(:scout, :type)
      permitted_params = [:name, :type]
      permitted_params += type.constantize.stored_attributes[:properties] if type.present?

      params.require(:scout).permit(permitted_params)
    end
  end
end
