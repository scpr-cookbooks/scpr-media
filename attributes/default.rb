default["scpr_media"]["server"] = "media.scpr.org"

default["scpr_media"]["podroller"]["version"] = "0.5.1"

default["scpr_media"]["podroller"]["config"]["redirect_url"]      = "http://#{node.scpr_media.server}"
default["scpr_media"]["podroller"]["config"]["preroll_enabled"]   = true

default["scpr_media"]["podroller"]["config"]["preroll"]["key"]    = "podcast"
default["scpr_media"]["podroller"]["config"]["preroll"]["path"]   = "/pre/p"
default["scpr_media"]["podroller"]["config"]["preroll"]["server"] = "campaigns.scprdev.org"

#----------

include_attribute "nginx_passenger"

default["nginx_passenger"]["sites_dir"] = "/etc/nginx/sites"
default["nginx_passenger"]["log_dir"]   = "/scpr/log"

#----------

include_attribute "scpr-ftp"

default["scpr_ftp"]["item"] = "media"