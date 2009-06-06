module BuildsHelper

  def link_to_revision(revision)
    "<a href='http://trac.macports.org/changeset/#{revision}'>[#{revision}]</a>"
  end

  def linked_revision_list(list_string)
    list_string.split(',').map {|rev| link_to_revision(rev) }.join(', ')
  end
end
