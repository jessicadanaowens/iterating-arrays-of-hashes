class Dogs
  POOR      = (0..5).to_a.sample
  AVERAGE   = (6..10).to_a.sample
  EXCELLENT = (11..15).to_a.sample

  def initialize
    joe   = {
      :name => {:first => "Joe", :last=> "Smith"},
      :owner_quality => EXCELLENT
    }
    sarah = {
      :name => {:first => "Sarah", :last => "Darnum"},
      :owner_quality => AVERAGE
    }
    andrew = {
      :name => {:first => "Andrew", :last => "Beter"},
      :owner_quality => AVERAGE
    }

    @dogs = [
      {name: "Fido",     size: :large,  owner: joe},
      {name: "Yapper",   size: :small,  owner: joe},
      {name: "Bruiser",  size: :large,  owner: joe},
      {name: "Tank",     size: :huge,   owner: sarah},
      {name: "Beast",    size: :large,  owner: sarah},
      {name: "Harleigh", size: :medium, owner: andrew},
      {name: "Trixie",   size: :small,  owner: andrew}
    ]
  end


  def small_dogs
    @dogs.select {|dog| dog[:size] == :small}
  end

  def huge_dog
    @dogs.select {|dog| dog[:size] == :huge}[0]
  end

  def large_dogs_names
    large_dog_array = []
    @dogs.each do |value|
      if value[:size] == :large
        large_dog_array.push(value[:name])
      end
    end
    large_dog_array
  end

  def joes_large_dogs
    large_dog_array = []
    @dogs.each do |value|
      large_dog_array.push(value[:name]) if value[:size] == :large && value[:owner] == {:name => {:first => "Joe", :last=> "Smith"},
        :owner_quality => EXCELLENT}
    end
    large_dog_array
  end

  def sizes
    dog_size = []
    @dogs.each do |value|
      dog_size.push(value[:size])
    end
    dog_size.uniq
  end

  def owners
    dog_owners = []
    @dogs.each do |value|
      full_name = value[:owner][:name][:first] + " " + value[:owner][:name][:last]
      unless dog_owners.include?(full_name)
        dog_owners.push(full_name)
      end
    end
    dog_owners
  end

  def average_owners
    return_array = []

    @dogs.each do |value|
      full_name = value[:owner][:name][:first] + " " + value[:owner][:name][:last]
      unless return_array.include?(full_name)
        return_array.push(full_name) if value[:owner][:owner_quality] == AVERAGE
      end
    end
    return_array
  end

  def to_s
    owners = @dogs.group_by {|dog| dog[:owner][:name][:first]}
    output = (owners.map do |owner, dog|
      dogs = dog.map {|d| d[:name]}
      if dogs.length > 2
        "#{owner} owns: #{(dogs[0...-1]).join(", ")}" + ", and #{dogs[-1]}"
      else
        "#{owner} owns: #{dogs.join(" and ")}"
      end
    end)
    output.join("\n")
  end

  def find_by_owner(name)

    @dogs.select { |owner| owner[:owner][:name][:first] == name ||
                      owner[:owner][:name][:last] == name ||
                        owner[:owner][:name][:first] + " " + owner[:owner][:name][:last] == name}
  end

  def change_owner(dog_name)

    owner_name = (@dogs.select {|dog| dog[:name] == dog_name}).map do |owner|
      owner[:owner][:name][:first] + ' ' + owner[:owner][:name][:first]
      end

    all_owners = (@dogs.map { |owner|
      owner[:owner][:name][:first] + ' ' + owner[:owner][:name][:last]}).uniq

    if all_owners[0] == owner_name
      new_owner == all_owners[1]
    else
      new_owner == 'name: ' + all_owners[0]
    end
  end

end






