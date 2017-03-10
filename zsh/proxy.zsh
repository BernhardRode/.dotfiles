
if [ -e ".credentials" ]
then
  if [ $BCN ]; then
    source ~/.credentials
    #export http_proxy="http://$CREDENTIAL_USERNAME:$CREDENTIAL_PASSWORD@$CREDENTIAL_PROXY_HOST:$CREDENTIAL_PROXY_PORT"
    export http_proxy="http://$CREDENTIAL_PROXY_HOST:$CREDENTIAL_PROXY_PORT"
    export no_proxy=".local, localhost, .bosch.com, 127.0.0.1"
  else
    export http_proxy=""
    export no_proxy=""
  fi
fi

export http_proxy=$http_proxy
export https_proxy=$http_proxy
export HTTP_PROXY=$http_proxy
export HTTPS_PROXY=$http_proxy

export no_proxy=$no_proxy
export NO_PROXY=$no_proxy
