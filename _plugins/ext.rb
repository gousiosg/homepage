require 'jekyll/scholar'

class BibTeX::Entry::CiteProcConverter
  def key
    hash['id'] = hash['citation-label'] = bibtex.key.to_s
  end
end

