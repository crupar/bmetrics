class RegisteredApplicationsController < ApplicationController
  load_and_authorize_resource # CanCanCan gem

  def index
    @registered_applications = RegisteredApplication.visible_to(current_user)
  end

  def show
    @events = @registered_application.events.group_by(&:name)

    # Create a hash where each element is an event name and the number of times
    # that event name exists in the @events array.

    # For example: { "complete" => 3, "click" => 4, "scroll" => 2, "cut" => 2 }
  #  @event_names_with_counts = @events.each_with_object(Hash.new(0)) do |event, array|
  #    array[event.name] += 1
  #  end
  end

  def new
    @registered_application = RegisteredApplication.new
  end

  def edit
  end

  def create
    @registered_application.user = current_user

    if @registered_application.save
      flash[:notice] = "Registered Application was created."
      redirect_to root_path
    else
      flash[:error] = "There was an error saving the Registered Application. Please try again."
      render :new
    end
  end

  def update
    if @registered_application.update_attributes(registered_application_params)
      redirect_to @registered_application, notice: 'Registered application was successfully updated.'
    else
      flash[:error] = "There was an error saving the Registered Application. Please try again."
      render :root_path
    end
  end

  def destroy
    if @registered_application.destroy
      flash[:notice] = "Registered Application deleted."
      redirect_to root_path
    else
      flash[:error] = "There was an error deleting the Registered Application."
      redirect_to :show
    end
  end

  private

    def find_registered_application
      @registered_application = RegisteredApplication.find(params[:id])
    end

    def registered_application_params
      params.require(:registered_application).permit(:name, :url)
    end

end
