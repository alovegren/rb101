numbers = [1, 2, 3, 4, 5]

numbers.delete_at(1)
# #delete_at(n) deletes the object within an array at index n. We exoect ths method call to return 2, the element at index 1 within numbers. This is a mutating method.

numbers = [1, 2, 3, 4, 5]

numbers.delete(1)
# #delete deletes the object specified as the method's argument. We expect this method call to return 1, the specifically identified deleted object. This is a mutating method.