class Api::V1::SubCharClassesController < ApplicationController
    def index
        @sub_char_classes = SubCharClass.all
        render json: @sub_char_classes, status: :ok
    end
end
