directory "/root/.ssh" do
  owner "root"
  group "root"
  mode 0755
  action :create
end

cookbook_file "/root/.ssh/id_rsa" do
    source "id_rsa"
    owner "root"
    group "root"
    user "root"
    mode 0600
    action :create
end

template "/root/.ssh/id_rsa_wrapper" do
    source "id_rsa_wrapper.erb"
    owner "root"
    group "root"
    user "root"
    mode 0751
    action :create
end
