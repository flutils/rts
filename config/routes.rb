###############################################
###############################################
##       _____            _                  ##
##      | ___ \          | |                 ##
##      | |_/ /___  _   _| |_ ___  ___       ##
##      |    // _ \| | | | __/ _ \/ __|      ##
##      | |\ \ (_) | |_| | ||  __/\__ \      ##
##      \_| \_\___/ \__,_|\__\___||___/      ##
##                                           ##
###############################################
###############################################

## Routes ##
Rails.application.routes.draw do

########################################
########################################

  ## API ##
  ## This is used to accept data from the front-end "games" app and pass back responses ##
  ## Meant to give people the ability to create buildings + units ##
  ## Only accessible if user is logged in ##
  authenticated do
    resources :games, path_name: "" do ## /:game_id/:user_id/units/new
      resources :users, path_name: "" do
        resources :resources, except: [:edit, :destroy]  ## Resources ##
        resources :units,     except: [:view]            ## Vehicles, Soliders ##
        resources :buildings, except: [:view]            ## Buildings ##
      end
    end
  end

  ## Admin Area ##
  ## Allows us to manage the admin settings for the system ##
  ## Needs to allow us to create users, maps, resources, factions + units ##
  ## See Models for more info ##
  resources :admin

########################################
########################################

end

###############################################
###############################################
