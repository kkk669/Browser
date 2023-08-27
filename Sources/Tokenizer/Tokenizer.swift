@freestanding(codeItem) macro go(emit token: Character) = #externalMacro(module: "TokenizerMacros", type: "GoMacro")
@freestanding(codeItem) macro go(error: ParseError..., emit token: Token...) = #externalMacro(module: "TokenizerMacros", type: "GoMacro")
@freestanding(codeItem) macro go(error: ParseError..., emit token: Token..., to state: State) = #externalMacro(module: "TokenizerMacros", type: "GoMacro")
@freestanding(codeItem) macro go(error: ParseError..., emit token: Token..., reconsume c: Character, to state: State) = #externalMacro(module: "TokenizerMacros", type: "GoMacro")
@freestanding(codeItem) macro go(error: ParseError..., createComment c: Character, to state: State) = #externalMacro(module: "TokenizerMacros", type: "GoMacro")
@freestanding(codeItem) macro go(error: ParseError..., createComment s: String, to state: State) = #externalMacro(module: "TokenizerMacros", type: "GoMacro")
@freestanding(codeItem) macro go(error: ParseError..., appendComment c: Character) = #externalMacro(module: "TokenizerMacros", type: "GoMacro")
@freestanding(codeItem) macro go(error: ParseError..., clearComment state: State) = #externalMacro(module: "TokenizerMacros", type: "GoMacro")
@freestanding(codeItem) macro go(error: ParseError..., emitComment state: State) = #externalMacro(module: "TokenizerMacros", type: "GoMacro")
@freestanding(codeItem) macro goEmitCommentAndEOF() = #externalMacro(module: "TokenizerMacros", type: "GoMacro")
@freestanding(codeItem) macro go(error: ParseError..., createStartTag s: String, to state: State) = #externalMacro(module: "TokenizerMacros", type: "GoMacro")
@freestanding(codeItem) macro go(error: ParseError..., createEndTag c: Character, to state: State) = #externalMacro(module: "TokenizerMacros", type: "GoMacro")
@freestanding(codeItem) macro go(error: ParseError..., createEndTag s: String, to state: State) = #externalMacro(module: "TokenizerMacros", type: "GoMacro")
@freestanding(codeItem) macro go(error: ParseError..., appendTagName c: Character) = #externalMacro(module: "TokenizerMacros", type: "GoMacro")
@freestanding(codeItem) macro go(error: ParseError..., appendTagName s: String) = #externalMacro(module: "TokenizerMacros", type: "GoMacro")
@freestanding(codeItem) macro go(error: ParseError..., createAttr c: Character, to state: State) = #externalMacro(module: "TokenizerMacros", type: "GoMacro")
@freestanding(codeItem) macro go(error: ParseError..., createAttr s: String, to state: State) = #externalMacro(module: "TokenizerMacros", type: "GoMacro")
@freestanding(codeItem) macro go(error: ParseError..., appendAttrName c: Character) = #externalMacro(module: "TokenizerMacros", type: "GoMacro")
@freestanding(codeItem) macro go(error: ParseError..., appendAttrName s: String) = #externalMacro(module: "TokenizerMacros", type: "GoMacro")
@freestanding(codeItem) macro go(error: ParseError..., appendAttrValue c: Character) = #externalMacro(module: "TokenizerMacros", type: "GoMacro")
@freestanding(codeItem) macro go(error: ParseError..., emitTag state: State) = #externalMacro(module: "TokenizerMacros", type: "GoMacro")
@freestanding(codeItem) macro go(error: ParseError..., emitSelfClosingTag state: State) = #externalMacro(module: "TokenizerMacros", type: "GoMacro")
@freestanding(codeItem) macro go(error: ParseError..., createDOCTYPE c: Character, to state: State) = #externalMacro(module: "TokenizerMacros", type: "GoMacro")
@freestanding(codeItem) macro go(error: ParseError..., createDOCTYPE s: String, to state: State) = #externalMacro(module: "TokenizerMacros", type: "GoMacro")
@freestanding(codeItem) macro go(error: ParseError..., appendDOCTYPEName c: Character) = #externalMacro(module: "TokenizerMacros", type: "GoMacro")
@freestanding(codeItem) macro go(error: ParseError..., forceQuirks state: State) = #externalMacro(module: "TokenizerMacros", type: "GoMacro")
@freestanding(codeItem) macro go(error: ParseError..., emitDOCTYPE state: State) = #externalMacro(module: "TokenizerMacros", type: "GoMacro")
@freestanding(codeItem) macro go(error: ParseError..., emitForceQuirksDOCTYPE state: State) = #externalMacro(module: "TokenizerMacros", type: "GoMacro")
@freestanding(codeItem) macro go(error: ParseError..., emitNewForceQuirksDOCTYPE state: State) = #externalMacro(module: "TokenizerMacros", type: "GoMacro")
@freestanding(codeItem) macro goEmitDOCTYPEAndEOF() = #externalMacro(module: "TokenizerMacros", type: "GoMacro")
@freestanding(codeItem) macro goEmitForceQuirksDOCTYPEAndEOF() = #externalMacro(module: "TokenizerMacros", type: "GoMacro")
@freestanding(codeItem) macro goEmitNewForceQuirksDOCTYPEAndEOF() = #externalMacro(module: "TokenizerMacros", type: "GoMacro")
@freestanding(codeItem) macro goConsumeCharRef() = #externalMacro(module: "TokenizerMacros", type: "GoMacro")

