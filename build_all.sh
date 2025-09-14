set -euo pipefail
mkdir -p build

echo "==> Build jetton-minter.fif"
func -PS \
  -o build/jetton-minter.fif \
  func-libs/stdlib.fc \
  contracts/common.fc \
  contracts/jetton-ops.fc \
  contracts/jetton-utils.fc \
  contracts/jetton-minter.fc

echo "==> Build jetton-wallet.fif"
func -PS \
  -o build/jetton-wallet.fif \
  func-libs/stdlib.fc \
  contracts/common.fc \
  contracts/jetton-ops.fc \
  contracts/jetton-utils.fc \
  contracts/jetton-wallet.fc

echo "==> Convert .fif -> .boc"
fift -s build/jetton-minter.fif  > build/jetton-minter.boc
fift -s build/jetton-wallet.fif  > build/jetton-wallet.boc

echo "==> Done. Artifacts in ./build :"
ls -l build
