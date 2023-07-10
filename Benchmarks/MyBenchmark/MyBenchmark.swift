import Benchmark
import Tokenizer

struct TestSink {
    var tokens = [Token]()
}

extension TestSink: TokenSink {
    mutating func process(_ token: __owned Token) {
        self.tokens.append(consume token)
    }
}

let benchmarks = {
    let html = #"""
    <!DOCTYPE html>
    <html lang="en">
    <head>
    <meta charset="UTF-8" />
    <title>title</title>
    </head>
    <body>
    hi
    </body>
    </html>
    """#

    Benchmark("TokenizerBenchmark", configuration: .init(scalingFactor: .mega)) { benchmark in
        let sink = TestSink()
        var tokenizer = Tokenizer(sink: consume sink)
        var iter = html.makeIterator()
        benchmark.startMeasurement()
        for _ in benchmark.scaledIterations {
            tokenizer.tokenize(&iter)
        }
    }
}