public struct Tokenizer<Sink: TokenSink>: ~Copyable {
    public var sink: Sink
    var state: State
    var reconsumeChar: Optional<Character>
    var charRefTokenizer: Optional<CharRefTokenizer>
    var currentTagName: String
    var currentTagKind: TagKind
    var currentAttrName: String
    var currentAttrValue: String
    var currentAttrs: [Attribute]
    var currentComment: String
    var currentDOCTYPE: DOCTYPE

    public init(sink: consuming Sink) {
        self.sink = consume sink
        self.state = .data
        self.reconsumeChar = nil
        self.charRefTokenizer = nil
        self.currentTagName = ""
        self.currentTagKind = .start
        self.currentAttrName = ""
        self.currentAttrValue = ""
        self.currentAttrs = []
        self.currentComment = ""
        self.currentDOCTYPE = .init()
    }

    // TODO: Consider input type
    public mutating func tokenize(_ input: inout String.Iterator) {
        loop: while true {
            switch self.step(&input) {
            case .continue: break
            case .suspend: break loop
            }
        }
    }

    private mutating func step(_ input: inout String.Iterator) -> ProcessResult {
        self.charRefTokenizer?.tokenize(&input)

        switch self.state {
        case .data: while true {
            switch self.getChar(from: &input) {
            case "&": #goConsumeCharRef
            case "<": #go(to: .tagOpen)
            case "\0": #go(error: .unexpectedNull, emit: "\0")
            case nil: #go(emit: .eof)
            case let c?: #go(emit: c)
            }
        }
        case .rcdata: while true {
            switch self.getChar(from: &input) {
            case "&": #goConsumeCharRef
            case "<": #go(to: .rcdataLessThanSign)
            case "\0": #go(error: .unexpectedNull, emit: "\u{FFFD}")
            case nil: #go(emit: .eof)
            case let c?: #go(emit: c)
            }
        }
        case .rawtext: while true {
            switch self.getChar(from: &input) {
            case "<": #go(to: .rawtextLessThanSign)
            case "\0": #go(error: .unexpectedNull, emit: "\u{FFFD}")
            case nil: #go(emit: .eof)
            case let c?: #go(emit: c)
            }
        }
        case .scriptData: while true {
            switch self.getChar(from: &input) {
            case "<": #go(to: .scriptDatalessThanSign)
            case "\0": #go(error: .unexpectedNull, emit: "\u{FFFD}")
            case nil: #go(emit: .eof)
            case let c?: #go(emit: c)
            }
        }
        case .plaintext: while true {
            switch self.getChar(from: &input) {
            case "\0": #go(error: .unexpectedNull, emit: "\u{FFFD}")
            case nil: #go(emit: .eof)
            case let c?: #go(emit: c)
            }
        }
        case .tagOpen: while true {
            switch self.getChar(from: &input) {
            case "!": #go(to: .markupDeclarationOpen)
            case "/": #go(to: .endTagOpen)
            case "?": #go(error: .unexpectedQuestionMark, createComment: "?", to: .bogusComment)
            case nil: #go(error: .eofBeforeTagName, emit: "<", .eof)
            case let c? where c.isASCII && c.isLetter: #go(createStartTag: c.lowercased(), to: .tagName)
            case let c?: #go(error: .invalidFirstChar, emit: "<", reconsume: c, to: .data)
            }
        }
        case .endTagOpen: while true {
            switch self.getChar(from: &input) {
            case ">": #go(error: .missingEndTagName, to: .data)
            case "\0": #go(error: .invalidFirstChar, .unexpectedNull, createComment: "\u{FFFD}", to: .bogusComment)
            case nil: #go(error: .eofBeforeTagName, emit: "<", "/", .eof)
            case let c? where c.isASCII && c.isLetter: #go(createEndTag: c.lowercased(), to: .tagName)
            case let c?: #go(error: .invalidFirstChar, createComment: c, to: .bogusComment)
            }
        }
        case .tagName: while true {
            switch self.getChar(from: &input) {
            case "\t", "\n", "\u{0C}", " ": #go(to: .beforeAttributeName)
            case "/": #go(to: .selfClosingStartTag)
            case ">": #go(emitTag: .data)
            case "\0": #go(error: .unexpectedNull, appendTagName: "\u{FFFD}")
            case nil: #go(error: .eofInTag, emit: .eof)
            case let c? where c.isASCII && c.isUppercase: #go(appendTagName: c.lowercased())
            case let c?: #go(appendTagName: c)
            }
        }
        case .rcdataLessThanSign: while true {
            switch self.getChar(from: &input) {
            case "/":
                // TODO: Set the temporary buffer to the empty string
                #go(to: .rcdataEndTagOpen)
            case nil: #go(emit: "<", .eof)
            case let c?: #go(emit: "<", reconsume: c, to: .rcdata)
            }
        }
        case .rcdataEndTagOpen: while true {
            switch self.getChar(from: &input) {
            case let c? where c.isASCII && c.isLetter: #go(createEndTag: c, to: .rcdataEndTagName)
            case nil: #go(emit: "<", "/", .eof)
            case let c?: #go(emit: "<", "/", reconsume: c, to: .rcdata)
            }
        }
        case .rcdataEndTagName: while true {
            let c = self.getChar(from: &input)
            // FIXME: Implement lastStartTagName
            let lastStartTagName: String? = nil
            if self.currentTagKind == .end && self.currentTagName == lastStartTagName {
                switch c {
                case "\t", "\n", "\u{0C}", " ": #go(to: .beforeAttributeName)
                case "/": #go(to: .selfClosingStartTag)
                case ">": #go(emitTag: .data)
                case _: break
                }
            }
            switch c {
            case let c? where c.isASCII && c.isUppercase:
                #go(appendTagName: c.lowercased())
                // TODO: Append the current input character to the temporary buffer
            case let c? where c.isASCII && c.isLowercase:
                #go(appendTagName: c)
                // TODO: Append the current input character to the temporary buffer
            case let c?:
                #go(emit: "<", "/")
                // TODO: Emit a character token for each of the characters in the temporary buffer (in the order they were added to the buffer)
                #go(reconsume: c, to: .rcdata)
            case nil:
                #go(emit: "<", "/")
                // TODO: Emit a character token for each of the characters in the temporary buffer (in the order they were added to the buffer)
                #go(emit: .eof)
            }
        }
        case .beforeAttributeName: while true {
            switch self.getChar(from: &input) {
            case "\t", "\n", "\u{0C}", " ": break
            case "/": #go(to: .selfClosingStartTag)
            case ">": #go(emitTag: .data)
            case "=": #go(error: .unexpectedEqualsSign, createAttr: "=", to: .attributeName)
            case "\0": #go(error: .unexpectedNull, createAttr: "\u{FFFD}", to: .attributeName)
            case "\"": #go(error: .unexpectedCharInAttrName, createAttr: "\"", to: .attributeName)
            case "'": #go(error: .unexpectedCharInAttrName, createAttr: "'", to: .attributeName)
            case "<": #go(error: .unexpectedCharInAttrName, createAttr: "<", to: .attributeName)
            case nil: #go(error: .eofInTag, emit: .eof)
            case let c? where c.isASCII && c.isUppercase: #go(createAttr: c.lowercased(), to: .attributeName)
            case let c?: #go(createAttr: c, to: .attributeName)
            }
        }
        case .attributeName: while true {
            switch self.getChar(from: &input) {
            case "\t", "\n", "\u{0C}", " ": break
            case "/": #go(to: .selfClosingStartTag)
            case ">": #go(emitTag: .data)
            case "=": #go(to: .beforeAttributeValue)
            case "\0": #go(error: .unexpectedNull, appendAttrName: "\u{FFFD}")
            case "\"": #go(error: .unexpectedCharInAttrName, appendAttrName: "\"")
            case "'": #go(error: .unexpectedCharInAttrName, appendAttrName: "'")
            case "<": #go(error: .unexpectedCharInAttrName, appendAttrName: "<")
            case nil: #go(error: .eofInTag, emit: .eof)
            case let c? where c.isASCII && c.isUppercase: #go(appendAttrName: c.lowercased())
            case let c?: #go(appendAttrName: c)
            }
        }
        case .afterAttributeName: while true {
            switch self.getChar(from: &input) {
            case "\t", "\n", "\u{0C}", " ": break
            case "/": #go(to: .selfClosingStartTag)
            case ">": #go(emitTag: .data)
            case "=": #go(to: .beforeAttributeValue)
            case "\0": #go(error: .unexpectedNull, createAttr: "\u{FFFD}", to: .attributeName)
            case "\"": #go(error: .unexpectedCharInAttrName, createAttr: "\"", to: .attributeName)
            case "'": #go(error: .unexpectedCharInAttrName, createAttr: "'", to: .attributeName)
            case "<": #go(error: .unexpectedCharInAttrName, createAttr: "<", to: .attributeName)
            case nil: #go(error: .eofInTag, emit: .eof)
            case let c? where c.isASCII && c.isUppercase: #go(createAttr: c.lowercased(), to: .attributeName)
            case let c?: #go(createAttr: c, to: .attributeName)
            }
        }
        case .beforeAttributeValue: while true {
            switch self.getChar(from: &input) {
            case "\t", "\n", "\u{0C}", " ": break
            case "\"": #go(to: .attributeValueDoubleQuoted)
            case "'": #go(to: .attributeValueSingleQuoted)
            case ">": #go(error: .missingAttrValue, emitTag: .data)
            case nil: #go(error: .eofInTag, emit: .eof)
            case let c?: #go(reconsume: c, to: .attributeValueUnquoted)
            }
        }
        case .attributeValueDoubleQuoted: while true {
            switch self.getChar(from: &input) {
            case "\"": #go(to: .afterAttributeValueQuoted)
            case "&": #goConsumeCharRef
            case "\0": #go(error: .unexpectedNull, appendAttrValue: "\u{FFFD}")
            case nil: #go(error: .eofInTag, emit: .eof)
            case let c?: #go(appendAttrValue: c)
            }
        }
        case .attributeValueSingleQuoted: while true {
            switch self.getChar(from: &input) {
            case "'": #go(to: .afterAttributeValueQuoted)
            case "&": #goConsumeCharRef
            case "\0": #go(error: .unexpectedNull, appendAttrValue: "\u{FFFD}")
            case nil: #go(error: .eofInTag, emit: .eof)
            case let c?: #go(appendAttrValue: c)
            }
        }
        case .attributeValueUnquoted: while true {
            switch self.getChar(from: &input) {
            case "\t", "\n", "\u{0C}", " ": #go(to: .beforeAttributeName)
            case "&": #goConsumeCharRef
            case ">": #go(emitTag: .data)
            case "\0": #go(error: .unexpectedNull, appendAttrValue: "\u{FFFD}")
            case nil: #go(error: .eofInTag, emit: .eof)
            case "\"": #go(error: .unexpectedCharInUnquotedAttrValue, appendAttrValue: "\"")
            case "'": #go(error: .unexpectedCharInUnquotedAttrValue, appendAttrValue: "'")
            case "<": #go(error: .unexpectedCharInUnquotedAttrValue, appendAttrValue: "\"")
            case "=": #go(error: .unexpectedCharInUnquotedAttrValue, appendAttrValue: "\"")
            case "`": #go(error: .unexpectedCharInUnquotedAttrValue, appendAttrValue: "\"")
            case let c?: #go(appendAttrValue: c)
            }
        }
        case .afterAttributeValueQuoted: while true {
            switch self.getChar(from: &input) {
            case "\t", "\n", "\u{0C}", " ": #go(to: .beforeAttributeName)
            case "/": #go(to: .selfClosingStartTag)
            case ">": #go(emitTag: .data)
            case nil: #go(error: .eofInTag, emit: .eof)
            case let c?: #go(error: .missingSpaceBetweenAttrs, reconsume: c, to: .beforeAttributeName)
            }
        }
        case .selfClosingStartTag: while true {
            switch self.getChar(from: &input) {
            case ">": #go(emitSelfClosingTag: .data)
            case nil: #go(error: .eofInTag, emit: .eof)
            case let c?: #go(error: .unexpectedSolidus, reconsume: c, to: .beforeAttributeName)
            }
        }
        case .bogusComment: while true {
            switch self.getChar(from: &input) {
            case ">": #go(emitComment: .data)
            case "\0": #go(error: .unexpectedNull, appendComment: "\u{FFFD}")
            case nil: #goEmitCommentAndEOF
            case let c?: #go(appendComment: c)
            }
        }
        case .markupDeclarationOpen: while true {
            if self.startsExact(&input, with: "--") == true {
                #go(clearComment: .commentStart)
            } else if self.starts(&input, with: "doctype") == true {
                #go(to: .doctype)
            } else if self.startsExact(&input, with: "[CDATA[") == true {
                if false {
                    // TODO: If there is an adjusted current node and it is not an element in the HTML namespace, then switch to the CDATA section state.
                    #go(to: .cdataSection)
                } else {
                    #go(error: .cdataInHTML, createComment: "[CDATA[", to: .bogusComment)
                }
            } else {
                #go(error: .incorrectlyOpenedComment, clearComment: .bogusComment)
            }
        }
        case .doctype: while true {
            switch self.getChar(from: &input) {
            case "\t", "\n", "\u{0C}", " ": #go(to: .beforeDOCTYPEName)
            case ">": #go(reconsume: ">", to: .beforeDOCTYPEName)
            case nil: self.emitError(.eofInDOCTYPE); #goEmitNewForceQuirksDOCTYPEAndEOF
            case let c?: #go(error: .missingSpaceBeforeDOCTYPEName, reconsume: c, to: .beforeDOCTYPEName)
            }
        }
        case .beforeDOCTYPEName: while true {
            switch self.getChar(from: &input) {
            case "\t", "\n", "\u{0C}", " ": break
            case "\0": #go(error: .unexpectedNull, createDOCTYPE: "\u{FFFD}", to: .doctypeName)
            case ">": #go(error: .missingDOCTYPEName, emitNewForceQuirksDOCTYPE: .data)
            case nil: self.emitError(.eofInDOCTYPE); #goEmitNewForceQuirksDOCTYPEAndEOF
            case let c? where c.isASCII && c.isUppercase: #go(createDOCTYPE: c.lowercased(), to: .doctypeName)
            case let c?: #go(createDOCTYPE: c, to: .doctypeName)
            }
        }
        case .doctypeName: while true {
            switch self.getChar(from: &input) {
            case "\t", "\n", "\u{0C}", " ": #go(to: .afterDOCTYPEName)
            case ">": #go(emitDOCTYPE: .data)
            case "\0": #go(error: .unexpectedNull, appendDOCTYPEName: "\u{FFFD}")
            case nil: self.emitError(.eofInDOCTYPE); #goEmitForceQuirksDOCTYPEAndEOF
            case let c? where c.isASCII && c.isUppercase: self.appendDOCTYPEName(c.lowercased())
            case let c?: self.appendDOCTYPEName(c)
            }
        }
        case .afterDOCTYPEName: while true {
            if self.starts(&input, with: "public") == true {
                #go(to: .afterDOCTYPEPublicKeyword)
            } else if self.starts(&input, with: "system") == true {
                #go(to: .afterDOCTYPESystemKeyword)
            } else {
                switch self.getChar(from: &input) {
                case "\t", "\n", "\u{0C}", " ": break
                case ">": #go(emitDOCTYPE: .data)
                case "\0": #go(error: .invalidCharSequence, .unexpectedNull, forceQuirks: .bogusDOCTYPE)
                case nil: self.emitError(.eofInDOCTYPE); #goEmitForceQuirksDOCTYPEAndEOF
                case _: #go(error: .invalidCharSequence, forceQuirks: .bogusDOCTYPE)
                }
            }
        }
        case .afterDOCTYPEPublicKeyword: while true {
            switch self.getChar(from: &input) {
            case "\t", "\n", "\u{0C}", " ": #go(to: .beforeDOCTYPEPublicIdentifier)
            case "\"":
                self.emitError(.missingSpaceAfterDOCTYPEPublicKeyword)
                // TODO: Set the current DOCTYPE token's public identifier to the empty string (not missing)
                #go(to: .doctypePublicIdentifierDoubleQuoted)
            case "'":
                self.emitError(.missingSpaceAfterDOCTYPEPublicKeyword)
                // TODO: Set the current DOCTYPE token's public identifier to the empty string (not missing)
                #go(to: .doctypePublicIdentifierSingleQuoted)
            case ">": #go(error: .missingDOCTYPEPublicID, emitForceQuirksDOCTYPE: .data)
            case nil: self.emitError(.eofInDOCTYPE); #goEmitForceQuirksDOCTYPEAndEOF
            case "\0": #go(error: .missingQuoteBeforeDOCTYPEPublicID, .unexpectedNull, forceQuirks: .bogusDOCTYPE)
            case _: #go(error: .missingQuoteBeforeDOCTYPEPublicID, forceQuirks: .bogusDOCTYPE)
            }
        }
        case .beforeDOCTYPEPublicIdentifier: while true {
            switch self.getChar(from: &input) {
            case "\t", "\n", "\u{0C}", " ": break
            case "\"":
                // TODO: Set the current DOCTYPE token's public identifier to the empty string (not missing)
                #go(to: .doctypePublicIdentifierDoubleQuoted)
            case "'":
                // TODO: Set the current DOCTYPE token's public identifier to the empty string (not missing)
                #go(to: .doctypePublicIdentifierSingleQuoted)
            case ">": #go(error: .missingDOCTYPEPublicID, emitForceQuirksDOCTYPE: .data)
            case nil: self.emitError(.eofInDOCTYPE); #goEmitForceQuirksDOCTYPEAndEOF
            case "\0": #go(error: .missingQuoteBeforeDOCTYPEPublicID, .unexpectedNull, forceQuirks: .bogusDOCTYPE)
            case _: #go(error: .missingQuoteBeforeDOCTYPEPublicID, forceQuirks: .bogusDOCTYPE)
            }
        }
        case .doctypePublicIdentifierDoubleQuoted: while true {
            switch self.getChar(from: &input) {
            case _: preconditionFailure("Not implemented")
            }
        }
        case .doctypePublicIdentifierSingleQuoted: while true {
            switch self.getChar(from: &input) {
            case _: preconditionFailure("Not implemented")
            }
        }
        case .afterDOCTYPEPublicIdentifier: while true {
            switch self.getChar(from: &input) {
            case _: preconditionFailure("Not implemented")
            }
        }
        case .betweenDOCTYPEPublicAndSystemIdentifiers: while true {
            switch self.getChar(from: &input) {
            case _: preconditionFailure("Not implemented")
            }
        }
        case .afterDOCTYPESystemKeyword: while true {
            switch self.getChar(from: &input) {
            case _: preconditionFailure("Not implemented")
            }
        }
        case .beforeDOCTYPESystemIdentifier: while true {
            switch self.getChar(from: &input) {
            case _: preconditionFailure("Not implemented")
            }
        }
        case .doctypeSystemIdentifierDoubleQuoted: while true {
            switch self.getChar(from: &input) {
            case _: preconditionFailure("Not implemented")
            }
        }
        case .doctypeSystemIdentifierSingleQuoted: while true {
            switch self.getChar(from: &input) {
            case _: preconditionFailure("Not implemented")
            }
        }
        case .afterDOCTYPESystemIdentifier: while true {
            switch self.getChar(from: &input) {
            case _: preconditionFailure("Not implemented")
            }
        }
        case .bogusDOCTYPE: while true {
            switch self.getChar(from: &input) {
            case ">": #go(emitDOCTYPE: .data)
            case "\0": self.emitError(.unexpectedNull)
            case nil: #goEmitDOCTYPEAndEOF
            case _: break
            }
        }
        case .cdataSection: while true {
            switch self.getChar(from: &input) {
            case "]": #go(to: .cdataSectionBracket)
            case nil: #go(error: .eofInCDATA, emit: .eof)
            case let c?: #go(emit: c)
            }
        }
        case .cdataSectionBracket: while true {
            switch self.getChar(from: &input) {
            case "]": #go(to: .cdataSectionEnd)
            case nil: #go(error: .eofInCDATA, emit: "]", .eof)
            case let c?: #go(emit: "]", .char(c), to: .cdataSection)
            }
        }
        case .cdataSectionEnd: while true {
            switch self.getChar(from: &input) {
            case "]": #go(emit: "]")
            case ">": #go(to: .data)
            case nil: #go(error: .eofInCDATA, emit: "]", .eof)
            case let c?: #go(emit: "]", .char(c), to: .cdataSection)
            }
        }
        case _:
            preconditionFailure("Not implemented")
        }
    }

