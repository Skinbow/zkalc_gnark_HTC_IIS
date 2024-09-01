set -e

zkalc_benchmarks () {
    pushd $1

    pushd fr

    #go test -run none -bench BenchmarkElementAdd
    #go test -run none -bench 'BenchmarkElementMul\b'
    #go test -run none -bench BenchmarkElementInverse

    #go test -v -run none -bench BenchmarkElementSquare
    #go test -v -run none -bench BenchmarkElementSqrt

    popd

    # if [ -d fr/fft ]
    # then
    #     pushd fr/fft

    #     #go test -run none -bench BenchmarkFFT

    #     popd
    # fi

    # go test -run none -bench 'BenchmarkG1JacAdd\b'
    # go test -run none -bench 'BenchmarkG1JacScalarMultiplication\b'
    # go test -run none -bench 'BenchmarkMultiExpG1\b'

    # go test -run none -bench BenchmarkG1JacIsInSubGroup
    # go test -run none -bench BenchmarkG1AffineCofactorClearing

    # go test -run none -bench BenchmarkHashToG1

    # go test -run none -bench 'BenchmarkG2JacAdd\b'
    # go test -run none -bench 'BenchmarkG2JacScalarMultiplication\b'
    # go test -run none -bench 'BenchmarkMultiExpG2\b'

    # go test -run none -bench BenchmarkG2JacIsInSubGroup
    # go test -run none -bench BenchmarkG2AffineCofactorClearing

    # go test -run none -bench BenchmarkHashToG2

    # if [ -d internal/fptower ]
    # then
    #     pushd internal/fptower

    #     go test -run none -bench BenchmarkE12Mul
    #     go test -run none -bench BenchmarkE12Expt
    #     # go test -run none -bench BenchmarkE12Cyclosquare

    #     popd
    # fi

    # go test -run none -bench BenchmarkPairing
    # go test -run none -bench BenchmarkMultiPair

    go test -run none -bench BenchmarkG1AffineBatchScalarMultiplication

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
