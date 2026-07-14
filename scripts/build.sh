#!/bin/bash
# SPDX-License-Identifier: GPL-2.0-only
set -euo pipefail

UPSTREAM_VER="128.0esr"
UPSTREAM_URL="https://ftp.mozilla.org/pub/firefox/releases/${UPSTREAM_VER}/linux-x86_64/en-US/firefox-${UPSTREAM_VER}.tar.bz2"
BUILD_DIR="build"
OUTPUT_TAR="phantomfox-linux-x86_64.tar.gz"

log_info() { printf "[INFO] %s\n" "$1"; }

prepare_environment() {
    rm -rf "${BUILD_DIR}"
    mkdir -p "${BUILD_DIR}"
}

fetch_upstream() {
    wget -q --show-progress "${UPSTREAM_URL}" -O "${BUILD_DIR}/upstream.tar.bz2"
}

extract_and_rebrand() {
    cd "${BUILD_DIR}" || exit 1
    tar -xf upstream.tar.bz2
    mv firefox phantomfox
    
    mv phantomfox/firefox phantomfox/phantomfox
    mv phantomfox/firefox-bin phantomfox/phantomfox-bin
    mv phantomfox/firefox-bin.sig phantomfox/phantomfox-bin.sig 2>/dev/null || true
    rm -f phantomfox/firefox.sig
    
    mkdir -p phantomfox/distribution
    cp ../config/policies.json phantomfox/distribution/policies.json
    mkdir -p phantomfox/defaults/pref
    cp ../config/autoconfig.js phantomfox/defaults/pref/autoconfig.js
    cp ../config/phantomfox.cfg phantomfox/phantomfox.cfg

    if [ -f "../assets/icon.png" ]; then
        mkdir -p phantomfox/browser/chrome/icons/default
        cp ../assets/icon.png phantomfox/browser/chrome/icons/default/default128.png
    fi
    log_info "Build injected."
}

package_build() {
    tar -czf "${OUTPUT_TAR}" phantomfox/
    mv "${OUTPUT_TAR}" ../
}

prepare_environment
fetch_upstream
extract_and_rebrand
package_build
