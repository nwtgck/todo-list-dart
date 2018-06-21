#! /bin/bash -x

cd `dirname $0`

# Force to fail all if a command fails
# (from: http://fj.hatenablog.jp/entry/2017/05/20/192431)
set -eu -o pipefail
trap 'echo "ERROR: line no = $LINENO, exit status = $?" >&2; exit 1' ERR

# Build
# (from: https://webdev.dartlang.org/angular/guide/deployment)
pub build
# Publish to gh-pages
gh-pages -m "[AUTO] Update document" -d build/web/
