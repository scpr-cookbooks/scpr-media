default["scpr_media"]["server"] = "media.scpr.org"
default["scpr_media"]["nfs_mount"] = "/volume1/media"

default["scpr_media"]["consul_key"] = "media_prod"

default["scpr_media"]["podroller"]["version"] = "0.6.7"

default["scpr_media"]["podroller"]["config"]["redirect_url"]      = "http://#{node.scpr_media.server}"
default["scpr_media"]["podroller"]["config"]["preroll_enabled"]   = true

default["scpr_media"]["podroller"]["config"]["preroll"]["path"]   = "/pre/p"
default["scpr_media"]["podroller"]["config"]["preroll"]["server"] = "campaigns.scprdev.org"
default["scpr_media"]["podroller"]["config"]["google_analytics"]["property"] = "UA-624724-1"
default["scpr_media"]["podroller"]["config"]["google_analytics"]["custom_dimension"] = "cd25"

#----------

include_attribute "nginx_passenger"

default["nginx_passenger"]["sites_dir"] = "/etc/nginx/sites"
default["nginx_passenger"]["log_dir"]   = "/scpr/log"

#----------

include_attribute "scpr-ftp"

default["scpr_ftp"]["item"] = "media"
