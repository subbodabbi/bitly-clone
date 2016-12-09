
get '/' do
  @urls = Url.last(10)
  @title = "Hi"
  erb :"static/index"
end


post '/urls' do
  @url = Url.new( params["url"])
  @url.save
  redirect to ('/')
  @url.short_url
end

get "/:short_url" do
  @url = Url.find_by_short_url(params[:short_url])
  @url.click_count += 1
  @url.save
  redirect to "http://#{@url.long_url}"
end
