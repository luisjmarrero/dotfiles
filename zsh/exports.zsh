# add Go to the path
export PATH=$PATH:/usr/local/go/bin

# add packages installed with go to the path
export PATH=$(go env GOPATH)/bin:$PATH