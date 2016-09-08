#!/bin/bash -e

omg-cli/omg-linux deploy-product \
  --bosh-url $(vault read --field=bosh-url $VAULT_HASH_HOSTVARS) \
  --bosh-port $(vault read --field=bosh-port $VAULT_HASH_HOSTVARS) \
  --bosh-user $(vault read --field=bosh-user $VAULT_HASH_HOSTVARS) \
  --bosh-pass $(vault read --field=bosh-pass $VAULT_HASH_HOSTVARS) \
  --print-manifest \
  --ssl-ignore \
  $PRODUCT_PLUGIN \
  --stemcell-version $(<stemcell/version) \
  --infer-from-cloud \
  --vault-active \
  --vault-domain $VAULT_ADDR \
  --vault-hash-host $VAULT_HASH_HOSTVARS \
  --vault-hash-ip $VAULT_HASH_IP \
  --vault-hash-keycert $VAULT_HASH_KEYCERT \
  --vault-hash-password $VAULT_HASH_PASSWORD \
  --vault-token $VAULT_TOKEN > manifest/deployment.yml

#eof
