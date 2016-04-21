class DownloadsController < ApplicationController
  before_action :authenticate_user!
  require 'nokogiri'
  require 'open-uri'

  def show
      @bookmark = Bookmark.find(params[:id])
      page = Nokogiri::HTML(open("#{@bookmark.url}"))
      @title = page.title + '.html'
      out_file = File.new(title, "w")
      File.open(title, "w") {|file| file.puts page}
      
  end
end
