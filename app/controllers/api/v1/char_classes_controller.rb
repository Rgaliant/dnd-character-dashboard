class Api::V1::CharClassesController < ApplicationController
    def index
        @char_classes = CharClass.all
        render json: @char_classes, status: :ok
    end
end
