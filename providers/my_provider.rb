class MyProvider < Chef::Resource
  resource_name :my_provider

  property :path, String, required: true, name_property: true
  property :contents, String, default: 'Hello World.'

  action :add do
    if @current_resource
      Chef::Log.info "#{@new_resource} already installed - nothing to do."
    else
      converge_by("Add #{@new_resource}") do
        file new_resource.path do
          owner 'vagrant'
          group 'vagrant'
          content new_resource.contents
        end
      end
    end
  end

  action :config do
    converge_if_changed do
      file new_resource.path do
        owner 'vagrant'
        group 'vagrant'
        content new_resource.contents
      end
    end
  end

  load_current_value do
    if ::File.exist?(path)
      # Retrieve contents
      contents ::IO.read(path)
    else
      current_value_does_not_exist!
    end
  end
end
