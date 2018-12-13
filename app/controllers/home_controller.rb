class HomeController < ApplicationController
    def index
    end
  
    def sobre
        @featured = Playlist.order("RANDOM()").limit 3
    end
  
    def como_funciona
    end
  
    def contato
    end

    def planos
    end
end