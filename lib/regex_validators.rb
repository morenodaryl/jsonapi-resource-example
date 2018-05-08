module RegexValidators
    def self.url
        /\A((https?:)?(\/{0,2}))?([\d\w\.-]+)(?::(\d+))?([\/\\\w\.()-]*)?(?:([?][^#]*)?(#.*)?)*\z/
    end 
end 