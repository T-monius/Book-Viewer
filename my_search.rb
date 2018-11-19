# my_search.rb

# my original search method
get "/search" do
  @value = params[:query]
  @results = []
  chapter_files = Dir['data/chp*.txt']
  if @value
    chapter_files.each do |file|
      if File.read(file).match?(/#{@value.downcase}/)
        @results << file.match(/\d+/).to_s.to_i
      end
    end
  end

  @result_titles = @results.each_with_object({}) do |num, ttl_hsh|
    ttl_hsh[num] = @contents[num - 1].chomp
  end

  erb :search
end
