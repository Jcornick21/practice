=begin
 I have a thousand documents
 and 5 keywords. How can I print the documents
 that have all five keywords?
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


# keywords = {
#   # I dont know if putting empty
#   # hashes impacts being able to insert documents as keys

#   hero: {}
#   adventure: {}
#   sacrifice: {}
#   individuals:{}
#   good: {}
# };

# trying to pull outside txt files and read them

# documents = [createIndex.txt, createIndex_1.txt, createIndex_2.txt];

# def index(documents,keywords)
#   documents.each do |document|


#     f = File.open(document, r)
#     f.each_line { |line|
#       puts line.Class
#       keywords.each do |key, value|
#       if line.include(key)
#         keyword[key] = value[document]
#       end
#     }
#     f.close
#     document.
#   end

# end

# Trying to use hashes as the storage for the list of documents

# def index (documents,keywords)
#   documents.each do |document|
#     keywords.each do |key, value|
#       # puts "THIS IS THE KEY #{key} \n THIS IS THE VALUE #{value}"

#       if document.has_key?(key)
#         value.each do |k, v|
#           value[k] = document[:title]
#           value[v] = 1
#         end
#         # keywords[key] = keywords[key][value] => 
#         # puts "#{document[:title]} made it to #{keywords[key]}"
#       # else
#       #   value[document[:title]]
#       end
#       puts "#{keywords[value]}"

#     end
#   end

# end


# keywords_1 = {
#   # I dont know if putting empty
#   # hashes impacts being able to insert documents as keys

#   hero: [],
#   adventure: [],
#   sacrifice: [],
#   individuals: [],
#   good: []
# };

# documents_in_file = [
#   {
#   title: "The Riddle and The Rune summary",
#   good: 10,
#   lost: 5,
#   sacrifice: 18,
#   adventure: 2,
#   bravery: 12
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
#   bravery: 12
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

# def index (documents,keywords)
  
#   documents.each do |document|
#     keywords.each do |key, value|
#       if document.has_key?(key)
#         value.push(document[:title])
#       end
#     end
#   end

#   # now I have a list of what keywords show up in what documents
#   # I need to find the document that appears in each keyword document list

#   puts keywords

#   i = 0
#   first_doc = documents[i][:title];
#   frequency = 0;
#   print_array = [];

#   while i != keywords.length
#     if i != documents.length
#       first_doc = documents[i][:title];
#     else
#       first_doc = documents.last[:title];
#     end
    
#       keywords.each do |k, v|
#         puts "THIS IS FIRST_DOC #{first_doc}"
        
#         if v.include?(first_doc)
#           frequency += 1;
#         else
#           frequency = 0
#           break;
#         end
#       end

#       if frequency == keywords.length && i <= documents.length
#         print_array.push(first_doc)
#       end 
#       i += 1


#       puts i
#       puts "THIS IS THE FREQUENCY #{frequency}"
#       puts "KEYWORD LENGTH #{keywords.length}"
#       puts "Document LENGTH #{documents.length}"
#   end
#   puts "#{print_array}"

#   # This works but needs to be refactored badly
#   # What happens if the list of documents is longer than the list of keywords
#   # intersection between n lists n= keywords

# end



# index(documents_in_file,keywords_1)


keywords_1 = {};

all_documents = [
  {
  title: "The Riddle and The Rune summary",
  good: 10,
  lost: 5,
  sacrifice: 18,
  adventure: 2,
  bravery: 12
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
  bravery: 12
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
  # puts index
  return index
end

def search (keywords, index)
  document_list = {}

  # for each keyword I want to know if it 
  # exists within the index
  # If it does exist within the index I want 
  # to print the value of that keyword

  # I implemented the algorithm inneficiently by not producing a list of documents with a set keyword then searching only those documents for the next one
  keywords.each do |keyword|
    if index.include?(keyword)
      # for each keyword found in the index
      # I want to look at each value for that keyword
      # and assign it a number value
      index[keyword].each do |document|
        if document_list[document]
          document_list[document] += 1
        else
          document_list[document] = 1
          
        end
      end

    end
  end

# puts "THIS IS DOCUMENT LIST: #{document_list}"
sort(document_list, keywords)
end

def sort(doc_list,keywords)
  # this should generate the first set of prefiltered
  print_list = []
  if doc_list.has_value?(keywords.length)
    doc_list.each do |k, v|
      if v == keywords.length
        print_list.push(k)
      end
    end
  end
  return print_list

end

def intersect(list_1, list_2)
  # this can probably be done with binary search
  intersection_list = []
  #  measure the length of each of the lists and use the shorter one for the first loop

  list_1.each do |word|
    if list_2.include?(word)
      intersection_list.push(word)
    end
  end

  puts "INTERSECTION LIST #{intersection_list}"
  return intersection_list

end

def print_search_result (keywords,index)
  results = search(keywords,index)
   puts "Query: #{keywords}"
   puts " Results: #{results}"
end

def main(documents)
  index = build_index(documents)
  # when build_index runs I have a list of what words show up in what documents
  # I need to find the keywords I input within that index and print out that keywords values
  # Then I can compare those values and pull out the unique elements
  # the search funtion should do this
  print_search_result(["good","hero"], index)
  print_search_result(["good"],index)
  print_search_result(["blah"],index)
  print_search_result(["good","lost","sacrifice","hero", "adventure", "bravery"],index)
  print_search_result(["good","lost","sacrifice","hero", "adventure"],index)
  print_search_result([],index)


end

list_1=[1,2,3,]
list_2=[1,2,4,]

# list_1=[1,2,3,5]
# list_2=[9,7,4,6]

# list_1=[9,7,2,4]
# list_2=[9,7,2,4,1,0]



intersect(list_1,list_2)

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

apple => 1,2,3
banana => 1,4,5
cherry => 1,2,5

search the index then that produces a list
produce another list and then intersect the two lists I have
so that they produce another list
then search that list

Think about making a function that takes a query and expected results(creating a basic unit test)
=end