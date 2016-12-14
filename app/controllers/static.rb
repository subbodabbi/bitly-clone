get '/' do
  @urls = Url.last(10)
  erb :"static/index"
end


post '/urls' do
  x = Url.new( params["url"])
  x.save
  @urls = Url.last(10)
  x.to_json
end

get "/:short_url" do
  @url = Url.find_by_short_url(params[:short_url])
  @url.click_count += 1
  @url.save
  redirect to "http://#{@url.long_url}"
end
