class KlassesController < ApplicationController
  def create
    @klass = Klass.new(params[:klass])
    if @klass.save
      render :json => @klass
    else
      render :json => @klass.errors.full_messages, :status => 422
    end
  end

  def destroy
    @klass = Klass.find(params[:id])
    @klass.destroy
    render :json => {}
  end

  def index
    @klasses = Klass.all
    @assignments = []
    @klasses.each do |klass|
      @assignments += klass.assignments
    end
  end

  def show
    @klass = Klass.find(params[:id])
    render :json => @klass
  end
end
