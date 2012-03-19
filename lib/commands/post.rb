cmd :post, 'file1 file2 ...', 'post new gist' do |fs|
  if fs.size > 0
    begin
      url = @g.create fs
    rescue Gisty::InvalidFileException => e
      puts "Error: invalid file"
    rescue Exception => e
      puts "Error: #{e}"
    else
      id = url.split('/').last
      html_url = "https://gist.github.com/#{id}"
      system "open #{html_url}" if /darwin/ === RUBY_PLATFORM
      @g.clone id
    end
  end
end