    @inline(__always)
    private mutating func getChar(from input: inout String.Iterator) -> Character? {
        if let reconsumeChar {
            self.reconsumeChar = nil
            return reconsumeChar
        } else {
            return input.next()
        }
    }

    private mutating func startsExact(
        _ input: inout String.Iterator,
        with pattern: consuming some StringProtocol
    ) -> Bool? {
        let initial = input
        for pc in consume pattern {
            guard let c = input.next() else {
                input = consume initial
                return nil
            }
            guard c == pc else {
                input = consume initial
                return false
            }
        }
        return true
    }

    private mutating func starts(
        _ input: inout String.Iterator,
        with pattern: consuming some StringProtocol
    ) -> Bool? {
        let initial = input
        for pc in consume pattern {
            guard let c = input.next() else {
                input = consume initial
                return nil
            }
            guard c.lowercased() == pc.lowercased() else {
                input = consume initial
                return false
            }
        }
        return true
    }

    @inline(__always)
    private mutating func go(to state: consuming State) {
        self.state = consume state
    }

    @inline(__always)
    private mutating func go(reconsume c: consuming Character, to state: consuming State) {
        self.reconsumeChar = consume c
        self.state = consume state
    }

    @inline(__always)
    private mutating func consumeCharRef() {
        self.charRefTokenizer = .init()
    }

