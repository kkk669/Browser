@freestanding(codeItem) macro go(to: State) = #externalMacro(module: "TokenizerMacros", type: "GoMacro")
@freestanding(codeItem) macro go(reconsume: Char, in: State) = #externalMacro(module: "TokenizerMacros", type: "GoMacro")
@freestanding(codeItem) macro go(emit: Char) = #externalMacro(module: "TokenizerMacros", type: "GoMacro")
@freestanding(codeItem) macro go(emit: Char, _: Char, _: Char, to: State) = #externalMacro(module: "TokenizerMacros", type: "GoMacro")
@freestanding(codeItem) macro go(emit: Char, _: Char, _: Token) = #externalMacro(module: "TokenizerMacros", type: "GoMacro")
@freestanding(codeItem) macro go(emit: Char, _: Char, to: State) = #externalMacro(module: "TokenizerMacros", type: "GoMacro")
@freestanding(codeItem) macro go(emit: Char, _: Char, reconsume: Char, in: State) = #externalMacro(module: "TokenizerMacros", type: "GoMacro")
@freestanding(codeItem) macro go(emit: Char, _: Char, emitTempAndEmit: Token) = #externalMacro(module: "TokenizerMacros", type: "GoMacro")
@freestanding(codeItem) macro go(emit: Char, _: Char, emitTempAndReconsume: Char, in: State) = #externalMacro(module: "TokenizerMacros", type: "GoMacro")
@freestanding(codeItem) macro go(emit: Char, _: Token) = #externalMacro(module: "TokenizerMacros", type: "GoMacro")
@freestanding(codeItem) macro go(emit: Char, to: State) = #externalMacro(module: "TokenizerMacros", type: "GoMacro")
@freestanding(codeItem) macro go(emit: Char, reconsume: Char, in: State) = #externalMacro(module: "TokenizerMacros", type: "GoMacro")
@freestanding(codeItem) macro go(emit: Char, clearTemp: State) = #externalMacro(module: "TokenizerMacros", type: "GoMacro")
@freestanding(codeItem) macro go<S: ExpressibleByStringLiteral>(emit: S) = #externalMacro(module: "TokenizerMacros", type: "GoMacro")
@freestanding(codeItem) macro go(emit: Token) = #externalMacro(module: "TokenizerMacros", type: "GoMacro")
@freestanding(codeItem) macro go(emit: Token, _: Token) = #externalMacro(module: "TokenizerMacros", type: "GoMacro")
@freestanding(codeItem) macro go(emit: Token, _: Token, _: Token) = #externalMacro(module: "TokenizerMacros", type: "GoMacro")
@freestanding(codeItem) macro go(emit: Token, _: Token, _: Token, to: State) = #externalMacro(module: "TokenizerMacros", type: "GoMacro")
@freestanding(codeItem) macro go(emit: Token, _: Token, to: State) = #externalMacro(module: "TokenizerMacros", type: "GoMacro")
@freestanding(codeItem) macro go(emit: Token, _: Token, reconsume: Char, in: State) = #externalMacro(module: "TokenizerMacros", type: "GoMacro")
@freestanding(codeItem) macro go(emit: Token, to: State) = #externalMacro(module: "TokenizerMacros", type: "GoMacro")
@freestanding(codeItem) macro go(emit: Token, reconsume: Char, in: State) = #externalMacro(module: "TokenizerMacros", type: "GoMacro")
@freestanding(codeItem) macro go(createTemp: Char, emit: Char, _: Char, to: State) = #externalMacro(module: "TokenizerMacros", type: "GoMacro")
@freestanding(codeItem) macro go(appendTemp: Char, emit: Char) = #externalMacro(module: "TokenizerMacros", type: "GoMacro")
@freestanding(codeItem) macro go(clearTemp: State) = #externalMacro(module: "TokenizerMacros", type: "GoMacro")
@freestanding(codeItem) macro go(appendComment: Char) = #externalMacro(module: "TokenizerMacros", type: "GoMacro")
@freestanding(codeItem) macro go(appendComment: Char, to: State) = #externalMacro(module: "TokenizerMacros", type: "GoMacro")
@freestanding(codeItem) macro go(appendComment: String, to: State) = #externalMacro(module: "TokenizerMacros", type: "GoMacro")
@freestanding(codeItem) macro go(clearComment: State) = #externalMacro(module: "TokenizerMacros", type: "GoMacro")
@freestanding(codeItem) macro go(emitComment: State) = #externalMacro(module: "TokenizerMacros", type: "GoMacro")
@freestanding(codeItem) macro go(createStartTag: Char, to: State) = #externalMacro(module: "TokenizerMacros", type: "GoMacro")
@freestanding(codeItem) macro go(createEndTag: Char, to: State) = #externalMacro(module: "TokenizerMacros", type: "GoMacro")
@freestanding(codeItem) macro go(createEndTag: Char, appendTemp: Char, to: State) = #externalMacro(module: "TokenizerMacros", type: "GoMacro")
@freestanding(codeItem) macro go(appendTagName: Char) = #externalMacro(module: "TokenizerMacros", type: "GoMacro")
@freestanding(codeItem) macro go(appendTagName: Char, appendTemp: Char) = #externalMacro(module: "TokenizerMacros", type: "GoMacro")
@freestanding(codeItem) macro go(createAttr: Char, to: State) = #externalMacro(module: "TokenizerMacros", type: "GoMacro")
@freestanding(codeItem) macro go(appendAttrName: Char) = #externalMacro(module: "TokenizerMacros", type: "GoMacro")
@freestanding(codeItem) macro go(appendAttrName: Str) = #externalMacro(module: "TokenizerMacros", type: "GoMacro")
@freestanding(codeItem) macro go(appendAttrValue: Char) = #externalMacro(module: "TokenizerMacros", type: "GoMacro")
@freestanding(codeItem) macro go<S: ExpressibleByStringLiteral>(appendAttrValue: S) = #externalMacro(module: "TokenizerMacros", type: "GoMacro")
@freestanding(codeItem) macro go(emitTag: State) = #externalMacro(module: "TokenizerMacros", type: "GoMacro")
@freestanding(codeItem) macro go(emitSelfClosingTag: State) = #externalMacro(module: "TokenizerMacros", type: "GoMacro")
@freestanding(codeItem) macro go(createDOCTYPE: Char, to: State) = #externalMacro(module: "TokenizerMacros", type: "GoMacro")
@freestanding(codeItem) macro go(appendDOCTYPEName: Char) = #externalMacro(module: "TokenizerMacros", type: "GoMacro")
@freestanding(codeItem) macro go(appendPublicID: Char) = #externalMacro(module: "TokenizerMacros", type: "GoMacro")
@freestanding(codeItem) macro go(clearPublicID: State) = #externalMacro(module: "TokenizerMacros", type: "GoMacro")
@freestanding(codeItem) macro go(appendSystemID: Char) = #externalMacro(module: "TokenizerMacros", type: "GoMacro")
@freestanding(codeItem) macro go(clearSystemID: State) = #externalMacro(module: "TokenizerMacros", type: "GoMacro")
@freestanding(codeItem) macro go(emitDOCTYPE: State) = #externalMacro(module: "TokenizerMacros", type: "GoMacro")
@freestanding(codeItem) macro goEmitCommentAndEOF() = #externalMacro(module: "TokenizerMacros", type: "GoMacro")
@freestanding(codeItem) macro goEmitDOCTYPEAndEOF() = #externalMacro(module: "TokenizerMacros", type: "GoMacro")
@freestanding(codeItem) macro goEmitForceQuirksDOCTYPEAndEOF() = #externalMacro(module: "TokenizerMacros", type: "GoMacro")
@freestanding(codeItem) macro goEmitNewForceQuirksDOCTYPEAndEOF() = #externalMacro(module: "TokenizerMacros", type: "GoMacro")
@freestanding(codeItem) macro goConsumeCharRef(inAttr: Bool) = #externalMacro(module: "TokenizerMacros", type: "GoMacro")
@freestanding(codeItem) macro go(error: ParseError, _: ParseError, to: State) = #externalMacro(module: "TokenizerMacros", type: "GoMacro")
@freestanding(codeItem) macro go(error: ParseError, _: ParseError, createComment: String, to: State) = #externalMacro(module: "TokenizerMacros", type: "GoMacro")
@freestanding(codeItem) macro go(error: ParseError, _: ParseError, appendComment: String, to: State) = #externalMacro(module: "TokenizerMacros", type: "GoMacro")
@freestanding(codeItem) macro go(error: ParseError, _: ParseError, createAttr: Char, to: State) = #externalMacro(module: "TokenizerMacros", type: "GoMacro")
@freestanding(codeItem) macro go(error: ParseError, _: ParseError, createDOCTYPE: Char, to: State) = #externalMacro(module: "TokenizerMacros", type: "GoMacro")
@freestanding(codeItem) macro go(error: ParseError, _: ParseError, forceQuirks: State) = #externalMacro(module: "TokenizerMacros", type: "GoMacro")
@freestanding(codeItem) macro go(error: ParseError, to: State) = #externalMacro(module: "TokenizerMacros", type: "GoMacro")
@freestanding(codeItem) macro go(error: ParseError, emit: Char) = #externalMacro(module: "TokenizerMacros", type: "GoMacro")
@freestanding(codeItem) macro go(error: ParseError, emit: Char, _: Char, _: Char, to: State) = #externalMacro(module: "TokenizerMacros", type: "GoMacro")
@freestanding(codeItem) macro go(error: ParseError, emit: Char, _: Char, _: Token) = #externalMacro(module: "TokenizerMacros", type: "GoMacro")
@freestanding(codeItem) macro go(error: ParseError, emit: Char, _: Char, to: State) = #externalMacro(module: "TokenizerMacros", type: "GoMacro")
@freestanding(codeItem) macro go(error: ParseError, emit: Char, _: Token) = #externalMacro(module: "TokenizerMacros", type: "GoMacro")
@freestanding(codeItem) macro go(error: ParseError, emit: Char, to: State) = #externalMacro(module: "TokenizerMacros", type: "GoMacro")
@freestanding(codeItem) macro go(error: ParseError, emit: Char, reconsume: Char, in: State) = #externalMacro(module: "TokenizerMacros", type: "GoMacro")
@freestanding(codeItem) macro go(error: ParseError, emit: Token) = #externalMacro(module: "TokenizerMacros", type: "GoMacro")
@freestanding(codeItem) macro go(error: ParseError, emit: Token, _: Token) = #externalMacro(module: "TokenizerMacros", type: "GoMacro")
@freestanding(codeItem) macro go(error: ParseError, emit: Token, _: Token, _: Token) = #externalMacro(module: "TokenizerMacros", type: "GoMacro")
@freestanding(codeItem) macro go(error: ParseError, emit: Token, _: Token, _: Token, to: State) = #externalMacro(module: "TokenizerMacros", type: "GoMacro")
@freestanding(codeItem) macro go(error: ParseError, emit: Token, _: Token, to: State) = #externalMacro(module: "TokenizerMacros", type: "GoMacro")
@freestanding(codeItem) macro go(error: ParseError, emit: Token, _: Token, reconsume: Char, in: State) = #externalMacro(module: "TokenizerMacros", type: "GoMacro")
@freestanding(codeItem) macro go(error: ParseError, emit: Token, to: State) = #externalMacro(module: "TokenizerMacros", type: "GoMacro")
@freestanding(codeItem) macro go(error: ParseError, emit: Token, reconsume: Char, in: State) = #externalMacro(module: "TokenizerMacros", type: "GoMacro")
@freestanding(codeItem) macro go(error: ParseError, createComment: Char, to: State) = #externalMacro(module: "TokenizerMacros", type: "GoMacro")
@freestanding(codeItem) macro go(error: ParseError, createComment: String, to: State) = #externalMacro(module: "TokenizerMacros", type: "GoMacro")
@freestanding(codeItem) macro go(error: ParseError, appendComment: Char) = #externalMacro(module: "TokenizerMacros", type: "GoMacro")
@freestanding(codeItem) macro go(error: ParseError, appendComment: String, to: State) = #externalMacro(module: "TokenizerMacros", type: "GoMacro")
@freestanding(codeItem) macro go(error: ParseError, clearComment: State) = #externalMacro(module: "TokenizerMacros", type: "GoMacro")
@freestanding(codeItem) macro go(error: ParseError, emitComment: State) = #externalMacro(module: "TokenizerMacros", type: "GoMacro")
@freestanding(codeItem) macro go(error: ParseError, appendTagName: Char) = #externalMacro(module: "TokenizerMacros", type: "GoMacro")
@freestanding(codeItem) macro go(error: ParseError, createAttr: Char, to: State) = #externalMacro(module: "TokenizerMacros", type: "GoMacro")
@freestanding(codeItem) macro go(error: ParseError, appendAttrName: Char) = #externalMacro(module: "TokenizerMacros", type: "GoMacro")
@freestanding(codeItem) macro go(error: ParseError, appendAttrValue: Char) = #externalMacro(module: "TokenizerMacros", type: "GoMacro")
@freestanding(codeItem) macro go(error: ParseError, emitTag: State) = #externalMacro(module: "TokenizerMacros", type: "GoMacro")
@freestanding(codeItem) macro go(error: ParseError, createDOCTYPE: Char, to: State) = #externalMacro(module: "TokenizerMacros", type: "GoMacro")
@freestanding(codeItem) macro go(error: ParseError, appendDOCTYPEName: Char) = #externalMacro(module: "TokenizerMacros", type: "GoMacro")
@freestanding(codeItem) macro go(error: ParseError, appendPublicID: Char) = #externalMacro(module: "TokenizerMacros", type: "GoMacro")
@freestanding(codeItem) macro go(error: ParseError, clearPublicID: State) = #externalMacro(module: "TokenizerMacros", type: "GoMacro")
@freestanding(codeItem) macro go(error: ParseError, appendSystemID: Char) = #externalMacro(module: "TokenizerMacros", type: "GoMacro")
@freestanding(codeItem) macro go(error: ParseError, clearSystemID: State) = #externalMacro(module: "TokenizerMacros", type: "GoMacro")
@freestanding(codeItem) macro go(error: ParseError, forceQuirks: State) = #externalMacro(module: "TokenizerMacros", type: "GoMacro")
@freestanding(codeItem) macro go(error: ParseError, emitForceQuirksDOCTYPE: State) = #externalMacro(module: "TokenizerMacros", type: "GoMacro")
@freestanding(codeItem) macro go(error: ParseError, emitNewForceQuirksDOCTYPE: State) = #externalMacro(module: "TokenizerMacros", type: "GoMacro")
