### ITERATIVE ###

def fibs(n)
  prev = 0
  current = 1

  for i in 0..n do
    if (i == 0)
      p 0
      next
    end

    p current

    return if i == n

    temp = prev + current
    prev = current
    current = temp
  end
end

fibs(10)

### RECURSIVE ###

def fibs_rec(n)
  n < 2 ? n : fibs_rec(n-1) + fibs_rec(n-2)
end

def print_fibs(n)
  for i in 0..n do
    p fibs_rec(i)
  end
end

print_fibs(10)
