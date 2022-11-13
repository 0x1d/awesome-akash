#!/bin/bash

export CONFIG_DIR=/etc/dendrite
export DENDRITE_CONFIG=${CONFIG_DIR}/dendrite.yaml
export MATRIX_KEY=${CONFIG_DIR}/matrix_key.pem
export SERVER_CERT=${CONFIG_DIR}/server.crt
export SERVER_KEY=${CONFIG_DIR}/server.key

# Generate config
if [ ! -f "$DENDRITE_CONFIG" ]; then
    echo "Generate config"
    envsubst </var/dendrite/template/dendrite.yaml.tpl >$DENDRITE_CONFIG
fi

# Generate keys
if [ ! -f "$MATRIX_KEY" ]; then
    echo "Generate keys"
    /usr/bin/generate-keys \
        -private-key $MATRIX_KEY \
        -tls-cert $SERVER_CERT \
        -tls-key $SERVER_KEY
fi

# Run the server
/usr/bin/dendrite-monolith-server \
    --really-enable-open-registration \
    --tls-cert $SERVER_CERT \
    --tls-key $SERVER_KEY \
    --config $DENDRITE_CONFIG
