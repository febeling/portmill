xml.instruct!

xml.rss "version" => "2.0", "xmlns:dc" => "http://purl.org/dc/elements/1.1/" do
  xml.channel do

    xml.title       "Portmill Build Timeline"
    xml.link        url_for :only_path => false, :controller => 'builds'
    xml.description "Portmill, (unofficial) MacPorts build server"

    @builds.each do |build|
      xml.item do
        xml.title       "#{build.name} #{build.revision}"
        xml.link        url_for :only_path => false, :controller => 'builds', :action => 'show', :id => build.id
        xml.description "Result: #{build.state}"
        xml.guid        build.class.name + "_" + build.id.to_s
      end
    end

  end
end
