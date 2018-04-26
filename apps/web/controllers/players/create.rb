module Web::Controllers::Players
  class Create
    include Web::Action

    params do
      required(:player).schema do
        required(:name).filled(:str?)
      end
    end

    def call(params)
      if params.valid?
        @player = PlayerRepository.new.create(params[:player])

        redirect_to routes.players_path
      else
        self.status = 422
      end
    end
  end
end