    @inline(__always)
    private mutating func createComment(with c: consuming Character) {
        self.currentComment = String(consume c)
    }

    @_disfavoredOverload
    @inline(__always)
    private mutating func createComment(with s: consuming String) {
        self.currentComment = consume s
    }

    @inline(__always)
    private mutating func createStartTag(with s: consuming String) {
        self.currentTagName = consume s
        self.currentTagKind = .start
        self.currentAttrs.removeAll()
    }

    @inline(__always)
    private mutating func createEndTag(with c: consuming Character) {
        self.currentTagName = String(consume c)
        self.currentTagKind = .end
        self.currentAttrs.removeAll()
    }

    @_disfavoredOverload
    @inline(__always)
    private mutating func createEndTag(with s: consuming String) {
        self.currentTagName = consume s
        self.currentTagKind = .end
        self.currentAttrs.removeAll()
    }

    @inline(__always)
    private mutating func createAttr(with c: consuming Character) {
        self.pushAttr()
        self.currentAttrName = String(consume c)
    }

    @_disfavoredOverload
    @inline(__always)
    private mutating func createAttr(with s: consuming String) {
        self.pushAttr()
        self.currentAttrName = consume s
    }

    @inline(__always)
    private mutating func pushAttr() {
        guard !self.currentAttrName.isEmpty else { return }
        self.currentAttrs.append(.init(name: self.currentAttrName, value: self.currentAttrValue))
        self.currentAttrName.removeAll()
        self.currentAttrValue.removeAll()
    }

