module Reading
  class Generator < Jekyll::Generator
    def generate(site)
      puts 'hoyhoyhoyhoyhoyhoyhoyhoyhoyhoyhoyhoyhoyhoyhoyhoyhoyhoy'
      site.posts.to_enum.with_index(1).each do |post, i|
        post.content.split.uniq.each do |word|
          puts word
        end
      end
    end
  end
end