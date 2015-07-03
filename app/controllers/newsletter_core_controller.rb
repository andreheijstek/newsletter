class NewsletterCoreController < ApplicationController
  def index
    @title = "Home"
  end

  def letters
    @title = "Zondagsbrieven"
  end

  def shop
    @title = "Shop"
  end

  def discussion
    @title = "Discussie"
  end
end
