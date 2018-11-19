# Unfortunately, the linking aspect of this exercise would not work without
# completely refactoring and using the launchschool approach. This approach
# will get the right content on the page, but using selection on the matching
# side won't allow associating a match with its index. I'd have to create
# a separate method to index the paragraphs. Then, it would be necessary to
# paragraph index from a match hash compared to my selection array. Needless
# to say, I simply used the LS approach to continue through the exercises.

def select_paragraphs(chapter)
  chapter.split("\n\n").select do |paragraph|
    yield paragraph
  end
end

def chapters_matching(query)
  results = []

  return results if !query || query.empty?

  each_chapter do |number, name, contents|
    if contents.include?(query)
      pars = select_paragraphs(contents) { |par| par.include?(query) }
      results << {number: number, name: name, paragraphs: pars}
    end
  end

  results
end
