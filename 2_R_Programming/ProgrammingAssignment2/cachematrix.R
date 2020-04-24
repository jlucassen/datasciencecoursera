##BASED ON CACHEVECTOR.R, BY RDPENG 
##https://github.com/rdpeng/ProgrammingAssignment2

makeCacheMatrix <- function(x = matrix()) {
  i <- NULL #initially, inverse unknown
  setMatrix <- function(y) { #create set function
    x <<- y
    i <<- NULL #when setting to new matrix, inverse unknown
  }
  getMatrix <<- function() {x} #create get function
  setInverse <- function(inv) {i <<- inv} #set inverse function
  getInverse <- function() {i} #get inverse function
  list(get=getMatrix,set=setMatrix,getInverse=getInverse,setInverse=setInverse) #output vector of functions
}


## Calculates the inverse of x

cacheSolve <- function(x, ...) {
  i <- x$getInverse() #set inverse equal to cached inverse
  if (!is.null(i)) { #if cached, great! return i
    message("getting cached data")
    return(i)
  }
  data <- x$get() #only reached if cached empty: retrieve matrix
  inv <- solve(data) #find inverse
  x$setInverse(inv) #set inverse in cacheMatrix
  inv #return inverse
}
