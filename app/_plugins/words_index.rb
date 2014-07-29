module Reading
  class Generator < Jekyll::Generator
    def generate(site)
      words_index = Hash.new

      site.posts.to_enum.with_index(1).each do |post, i|
        post.content.downcase.gsub('-', ' ').gsub(/[^a-z\s]/i, '').split.uniq.sort.each do |word|
          if word.length < 2
            next
          end

          if !words_index.has_key?(word)
            words_index[word] = Array.new
          end
          words_index[word].push(i)
        end
      end

      File.write('words.json', words_index.to_json)
    end
  end
end