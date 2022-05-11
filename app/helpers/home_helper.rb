module HomeHelper

    def lets_start
        button_to "Начать", articles_path, class: "btn btn-primary", method: :get
    end

end
