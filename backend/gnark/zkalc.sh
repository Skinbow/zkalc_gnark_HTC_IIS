set -e

zkalc_benchmarks () {
    pushd $1

    pushd fr
    go test -run none -bench BenchmarkElementAdd
    popd

    go test -run none -bench BenchmarkG1JacIsInSubGroup
    go test -run none -bench BenchmarkHashToG1

    popd
}


if test "$#" -ne 2; then
    echo "Usage: zkalc.sh <EC directory>"
    echo "For example: 'bash zkalc.sh bls12-381')"
    exit
fi

pushd $1/ecc
zkalc_benchmarks $2
popd
