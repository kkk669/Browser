import Foundation
public import Testing
import Tokenizer

private struct TestSink {
    var tokens = [Token]()
    var errors = [ParseError]()
}

extension TestSink: TokenSink {
    mutating func process(_ token: consuming Token) {
        switch consume token {
        case .error(let error): self.errors.append(consume error)
        case let token: self.tokens.append(token)
        }
    }
}

// swift-format-ignore: NeverUseForceTry, NeverForceUnwrap
private let testCases = try! [
    Bundle.module.url(forResource: "test1", withExtension: "test")!,
    Bundle.module.url(forResource: "test2", withExtension: "test")!,
    Bundle.module.url(forResource: "test3", withExtension: "test")!,
    Bundle.module.url(forResource: "test4", withExtension: "test")!,
    Bundle.module.url(forResource: "unicodeChars", withExtension: "test")!,
]
.flatMap { try parseTestCases(from: Data(contentsOf: $0)) }

@Test("html5lib-tests", arguments: testCases)
public func html5libTests(_ testCase: TestCase) throws {
    // TODO: Do not ignore any test cases
    switch testCase.title {
    // test1.test
    case "Entity with trailing semicolon (1)": return
    case "Entity with trailing semicolon (2)": return
    case "Entity without trailing semicolon (1)": return
    case "Entity without trailing semicolon (2)": return
    case "Entity in attribute without semicolon": return
    // test2.test
    case "Entity + newline": return
    case _: break
    }

    var tokenizer = Tokenizer(sink: TestSink())
    tokenizer.state = testCase.initialState
    var iter = testCase.input.makeIterator()
    tokenizer.tokenize(&iter)

    let tokens = tokenizer.sink.tokens
    let errors = tokenizer.sink.errors
    #expect(tokens == testCase.tokens)
    #expect(errors.count == testCase.errors.count)  // TODO: Make it stricter
}
