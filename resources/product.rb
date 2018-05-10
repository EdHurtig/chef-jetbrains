actions :install

default_action :install

attribute :name,      kind_of: String, name_attribute: true, required: true
attribute :version,   kind_of: String, required: true
attribute :product,   kind_of: String
attribute :download_url, kind_of: String
