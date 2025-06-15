map global normal m h
map global normal M H
map global normal <a-m> <a-h>
map global normal <a-M> <a-H>
map global normal n j
map global normal <a-n> <a-j>
map global normal <a-N> <a-J>
map global normal e k
map global normal i l
map global normal I L
map global normal <a-i> <a-l>
map global normal <a-I> <a-L>
map global normal j n
map global normal <a-j> <a-n>
map global normal <a-J> <a-N>
map global normal J N
map global normal t i
map global normal <a-l> <a-i>
map global normal <a-L> <a-I>
map global normal k e
map global normal K E
map global normal <a-e> <a-k>
map global normal <a-k> <a-e>
map global normal <a-E> <a-K>
map global normal <a-K> <a-E>

map global goto m h -docstring 'line start'
map global goto n j -docstring 'buffer bottom'
map global goto e k -docstring 'buffer top'
map global goto i l -docstring 'line end'
map global goto l i -docstring 'line non blank start'
map global goto h e -docstring 'buffer end'

map global view h m -docstring 'center cursor (horizontally)'
map global view m h -docstring 'scroll left'
map global view m j -docstring 'scroll down'
map global view m k -docstring 'scroll up'
map global view m l -docstring 'scroll right'


# Select whole lines when moving selection with J or K
map global normal N J<a-x>
map global normal E K<a-x>

# Make I insert before every line
map global normal T "<a-s>I"

map global normal l t
map global normal L T
