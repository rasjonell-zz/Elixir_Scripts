defmodule MyList do
  @moduledoc """
  Provides List-related functions

  ## Examples

      iex> MyList.len([1,2,3])
      3

      iex> Mylist.reduce([1,2,3], 0, &(&1 + &2))
      6

      
  """


  def len([]),                  do: 0
  def len([_head | tail]),      do: 1 + len(tail)

  def square([]),               do: []
  def square([head | tail]),    do: [head * head | square(tail)]

  def add_one([]),              do: []
  def add_one([head | tail]),   do: [head + 1 | add_one(tail)]

  # Generalizing the function above

  def map([], _func),           do: []
  def map([head | tail], func), do: [func.(head) | map(tail, func)]


  # Keeping track of values during recursion

  def sum(list),                     do: _sum(list, 0)

  # private function
  defp _sum([], total),              do: total
  defp _sum([head | tail], total),   do: _sum(tail, head + total)


  # Simpler solution for sum
  def sum_list([]),                  do: 0
  def sum_list([head | tail]),       do: head + sum(tail)


  # Reduce Function

  def reduce([], value, _),               do: value
  def reduce([head | tail], value, func), do: reduce(tail, func.(head, value), func)


  # mapsum

  def mapsum([], _),                do: 0
  def mapsum([head | tail], func),  do: func.(head) + mapsum(tail, func)


  # Max of a list

  def max([x]), do: x
  def max([head | tail]), do: Kernel.max(head, max(tail))


  # Something

  def caesar(list, n) do
    map(list, &(Kernel.min(&1 + n, 122)))
  end


  # Swap elements

  def swap([]), do: []
  def swap([a, b | tail]), do: [b, a | swap(tail)]
  def swap([_]), do: raise "Error"


  # Span

  def span(from, to) when from == to, do: []
  def span(from, to), do: [from | span(from+1, to)]

end
