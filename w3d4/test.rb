require_relative "Class_stack.rb"

# jacob = Stack.new
# p jacob.get
# jacob.push("listen")
# jacob.push("here")
# jacob.push("you")
# jacob.push("little")
# jacob.push("shit")
# p jacob.get
# p jacob.peek
# jacob.pop
# p jacob.get

# jacob = Queue.new
# jacob.enqueue("you")
# jacob.enqueue("have")
# jacob.enqueue("died")
# jacob.enqueue("of")
# jacob.enqueue("dysentry")
# p jacob.dequeue
# p jacob.peek

jacob = Map.new
jacob.set("dog", "sweetie")
jacob.set("dog", "nico")
jacob.set("loveofmylife", "Andrea")
jacob.set("bestfriend", "marty")
jacob.show

p jacob.get("dog")

