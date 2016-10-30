class Matryoshka
  def initialize(matroyoshka = nil)
    @matroyoshka = matroyoshka
  end

  def matroyoshka
    @matroyoshka
  end
end

t = Matryoshka.new()
t1 = Matryoshka.new(t)
t2 = Matryoshka.new(t1)

def search(mat)
  return [] unless mat
  [mat, search(mat.matroyoshka)]
end

def count(mat)
  search(mat).flatten.count
end

puts count(t2)
