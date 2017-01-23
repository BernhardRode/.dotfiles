
if [ -e ".credentials" ]
then
  if [ $BCN ]; then
    source ~/.credentials
    #export http_proxy=http://127.0.0.1:1111
    export http_proxy="http://$CREDENTIAL_USERNAME:$CREDENTIAL_PASSWORD@rb-proxy-de.bosch.com:8080"
    export https_proxy=$http_proxy
    export HTTP_PROXY=$http_proxy
    export HTTPS_PROXY=$http_proxy
    export no_proxy=".local, localhost, *.bosch.com, .bosch.com, 127.0.0.1"
    export NO_PROXY=$no_proxy
  fi
fi
