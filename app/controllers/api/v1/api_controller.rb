class Api::V1::ApiController < ApplicationController
    include JSONAPI::ActsAsResourceController
    # protect_from_forgery with: :null_session
end