    @inline(__always)
    private mutating func createDOCTYPE() {
        self.currentDOCTYPE = .init()
    }

    @inline(__always)
    private mutating func createDOCTYPE(with c: consuming Character) {
        self.currentDOCTYPE = .init(name: String(consume c))
    }

    @_disfavoredOverload
    @inline(__always)
    private mutating func createDOCTYPE(with s: consuming String) {
        self.currentDOCTYPE = .init(name: consume s)
    }

    @inline(__always)
    private mutating func appendDOCTYPEName(_ c: consuming Character) {
        switch self.currentDOCTYPE.name {
        case .some: self.currentDOCTYPE.name?.append(consume c)
        case .none: self.currentDOCTYPE.name = String(consume c)
        }
    }

    @_disfavoredOverload
    @inline(__always)
    private mutating func appendDOCTYPEName(_ s: consuming String) {
        switch self.currentDOCTYPE.name {
        case .some: self.currentDOCTYPE.name?.append(consume s)
        case .none: self.currentDOCTYPE.name = consume s
        }
    }

    @inline(__always)
    private mutating func forceQuirks() {
        self.currentDOCTYPE.forceQuirks = true
    }

    @inline(__always)
    private mutating func emitError(_ error: consuming ParseError) {
        self.sink.process(.error(consume error))
    }

    @inline(__always)
    private mutating func emitEOF() {
        self.sink.process(.eof)
    }

    @inline(__always)
    private mutating func emit(_ c: consuming Character) {
        self.sink.process(.char(consume c))
    }

    @_disfavoredOverload
    @inline(__always)
    private mutating func emit(_ token: consuming Token) {
        self.sink.process(consume token)
    }

    @inline(__always)
    private mutating func emitTag() {
        self.pushAttr()
        self.sink.process(
            .tag(
                Tag(
                    name: self.currentTagName,
                    kind: self.currentTagKind,
                    attrs: self.currentAttrs,
                    selfClosing: false
                )
            )
        )
    }

    @inline(__always)
    private mutating func emitSelfClosingTag() {
        self.pushAttr()
        self.sink.process(
            .tag(
                Tag(
                    name: self.currentTagName,
                    kind: self.currentTagKind,
                    attrs: self.currentAttrs,
                    selfClosing: true
                )
            )
        )
    }

    @inline(__always)
    private mutating func emitComment() {
        self.sink.process(.comment(self.currentComment))
    }

    @inline(__always)
    private mutating func emitDOCTYPE() {
        self.sink.process(.doctype(self.currentDOCTYPE))
    }
}
