node["gits"].each do |git|
    directory "#{git['location']}" do
      owner "root"
      group "root"
      mode 0755
      action :create
    end

    git "#{git['location']}" do
       repository "#{git['repo']}"
       reference "#{git['branch']}"
       action :sync
       ssh_wrapper "/root/.ssh/id_rsa_wrapper"
       user "root"
    end
end

node["composers"].each do |composer|
    script "composer_run" do
      interpreter "bash"
      user "root"
      cwd "#{composer['location']}"
      code <<-EOH
         php composer.phar update
      EOH
    end
end