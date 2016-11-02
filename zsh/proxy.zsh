# load proxy settings
if [ "$(networksetup -getcurrentlocation)" == "BCN" ]; then
  export http_proxy=http://127.0.0.1:1111
  export https_proxy=$http_proxy
  export HTTP_PROXY=$http_proxy
  export HTTPS_PROXY=$http_proxy
  export no_proxy="*.local, 169.254/16, localhost, *.bosch.com, 127.0.0.1, 172.17.0.1, 172.17.0.2, 172.17.0.3, 172.17.0.4, 172.17.0.5"
  export NO_PROXY=$no_proxy
fi
