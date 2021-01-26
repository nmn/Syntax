
import Foundation

extension Parser {

    func optimize(using prefixes: String...) -> AnyParser<Output> {
        return OptimizedPrefixes(parser: internalParser(), optimizations: Set(prefixes)).eraseToAnyParser()
    }

    func optimize(using prefixes: Set<String>) -> AnyParser<Output> {
        return OptimizedPrefixes(parser: internalParser(), optimizations: prefixes).eraseToAnyParser()
    }

}

private struct OptimizedPrefixes<Output>: Parser, Identified {
    public let id = UUID()
    let parser: InternalParser
    let optimizations: Set<String>

    var body: AnyParser<Output> {
        return neverBody()
    }
}

extension OptimizedPrefixes: InternalParser {

    func prefixes() -> Set<String> {
        return optimizations
    }

    func parse(using scanner: Scanner) throws {
        try scanner.parse(using: parser)
    }

}
