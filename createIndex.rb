=begin
 I have a thousand documents
 and (n) number of  keywords. How can I print the documents
 that have all (n) keywords?
=end

=begin
:TODO write about this in notes
How can and do we use indexes

I can  make an index of the all documents.
I can then use that index to power a search that will
take my input. In this case the input are words and return
all the documents that have the input/words
Is an index a histogram?
Go through each document and search for the 
keyword if the keyword exists in that document 
then add the document Id to that keywords 
list of documents that include it.

=end


# going through each document
# make this a resuable piece how can I do this?
# what kind of data structure do  I expect the document to be?
# how can I read a document from another file?

keywords_1 = {};

all_documents = [
  {
  title: "The Riddle and The Rune summary",
  good: 10,
  lost: 5,
  sacrifice: 18,
  adventure: 2,
  bravery: 12,
  kid: 2
 },

 {
  title: "Harry Potter summary",
  individuals: 10,
  lost: 5,
  sacrifice: 18,
  adventure: 2,
  evil: 12,
  hero: 25,
  good: 13
 },

 {
  title: "The Waves Crashed",
  flowers: 10,
  lost: 5,
  patience: 18,
  seasons: 2,
  bravery: 12,
  kid: 10
 },

 {
  title: "TJ and the Alley Cat",
  good: 10,
  kid: 5,
  poor: 18,
  cat: 2,
  evil: 12,
  food: 25,
  dark: 13
 }

]

def build_index(documents)
  index = {}
  documents.each do |document| 
    document.each do |key, value| 
      keyword = key.to_s

      if !(keyword == 'title')
        # if the keyword does exist in the index hash
        # then add its document to the list of values
        if index[keyword]
          index[keyword].push(document[:title])
        else
          # if the keyword does not exist in the index hash
        # then add it and the document to the hash
        index[keyword] = [document[:title]]
        end
        # this below was a test to make sure what was written in this function worked like a unit test
        # puts " TITLE: #{document[:title]} WORD: #{key}"
      end
    end
  end
  # puts " This is the index #{index}"
  return index
end

def search (keywords, index)
  if keywords.length < 1 || keywords == nil
    return "please enter a valid keyword"
  end
  present_in_index_list = []
  keywords.each do |keyword|
      # This builds a list of key value pairs for keywords that exist in the index
      if index.include?(keyword)
        present_in_index_list.push(index[keyword])
      else
        return "Matches for all those keywords do not exist"
      end
    end
    pointer = 2
    if present_in_index_list.length >= 2
    intersection = intersect(present_in_index_list[0], present_in_index_list[1])
    while pointer != present_in_index_list.length
      new_intersection = intersect(intersection, present_in_index_list[pointer])
      pointer += 1
      intersection = new_intersection
    end
  else
    intersection = present_in_index_list
  end
    # puts "Intersection #{intersection}"
    return intersection
end

def intersect(list_1, list_2)
    
  # this can probably be done with binary search
  intersection_list = []
  list_1_length = list_1.length
  list_2_length = list_2.length

  # puts list_1_length == 0 && list_2_length == 0 ? "No matches found": ""

  if list_1_length == 0
    return intersection_list 
  elsif list_2_length == 0
      return intersection_list 
  end
  
 #  measure the length of each of the lists and use the shorter one for the first loop
  shorter = nil
  longer = nil
  if list_1_length >= list_2_length
    shorter = list_2
    longer = list_1
  else
    shorter = list_1
    longer = list_2
  end
 
  shorter.each do |word|
    if longer.include?(word) && !(intersection_list.include?(word))
      intersection_list.push(word)
    end
  end
  puts "INTERSECTION LIST #{intersection_list}"
  return intersection_list

end

def print_search_result (keywords,index)
  results = search(keywords,index)
   puts "Query: #{keywords}"
   puts "Results: #{results}"
end

def main(documents)
  index = build_index(documents)
  # when build_index runs I have a list of what words show up in what documents
  # I need to find the keywords I input within that index and print out that keywords values
  # Then I can compare those values and pull out the unique elements
  # the search funtion should do this
  # print_search_result(["good","hero"], index) #hp summary
  # print_search_result(["lost"], index) #hp summary, waves, Riddle and the Rune
  # print_search_result(["good","lost"], index) #hp summary, Riddle 
  # print_search_result(["good"],index)# Riddle, HP summary, TJ
  # print_search_result(["blah"],index)# no match short circuited at the index search
  # print_search_result(["good","lost","sacrifice","hero", "adventure", "bravery"],index)# empty
  # print_search_result(["good","lost","sacrifice","hero", "adventure"],index)#hp summary
  # print_search_result([],index)#empty
end

# all_documents = [
#   {
#   title: "The Riddle and The Rune summary",
#   good: 10,
#   lost: 5,
#   sacrifice: 18,
#   adventure: 2,
#   bravery: 12,
#   kid: 2
#  },

#  {
#   title: "Harry Potter summary",
#   individuals: 10,
#   lost: 5,
#   sacrifice: 18,
#   adventure: 2,
#   evil: 12,
#   hero: 25,
#   good: 13
#  },

#  {
#   title: "The Waves Crashed",
#   flowers: 10,
#   lost: 5,
#   patience: 18,
#   seasons: 2,
#   bravery: 12,
#   kid: 10
#  },

#  {
#   title: "TJ and the Alley Cat",
#   good: 10,
#   kid: 5,
#   poor: 18,
#   cat: 2,
#   evil: 12,
#   food: 25,
#   dark: 13
#  }

# ]

list_1=[1,2,3,]
list_2=[1,2,4,]

list_3=[1,2,3,5]
list_4=[9,7,4,6]

list_5=[9,7,2,4]
list_6=[9,7,2,4,1,0]

list_7=[]
list_8=[3,9,4,1]

intersect(list_1,list_2)
intersect(list_3,list_4)
intersect(list_5,list_6)
intersect(list_7,list_8)

# main(all_documents)

# what is my query what is the intersection that query requires me to search?

# Short circuiting
=begin
benefit to creating the index is to allows you to create the sets that you want to search 
create Intersect function() that returns a newlist
we have created am inverted/reverse  index
Reduce the problem as much and as quickly as possible
Intersection Algorithm
binary search

What are the characteristics of this problem that make the solution this/doit this way?

Initializing variables  and changing them based on a condition

apple => 1,2,3
banana => 1,4,5
cherry => 1,2,5

search the index then that produces a list
produce another list and then intersect the two lists I have
so that they produce another list
then search that list

Think about making a function that takes a query and expected results(creating a basic unit test)
=end