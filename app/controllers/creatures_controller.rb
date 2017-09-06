class CreaturesController < ApplicationController
    def index
        @creatures = Creature.all
    end

    # show the new creature form
    def new
    @creature = Creature.new
    # remember the default behavior is to render :new
    end

    def create
    # whitelist params and save them to a variable
    creature_params = params.require(:creature).permit(:name, :description)

    # create a new creature from `creature_params`
    creature = Creature.new(creature_params)

        # if creature saves, redirect to route that displays all creatures
        if creature.save
        redirect_to creature_path(creature)
        # redirect_to creatures_path is equivalent to:
        # redirect_to "/creatures"
        end
    end

    def show
    # get the creature id from the url params
    creature_id = params[:id]

    # use `creature_id` to find the creature in the database
    # and save it to an instance variable
    @creature = Creature.find_by_id(creature_id)

    # render the show view (it has access to instance variable)
    # remember the default behavior is to render :show
  end
end
