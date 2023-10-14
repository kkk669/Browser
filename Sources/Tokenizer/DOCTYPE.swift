public struct DOCTYPE: Equatable {
    public var name: Optional<String>
    public var forceQuirks: Bool

    public init(
        name: consuming String? = nil,
        forceQuirks: consuming Bool = false
    ) {
        self.name = consume name
        self.forceQuirks = consume forceQuirks
    }
}
