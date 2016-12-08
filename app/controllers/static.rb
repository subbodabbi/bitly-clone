
get '/' do
  @urls = Url.all
  @title = "Hi"
  erb :"static/index"
end


post '/urls' do
  @url = Url.new( params["url"])
  if @url.save
  	redirect to ('/')
  else
    @urls = Url.last(2)
    @title = "Form"
    erb :"static/index"
  end
end

get "/:short_url" do
  @url = Url.find_by_short_url(params[:short_url])
  @url.click_count += 1
  @url.save
  redirect to "http://#{@url.long_url}"
end
