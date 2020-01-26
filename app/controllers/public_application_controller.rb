class PublicApplicationController < ApplicationController
  layout "public"
  before_action :authenticate_user!, only: [:new, :edit, :update, :destroy]
end
