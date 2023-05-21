class Pokemon
    attr_accessor :id, :name, :type, :db
    
    def self.save(name, type, db)
        db.excute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
    end

    def self.find(id_num, db)
        pokemon_info = db.excute("SELECT * FROM pokemon WHERE id=?",id_num).flatten
        Pokemon.new(id: pokemon_info[0], name: pokemon_info[1], type: pokemon_info[2])
    end

    def initialize(id:, name:, type:, db:)
        @id, @name, @type, @db = id, name, type, db
    end
end
